/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Classes.Aluguel;
import Classes.Imovel;
import Classes.Inquilino;
import Classes.Usuario;
import Daos.DaoAluguel;
import Daos.DaoImovel;
import Daos.DaoInquilino;
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
@WebServlet(name = "Alu_Cadastra", urlPatterns = {"/Alu_Cadastra"})
public class Alu_Cadastra extends HttpServlet {

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

            Aluguel aluguel = new Aluguel();
            DaoAluguel alu = new DaoAluguel();
            Inquilino inquilino = new Inquilino();
            DaoInquilino inq = new DaoInquilino();
            Usuario usuario = new Usuario();
            DaoUsuario usu = new DaoUsuario();

            try {
                String cod = (String) request.getSession().getAttribute("usu_cod");
                usuario = usu.buscar(Integer.parseInt(cod));
            } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }

            Imovel imovel = new Imovel();
            DaoImovel imo = new DaoImovel();
            String cod_imo = "";
            
            cod_imo = request.getParameter("cod_imo");
           
                
            
            imovel.setImo_cod(Integer.parseInt(cod_imo.replace(" ", "")));

            if (inq.listar().size() == 0) {
                inquilino.setInq_cod(inq.listar().size() + 1);
            } else {

                inquilino.setInq_cod(inq.listar().get(inq.listar().size() - 1).getInq_cod() + 1);

            }

            inquilino.setInq_cpf(request.getParameter("cpf"));
            inquilino.setInq_email(request.getParameter("email"));
            inquilino.setInq_nome(request.getParameter("nome"));
            inquilino.setInq_idade(request.getParameter("idade"));

            aluguel.setAlu_cod(alu.listar().size() + 1);

            String dia;
            dia = request.getParameter("dia");

            aluguel.setAlu_dia_pagamento(Integer.parseInt(dia.replace(" ", "")));
            aluguel.setAlu_end_cod(0);
            aluguel.setAlu_imo_cod(imovel.getImo_cod());
            aluguel.setAlu_inq_cod(inquilino.getInq_cod());
            aluguel.setAlu_usu_cod(usuario.getUsu_cod());
            aluguel.setAlu_preco(Float.parseFloat(request.getParameter("preco")));
            aluguel.setAlu_pagamento(false);

            
           
           
           
           
              //------------------------------------------------------------------------- Valida cpf
              String strCpf = request.getParameter("cpf").replaceAll("[.-]", "") ;
              int     d1, d2;
	      int     digito1, digito2, resto;
	      int     digitoCPF;
	      String  nDigResult;

	      d1 = d2 = 0;
	      digito1 = digito2 = resto = 0;
              
	      for (int nCount = 1; nCount < strCpf.length() -1; nCount++)
	      {
	         digitoCPF = Integer.valueOf (strCpf.substring(nCount -1, nCount)).intValue();

	         d1 = d1 + ( 11 - nCount ) * digitoCPF;

	         d2 = d2 + ( 12 - nCount ) * digitoCPF;
	      };

	      resto = (d1 % 11);

	      if (resto < 2)
	         digito1 = 0;
	      else
	         digito1 = 11 - resto;

	      d2 += 2 * digito1;

	      resto = (d2 % 11);

	      if (resto < 2)
	         digito2 = 0;
	      else
	         digito2 = 11 - resto;

	      String nDigVerific = strCpf.substring (strCpf.length()-2, strCpf.length());

	      nDigResult = String.valueOf(digito1) + String.valueOf(digito2);
              //------------------------------------------------------------------------- Fim do valida cpf
	       
	   
           
           
           
           
           
           
             if(nDigVerific.equals(nDigResult)){
                 
                inq.cadastra(inquilino);
                alu.cadastra(aluguel);
                 
                request.getSession().setAttribute("Mensagem", "Aluguel Cadastrado com Sucesso");
                request.getSession().setAttribute("Link", "Painel_Aluguel.jsp");
                response.sendRedirect("Views/Status_Imovel.jsp");
            }else{
                request.getSession().setAttribute("Mensagem", "Seu cpf é invalido tente novamente.");
                request.getSession().setAttribute("Link", "Cadastra_Aluguel.jsp");
                response.sendRedirect("Views/Status_Imovel.jsp");
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

    private int strToInt(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
