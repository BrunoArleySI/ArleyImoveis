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
import Classes.Usuario;
import Daos.DaoAluguel;
import Daos.DaoEndereco;
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
@WebServlet(name = "Usu_Exclui", urlPatterns = {"/Usu_Exclui"})
public class Usu_Exclui extends HttpServlet {

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
            
            
            //----------------------------------------------- Daos e Objetos
            Aluguel aluguel = new Aluguel();
            Imovel imovel = new Imovel();
            Endereco endereco = new Endereco();
            Usuario usuario = new Usuario();
            Inquilino inquilino = new Inquilino();
            
            
            DaoInquilino inq = new DaoInquilino();
            DaoImovel imo = new DaoImovel();
            DaoEndereco end = new DaoEndereco();
            DaoAluguel alu = new DaoAluguel();
            DaoUsuario usu = new DaoUsuario();
            //------------------------------------------------
            
            
            
            
            
            
            //------------------------------------------------- Recebe paramentro de sessão codigo do usuario
            try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
            } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
            
            //------------------------------------------------------------- Deleta Inquilino
            for(int i = 0; i < alu.listar().size();i++){ 
                if(alu.listar().get(i).getAlu_usu_cod() == usuario.getUsu_cod()){
                    inquilino = inq.buscar(alu.listar().get(i).getAlu_inq_cod());
                    inq.deleta(inquilino);
                    
                    aluguel = alu.buscar(alu.listar().get(i).getAlu_cod());
                    alu.deleta(aluguel);
                    
                    
                }
            }
            
            //------------------------------------------------------------ Deleta Endereco e Imovel
            for(int i = 0; i < imo.listar().size();i++){ 
                if(imo.listar().get(i).getImo_usu_cod() == usuario.getUsu_cod()){
                    
                   endereco = end.buscar(imo.listar().get(i).getImo_cod_end());
                   end.deleta(endereco);
                   
                   imovel = imo.buscar(imo.listar().get(i).getImo_cod());
                   imo.deleta(imovel);
                   
                }
            }
            
            //-------------------------------------------------------------- Deleta Aluguel
            for(int i = 0; i < alu.listar().size();i++){ 
                if(alu.listar().get(i).getAlu_usu_cod() == usuario.getUsu_cod()){
                    inquilino = inq.buscar(alu.listar().get(i).getAlu_inq_cod());
                    inq.deleta(inquilino);
                }
            }
            //--------------------------------------------------------------- Deleta Usuario
            
            usu.deleta(usuario);
            //----------------------------------------------------------------
            
            
            request.getSession().setAttribute("Mensagem", "Usuario Deletado");
            request.getSession().setAttribute("Link","../index.jsp");
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
