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
import Classes.TipoImovel;
import Classes.Usuario;
import Daos.DaoAluguel;
import Daos.DaoEndereco;
import Daos.DaoImovel;
import Daos.DaoInquilino;
import Daos.DaoTipoImovel;
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
@WebServlet(name = "Imo_Exclui", urlPatterns = {"/Imo_Exclui"})
public class Imo_Exclui extends HttpServlet {

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

            //-------------------------------------------------------------------------
            DaoTipoImovel ti = new DaoTipoImovel();
            TipoImovel tipo = new TipoImovel();
            DaoImovel imo = new DaoImovel();
            Imovel imovel = new Imovel();
            DaoAluguel alu = new DaoAluguel();
            Aluguel aluguel = new Aluguel();
            DaoInquilino inq = new DaoInquilino();
            DaoUsuario usu = new DaoUsuario();
            Usuario usuario = new Usuario();
            Endereco endereco = new Endereco();
            DaoEndereco end = new DaoEndereco();
            Inquilino inquilino = new Inquilino();

            
             try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
             } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
            
            
            int cod = Integer.parseInt(request.getParameter("cod"));

            imovel = imo.buscar(cod);

            endereco = end.buscar(imovel.getImo_cod_end());

            boolean valida_imovel = true;
            for (int i = 0; i < alu.listar().size(); i++) {
                if (alu.listar().get(i).getAlu_imo_cod() == imovel.getImo_cod()) {
                    valida_imovel = false;
                    i = alu.listar().size();
                }

            }

            if (valida_imovel) {

                end.deleta(endereco);
                imo.deleta(imovel);
                request.getSession().setAttribute("Mensagem", "Imóvel foi excluido com sucesso");
                request.getSession().setAttribute("Link", "Painel_Imovel.jsp");
                response.sendRedirect("Views/Status_Imovel.jsp");

            }else{
                
                request.getSession().setAttribute("Mensagem", "Impossivel excluir o imóvel, pois está alugado");
                request.getSession().setAttribute("Link", "Painel_Imovel.jsp");
                response.sendRedirect("Views/Status_Imovel.jsp");
                
            }

            //-------------------------------------------------------------------------
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
