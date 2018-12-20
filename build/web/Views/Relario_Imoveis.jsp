<%-- 
    Document   : Relario_Imoveis
    Created on : 31/10/2018, 12:58:00
    Author     : Bruno Arley
--%>

<%@page import="Daos.DaoUsuario"%>
<%@page import="Classes.Usuario"%>
<%@page import="Classes.Endereco"%>
<%@page import="Daos.DaoEndereco"%>
<%@page import="Classes.Inquilino"%>
<%@page import="Daos.DaoInquilino"%>
<%@page import="Classes.Aluguel"%>
<%@page import="Daos.DaoAluguel"%>
<%@page import="Classes.Imovel"%>
<%@page import="Daos.DaoImovel"%>
<%@page import="Daos.DaoImovel"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="shortcut icon" href="../SourcesIndex/fav.ico">
        <title>Arley Imóveis</title>




    </head>
    <body style=" background: url('../Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          ">

        <%
            String cpf = (String) request.getSession().getAttribute("cod");

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
        <div class="jumbotron" style="width: 80%; border-radius: 15px; top: 7%; left: 10%; position: absolute;">
            <div class="container">

                <img style="width: 25%;" src="../Sources/Images/Logo002.png">
                <br>

                <br>

                <div class="panel panel-primary" style="width: 50%;">
                    <div class="panel-heading"><b style="font-size: 22px;"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;Dados do Inquilino</b></div>
                    <div class="panel-body">


                        <%                            out.print("<b>Nome : </b>" + inquilino.getInq_nome() + "<b> CPF : </b>" + inquilino.getInq_cpf());


                        %>
                       &nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger" href="index.jsp" role="button"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp;Voltar a Página Inicial</a>
                    </div>
                </div>


                <div class="table-responsive" style="width: 95%;" >
                    <table class="table table-bordered" style="background-color: white;">
                        <thead>
                            <tr>
+
                                
                                <th style="text-align: center;">Proprietário</th>
                                <th style="text-align: center;">Endereco do Imovel</th>
                                <th style="text-align: center;">Numero do Imovel</th>
                                <th style="text-align: center;">Preço</th>
                                <th style="text-align: center;">Situação</th>


                            </tr>
                        </thead>
                        <tbody>

                            <%                                
                                
                               
                                        out.print("<tr>"
                                                + "<th>" + cpf + "</th>"
                                               
                                                + "</tr>");
                                   

                            %>

                        </tbody>


                    </table>
                </div>


            </div>
        </div>







        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>

