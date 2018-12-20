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

/**
 *
 * @author Bruno Arley
 */
@WebServlet(name = "Usu_Edita", urlPatterns = {"/Usu_Edita"})
public class Usu_Edita extends HttpServlet {

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
            
             try{
            String cod12325 = (String) request.getSession().getAttribute("usu_cod");
             } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
            
             Usuario usuario = new Usuario();
            DaoUsuario  usu = new DaoUsuario();
            
            usuario.setUsu_email(request.getParameter("email"));
            usuario.setUsu_nome(request.getParameter("nome"));
            usuario.setUsu_senha(request.getParameter("senha"));
            usuario.setUsu_cod(Integer.parseInt(request.getParameter("codigo")));
            
            boolean erro = false;
            
            for(int i =0 ; i< usu.listar().size();i++){
                if(usuario.getUsu_email().equals(usu.listar().get(i).getUsu_email()) && usuario.getUsu_cod()!= usu.listar().get(i).getUsu_cod()){
                request.getSession().setAttribute("Mensagem","<div class=\"alert alert-danger\" role=\"alert\"> Este email ja pertence a outra pessoa.</div>");
                erro = true;
                i=usu.listar().size();
                }
            }
            
            
           
            
            
            if(erro == false){
            usu.altera(usuario);
            request.getSession().setAttribute("Mensagem","<div class=\"alert alert-success\" role=\"alert\"> Dados alterados com Sucesso.</div>");
            response.sendRedirect("Views/Dados_Usuario.jsp");
            }else{
                response.sendRedirect("Views/Dados_Usuario.jsp");
                
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
