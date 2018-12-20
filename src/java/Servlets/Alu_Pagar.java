/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.Aluguel;
import Classes.Endereco;
import Classes.Imovel;
import Classes.Inquilino;
import Classes.Relatorio;
import Classes.Usuario;
import Daos.DaoAluguel;
import Daos.DaoEndereco;
import Daos.DaoImovel;
import Daos.DaoInquilino;
import Daos.DaoRelatorio;
import Daos.DaoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bruno Arley
 */
@WebServlet(name = "Alu_Pagar", urlPatterns = {"/Alu_Pagar"})
public class Alu_Pagar extends HttpServlet {

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
            
           Aluguel aluguel = new Aluguel();
            DaoAluguel alu = new DaoAluguel();
            Inquilino inquilino = new Inquilino();
            DaoInquilino inq = new DaoInquilino();
            Usuario usuario = new Usuario();
            DaoUsuario usu = new DaoUsuario();
            Endereco endereco = new Endereco();
            DaoEndereco end = new DaoEndereco();
            
            try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
             } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
            Imovel imovel = new Imovel();
            DaoImovel imo = new DaoImovel();
           
            int cod_alu = Integer.parseInt(request.getParameter("cod_alu"));
            
            aluguel =  alu.buscar(cod_alu);
            
            
            imovel = imo.buscar(aluguel.getAlu_imo_cod());
            endereco = end.buscar(imovel.getImo_cod_end());
            inquilino = inq.buscar(aluguel.getAlu_inq_cod());
            
            Relatorio relatorio = new Relatorio();
            DaoRelatorio rel = new DaoRelatorio();
            
            GregorianCalendar calendar = new GregorianCalendar();
            int dia = calendar.get(GregorianCalendar.DAY_OF_MONTH);
            int mes = calendar.get(GregorianCalendar.MONTH) +1;
            int ano = calendar.get(GregorianCalendar.YEAR);
            
            relatorio.setRel_alu_preco(""+aluguel.getAlu_preco());
            relatorio.setRel_endereco(endereco.getEnd_rua()+"<br>Numero : "+endereco.getEnd_numero()+"<br>Cidade : "+endereco.getEnd_cidade());
            relatorio.setRel_inq_cpf(inquilino.getInq_cpf());
            relatorio.setRel_inq_pagamento(true);
            relatorio.setRel_ano(ano);
            relatorio.setRel_mes(mes);
            relatorio.setRel_usu_cod(usuario.getUsu_cod());
            relatorio.setRel_inq_nome(inquilino.getInq_nome());
            
            
            
            rel.cadastra(relatorio);
            
            aluguel.setAlu_pagamento(true);
            alu.altera(aluguel);
            
           request.getSession().setAttribute("Mensagem", "Aluguel Pago com Sucesso");
           request.getSession().setAttribute("Link","Painel_Aluguel.jsp");
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
