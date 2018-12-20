/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Daos.DaoInquilino;
import antlr.StringUtils;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno Arley
 */
@WebServlet(name = "Inq_Consulta", urlPatterns = {"/Inq_Consulta"})
public class Inq_Consulta extends HttpServlet {

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

            String cpf = request.getParameter("cpf");
         
            DaoInquilino dao_cli = new DaoInquilino();
            boolean compare = false;
            
            for (int i = 0; i < dao_cli.listar().size(); i++) {

                if (cpf.equals(dao_cli.listar().get(i).getInq_cpf())) {

                    compare = true;
                    i = dao_cli.listar().size();

                } else {
                    compare = false;
                }

            }


            if (compare == false) {

                boolean valida = false;

                for (int i = 0; i < cpf.length(); i++) {
                    if (!Character.isDigit(cpf.charAt(i))) {
                        valida = true;
                        i = cpf.length();
                    } else {
                        valida = false;

                    }
                }

                if (valida == true) {

                    request.getSession().setAttribute("Mensagem5", "* CPF Invalido.");
                } else {
                    request.getSession().setAttribute("Mensagem5", "* Inquilino não cadastrado.");

                }

                response.sendRedirect("Views/Login_Inquilino.jsp");
            } else {
                request.getSession().setAttribute("cpf", cpf);
                request.getRequestDispatcher("Views/Painel_Inquilino.jsp").forward(request, response);

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
