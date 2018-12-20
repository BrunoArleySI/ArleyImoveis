/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.Aluguel;
import Classes.Usuario;
import Daos.DaoAluguel;
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
 * @author BrunoArley
 */
@WebServlet(name = "Alu_Reseta_Unico", urlPatterns = {"/Alu_Reseta_Unico"})
public class Alu_Reseta_Unico extends HttpServlet {

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
            DaoUsuario usu = new DaoUsuario();
            Aluguel aluguel = new Aluguel();
            DaoAluguel alu = new DaoAluguel();
            
            try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
             } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
            aluguel = alu.buscar(Integer.parseInt(request.getParameter("cod_alu")));
            
            for (int i = 0; i < alu.listar().size(); i++) {

                if (alu.listar().get(i).getAlu_usu_cod() == usuario.getUsu_cod() && alu.listar().get(i).getAlu_cod()==aluguel.getAlu_cod()) {
                    
                   
                        aluguel=alu.buscar(alu.listar().get(i).getAlu_cod());
                    aluguel.setAlu_pagamento(false);
                    alu.altera(aluguel);
                    
                    
                    
                    
                }
            }
                   

                  

                  

                    request.getSession().setAttribute("Mensagem", "Aluguel resetado com sucesso.");
                    request.getSession().setAttribute("Link", "Painel_Aluguel.jsp");
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
