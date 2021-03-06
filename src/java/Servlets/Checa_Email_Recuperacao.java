/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.Usuario;
import Daos.DaoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.EnviarEmail;

/**
 *
 * @author BrunoArley
 */
@WebServlet(name = "Checa_Email_Recuperacao", urlPatterns = {"/Checa_Email_Recuperacao"})
public class Checa_Email_Recuperacao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String mensagemUsuario = null;

            if (request.getMethod().equals("POST")) {
                EnviarEmail enviar = new EnviarEmail();
                enviar.setEmailDestinatario("");
                enviar.setAssunto("Arley Imóveis");
                //uso StringBuffer para otimizar a concatenação 
                //de string
                StringBuffer texto = new StringBuffer();
                texto.append("<h2 align='center'></h2>");
                texto.append("");
                texto.append("");
                texto.append(request.getParameter("txtNomeSoftware"));
                texto.append("");
                texto.append("");
                texto.append(request.getParameter("txtNomeContato"));
                texto.append("");
                texto.append("");
                texto.append(request.getParameter("txtEmail"));
                texto.append("");
                texto.append("");
                texto.append(request.getParameter("txtUrl"));

                enviar.setMsg(texto.toString());

                Usuario usuario = new Usuario();
                DaoUsuario usu = new DaoUsuario();
                String email = request.getParameter("email");
                boolean valida = false;
                for (int i = 0; i < usu.listar().size(); i++) {
                String senha;
                    if (usu.listar().get(i).getUsu_email().equals(email)) {
                        senha = usu.listar().get(i).getUsu_senha();
                        boolean enviou = enviar.enviarHotmail(email,senha);
                        if (enviou) {
                            request.getSession().setAttribute("Mensagem6", "Um email foi enviado para sua conta com uma senha de acesso !");
                            request.getSession().setAttribute("Mensagem", "Um email foi enviado para sua conta com uma senha de acesso !");

                            request.getSession().setAttribute("Link", "Recupera_Senha.jsp");
                            response.sendRedirect("Views/Status_Imovel.jsp");
                        } else {
                            request.getSession().setAttribute("Mensagem", "Não foi possivel enviar email de recuperação");
                            request.getSession().setAttribute("Link", "Recupera_Senha.jsp");
                            response.sendRedirect("Views/Status_Imovel.jsp");

                        }
                        valida = true;
                        i = usu.listar().size();
                    } else {

                    }

                }

                if (valida == false) {
                    request.getSession().setAttribute("Mensagem", "Este email não está cadastrado.");

                    request.getSession().setAttribute("Link", "Recupera_Senha.jsp");
                    response.sendRedirect("Views/Status_Imovel.jsp");

                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
