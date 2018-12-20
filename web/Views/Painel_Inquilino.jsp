<%-- 
    Document   : Painel_Cliente
    Created on : 25/10/2018, 12:36:18
    Author     : Bruno Arley
--%>

<%@page import="Daos.DaoEndereco"%>
<%@page import="Classes.Endereco"%>
<%@page import="Classes.Imovel"%>
<%@page import="Daos.DaoImovel"%>
<%@page import="Classes.Aluguel"%>
<%@page import="Daos.DaoUsuario"%>
<%@page import="Classes.Usuario"%>
<%@page import="Classes.Inquilino"%>
<%@page import="Daos.DaoInquilino"%>
<%@page import="Daos.DaoAluguel"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="Views/css/bootstrap.min.css" rel="stylesheet">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
          <link rel="shortcut icon" href="../SourcesIndex/fav.ico">
        <title>Arley Imóveis</title>




    </head>
    <body style=" background: url('Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          ">

        <%
            String cpf = (String) request.getSession().getAttribute("cpf");
           
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
            for (int i = 0; i < inq.listar().size(); i++) {
                if (inq.listar().get(i).getInq_cpf().equals(cpf)) {
                    inquilino = inq.buscar(inq.listar().get(i).getInq_cod());

                }
            }
            


        %>




    <center>
        <div class="jumbotron" style="box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 80%; border-radius: 15px; top: 7%; left: 10%; position: absolute;">
            <div class="container">

                <img style="width: 300px; padding: auto;" src="Sources/Images/Logo002.png">
                <br>

                <br>
                
                    <div class="col-xs-12 col-sm-6 col-md-12" style="position: relative;">
                <center>
                <div class="panel panel-primary" style="width: 80%; padding: auto;">
                    <div class="panel-heading" style="padding: auto;"><b style="font-size: 22px;"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;Dados do Inquilino</b></div>
                    <div class="panel-body" style="padding: auto;">


                        <%                            out.print("<b>Nome : </b>" + inquilino.getInq_nome() + "<b> CPF : </b>" + inquilino.getInq_cpf()+"  ");


                        %>
                        &nbsp;&nbsp;<a class="btn btn-danger" href="index.jsp" role="button"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp;Voltar a Página Inicial</a>
                    </div>
                </div>
                
                
                 </center>
                </div>
               
                


                <div class="table-responsive" style="width: 95%;" >
                    <table class="table table-bordered" style="background-color: white;">
                        <thead>
                            <tr>

                                <th style="text-align: center;">CPF</th>
                                <th style="text-align: center;">Proprietário</th>
                                <th style="text-align: center;">Endereco do Imovel</th>
                                <th style="text-align: center;">Numero do Imovel</th>
                                <th style="text-align: center;">Dia do Pagamento</th>
                                <th style="text-align: center;">Preço</th>
                                <th style="text-align: center;">Situação</th>


                            </tr>
                        </thead>
                        <tbody>

                            <%                                String situacao;

                                for (int i = 0; i < alu.listar().size(); i++) {
                                    
                                    
                                    
                                    usuario = usu.buscar(alu.listar().get(i).getAlu_usu_cod());
                                    
                                    imovel = imo.buscar(alu.listar().get(i).getAlu_imo_cod());
                                    endereco = end.buscar(imovel.getImo_cod_end());
                                    Inquilino inquilino_busca = new Inquilino();
                                    inquilino_busca = inq.buscar(alu.listar().get(i).getAlu_inq_cod());
                                    if (inquilino.getInq_cpf().equals(inquilino_busca.getInq_cpf()) ) {
                                    
                                        if (alu.listar().get(i).isAlu_pagamento()) {
                                            situacao = "Pago";
                                        } else {
                                            situacao = "Atrasado";
                                        }

                                        out.print("<tr>"
                                                + "<th>" + cpf + "</th>"
                                                + "<th>" + usuario.getUsu_nome() + "</th>"
                                                + "<th>Rua: " + endereco.getEnd_rua() + "<br>Cidade: " + endereco.getEnd_cidade() + "</th>"
                                                + "<th>Numero : " + endereco.getEnd_numero() + "<br>Descrição: " + imovel.getImo_desc() + "</th>"
                                                + "<th>" + alu.listar().get(i).getAlu_dia_pagamento() + "</th>"
                                                + "<th>R$: " + alu.listar().get(i).getAlu_preco() + "</th>"
                                                + "<th>" + situacao + "</th>"
                                                + "</tr>");
                                    
                                    }
                                    
                                }

                            %>

                        </tbody>


                    </table>
                </div>


            </div>
        </div>







        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="Views/js/bootstrap.min.js"></script>

    </body>
</html>
