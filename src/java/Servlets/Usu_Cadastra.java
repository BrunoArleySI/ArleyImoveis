/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.TipoImovel;
import Classes.Usuario;
import Daos.DaoTipoImovel;
import Daos.DaoUsuario;
import Hibernate.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Bruno Arley
 */
@WebServlet(name = "Usu_Cadastra", urlPatterns = {"/Usu_Cadastra"})
public class Usu_Cadastra extends HttpServlet {

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
            
             Usuario usuario = new Usuario();
            DaoUsuario  usu = new DaoUsuario();
            
            DaoTipoImovel tipo_imovel = new DaoTipoImovel();
            //-----------------------------------------------
            
            if(usu.listar().size()==0 && tipo_imovel.listar().size()==0){
                
            
            TipoImovel tipo = new TipoImovel();
            DaoTipoImovel ti = new DaoTipoImovel();
            
            tipo.setTi_desc("Casa");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Prédio");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Apartamento");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Galpão");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Ponto Comercial");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Igreja");
            ti.cadastra(tipo);
            
            
            tipo.setTi_desc("Salão");
            ti.cadastra(tipo);
            }
            //--------------------------------------------------
            
            
            
            
           
            usuario.setUsu_email(request.getParameter("email"));
            usuario.setUsu_nome(request.getParameter("nome"));
            usuario.setUsu_senha(request.getParameter("senha"));
            
            
            boolean erro = false;
            
            for(int i =0 ; i< usu.listar().size();i++){
                if(usuario.getUsu_email().equals(usu.listar().get(i).getUsu_email())){
                request.getSession().setAttribute("Mensagem","<div class=\"alert alert-danger\" role=\"alert\"> * Este email ja foi cadastrado</div>");
                erro = true;
                i=usu.listar().size();
                }
            }
            
            
            if(usuario.getUsu_email().equals("")||usuario.getUsu_nome().equals("")||usuario.getUsu_senha().equals("")){
                request.getSession().setAttribute("Mensagem","<div class=\"alert alert-danger\" role=\"alert\"> * Preencha todos os campos</div>");
                erro = true;
            }
            
            
            
            if(erro == false){
            usu.cadastra(usuario);
            request.getSession().setAttribute("Mensagem","<div class=\"alert alert-success\" role=\"alert\"> Senhor "+usuario.getUsu_nome()+" você foi cadastrado com sucesso.</div>");
            response.sendRedirect("Views/Area_Funcionario.jsp");
            }else{
                response.sendRedirect("Views/Area_Funcionario.jsp");
                
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
