/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.Endereco;
import Classes.Imovel;
import Classes.Usuario;
import Daos.DaoEndereco;
import Daos.DaoImovel;
import Daos.DaoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno
 */
@WebServlet(name = "Imo_Edita", urlPatterns = {"/Imo_Edita"})
public class Imo_Edita extends HttpServlet {

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
            
            /* TODO output your page here. You may use following sample code. */
            Imovel imovel = new Imovel();
            DaoImovel imo = new DaoImovel();
            Endereco endereco = new Endereco();
            DaoEndereco end = new DaoEndereco();
            Usuario usuario = new Usuario();
            DaoUsuario usu = new DaoUsuario();
            
            
            try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
             } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
             
            
            
          
            
            imovel = imo.buscar(Integer.parseInt(request.getParameter("codigo")));
            
            
            imovel.setImo_tipo_cod( Integer.parseInt(request.getParameter("tipo")));
            imovel.setImo_desc(request.getParameter("descricao"));
            imovel.setImo_usu_cod(usuario.getUsu_cod());
            imovel.setImo_valor(Float.parseFloat(request.getParameter("valor")));
            
            
            
            
            endereco.setEnd_cod(imovel.getImo_cod_end());
            
            endereco.setEnd_cep(request.getParameter("cep"));
            endereco.setEnd_cidade(request.getParameter("cidade"));
            endereco.setEnd_estado(request.getParameter("estado"));
            endereco.setEnd_numero(request.getParameter("numero"));
            endereco.setEnd_bairro(request.getParameter("bairro"));
            endereco.setEnd_rua(request.getParameter("rua"));
            
            
            endereco.setEnd_cod(imovel.getImo_cod_end());
            
            
             
            
            
            
           
            imo.altera(imovel);
            end.altera(endereco);
             
            
            
            request.getSession().setAttribute("Mensagem", "Dados Editados com sucesso");
            request.getSession().setAttribute("Link","Painel_Imovel.jsp");
            response.sendRedirect("Views/Status_Imovel.jsp");
            
            
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
