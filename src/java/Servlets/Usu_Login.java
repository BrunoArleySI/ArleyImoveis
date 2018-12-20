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
@WebServlet(name = "Usu_Login", urlPatterns = {"/Usu_Login"})
public class Usu_Login extends HttpServlet {

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

            
            Usuario usuario = new Usuario();
            DaoUsuario usu = new DaoUsuario();

            usuario.setUsu_email(request.getParameter("email"));
            usuario.setUsu_senha(request.getParameter("senha"));
            
            boolean valida = false;
            
            
            
            
            
            
            
            if (usuario.getUsu_email().equals("") || usuario.getUsu_senha().equals("")) {
                request.getSession().setAttribute("Mensagem2", "<div class=\"alert alert-danger\" role=\"alert\"> * Preencha todos os campos</div>");
                response.sendRedirect("Views/Area_Funcionario.jsp");
                valida = false;
            
            
            } else {
                    
                    boolean valida_email = false;
                    Usuario  usuario_valida =  new Usuario();
        
                 
                    usuario_valida =  usu.buscar_email(usuario.getUsu_email());
                  
                   for(int i = 0 ; i<usu.listar().size();i++){
                       if(usu.listar().get(i).getUsu_email().equals(usuario.getUsu_email())){
                           valida_email = true;
                       }
                       
                   }
                  
                   if( valida_email){
                       
                        if (!usuario_valida.getUsu_email().equals("") && usuario_valida.getUsu_senha().equals(usuario.getUsu_senha()) ) {
                        request.getSession().setAttribute("usu_cod",""+usuario_valida.getUsu_cod()+"");    
                        valida = true;
                    }
                   }
                   
               
                
                
                if(valida ){
                    
                    response.sendRedirect("Views/Painel_Usuario.jsp");
                }else{
                    request.getSession().setAttribute("Mensagem2", "<div class=\"alert alert-danger\" role=\"alert\"> Email ou senha incorretos</div>");
                    response.sendRedirect("Views/Area_Funcionario.jsp");
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
