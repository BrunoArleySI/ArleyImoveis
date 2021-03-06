<%-- 
    Document   : Painel_Imovel
    Created on : 06/11/2018, 14:19:32
    Author     : Bruno Arley
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="Classes.TipoImovel"%>
<%@page import="Daos.DaoTipoImovel"%>
<%@page import="Daos.DaoEndereco"%>
<%@page import="Classes.Inquilino"%>
<%@page import="Daos.DaoAluguel"%>
<%@page import="Daos.DaoAluguel"%>
<%@page import="Classes.Aluguel"%>
<%@page import="Daos.DaoInquilino"%>
<%@page import="Classes.Endereco"%>
<%@page import="Classes.Imovel"%>
<%@page import="Daos.DaoImovel"%>
<%@page import="Classes.Usuario"%>
<%@page import="Daos.DaoUsuario"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>

<!DOCTYPE html>
<html lang="pt_BR">

    <%
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
        try {
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
        } catch (Exception erro) {
            request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
            request.getSession().setAttribute("Link", "../index.jsp");
            response.sendRedirect("Status_Imovel.jsp");
        }

    %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="shortcut icon" href="../SourcesIndex/fav.ico">
        <title>Arley Imóveis</title>


        <script>
           
        </script>


    </head>
    <body style=" background: url('../Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          ">

    <center>
        <nav class="navbar navbar-default" style="box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666;"> 
            <div class="container-fluid"> 
                <div class="navbar-header"> 
                    <button type="button" class="collapsed navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-5" aria-expanded="false"> 
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span> <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand navbar-left"> <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp; <b>A</b>rley <b>I</b>móveis</a>
                </div> 
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-5">
<button type="submit"  class=" navbar-right btn btn-danger navbar-btn" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg8"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp; Sair</button>
                      <!-- ---------------------------------------------------------------------- Modal fim -->
                            <div>
                                


                                <!-- Small modal -->

                                <div class="modal fade  bs-example-modal-lg8" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                    <div class="modal-dialog " role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h2 class="modal-title">

                                                    <span style="color: red;" class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span> Atenção

                                                </h2>
                                            </div>
                                            <div class="modal-body" style="font-size: 20px;">
                                                <h2>Tem certeza que deseja sair?</h2>
                                            </div>
                                            <div class="modal-footer">
                                                <center>
                                                <button type="submit" onclick="window.location.replace('../index.jsp');" class="  btn btn-danger btn-lg" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg2"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp; Sair</button>
                      
                                                <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal"> <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Cancelar</button>
                                                </center>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div>
                                </div>
                            </div><!-- ---------------------------------------------------------------------- Modal fim -->
                    <a class="navbar-text navbar-right"></a><a style="border: 2px solid #000\9 ;" type="button" href="Painel_Usuario.jsp" class="btn btn-primary navbar-btn navbar-right"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;Ir para a página inicial</a>
                    <p class="navbar-text navbar-right" ><b>Usuario :</b> <% out.print(usuario.getUsu_nome()); %> <b>Email : </b> <% out.print(usuario.getUsu_email());%> &nbsp;</p>
                </div> 
            </div> 
        </nav>      
    </center>

    <br>
    <center>
        <div class="jumbotron" style="box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 80%; border-radius: 15px;  position: relative;">
            <div class="container">

                <!-- ---------------------------------------------------------------------- Modal  -->
                <div style="position: absolute; float:left; font-size: 50px; top: 10px; ">
                    <span style="color: #01579b;" class="glyphicon glyphicon-question-sign" title="Clique para abrir a ajuda"  aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg5"></span>
                    <!-- Small modal -->
                    <div class="modal fade  bs-example-modal-lg5" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                        <div class="modal-dialog " role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h1 class="modal-title">

                                        <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Ajuda

                                    </h1>
                                </div>
                                <div class="modal-body" style="font-size: 20px;">
                                    Aqui você poderá cadastrar e editar seus imóveis.
                                    <br><br>
                                    Observe a tabela e clique nos botões 
                                    <br><br>
                                    respectivos a ação que você deseja.
                                    <br><br>
                                    Caso a tabela esteja vazia clique em <b>Cadastrar Imóvel</b>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div>
                    </div>
                </div><!-- ---------------------------------------------------------------------- Modal fim -->


                <img style="width: 220px; padding: auto;" src="../Sources/Images/Logo002.png">
                <br>

                <br>

                <a href="CadastraImovel.jsp" class="btn btn-success" value="oi"><span  class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; Cadastrar Imóvel</a>                <a type="button" class="btn btn-primary"  href="Painel_Usuario.jsp"><span  class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp; Voltar a Página Inicial</a>

                <br><br>

                <div class="panel panel-primary">
                    <div class="panel-heading" style="font-size: 20px;">
                        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> <b>Meus Imóveis</b>
                    </div>
                    <div class="panel-footer" style="width: 100%; position: relative;">



                        <div class="table-responsive" style="" >
                            <table class="table table-bordered" style="background-color: white;">
                                <thead>
                                    <tr>

                                        <th style="text-align: center;">Codigo</th>
                                        <th style="text-align: center;">CEP</th>
                                        <th style="text-align: center;">Tipo</th>
                                        <th style="text-align: center;">Cidade</th>
                                        <th style="text-align: center;">Bairro</th>
                                        <th style="text-align: center;">Rua</th>
                                        <th style="text-align: center;">Numero</th>
                                        <th style="text-align: center;">Valor</th>
                                        <th style="text-align: center;">Situação</th>
                                        <th style="text-align: center;">Opções</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%                                String situacao;

                                        for (int i = 0; i < imo.listar().size(); i++) {
                                            situacao = "Desocupado";
                                            if (imo.listar().get(i).getImo_usu_cod() == usuario.getUsu_cod()) {

                                                imovel = imo.listar().get(i);
                                                endereco = end.buscar(imovel.getImo_cod_end());

                                                tipo = ti.buscar(imovel.getImo_tipo_cod());

                                                for (int loop = 0; loop < alu.listar().size(); loop++) {

                                                    if (alu.listar().get(loop).getAlu_imo_cod() == imovel.getImo_cod()) {
                                                        situacao = "Alugado";
                                                    }

                                                }

                                                out.print("<tr>"
                                                        + "<th>" + imovel.getImo_cod() + "</th>"
                                                        + "<th>" + endereco.getEnd_cep() + "</th>"
                                                        + "<th>" + tipo.getTi_desc() + "</th>"
                                                        + "<th>" + endereco.getEnd_cidade() + "</th>"
                                                        + "<th>" + endereco.getEnd_bairro() + "</th>"
                                                        + "<th>" + endereco.getEnd_rua() + "</th>"
                                                        + "<th>" + endereco.getEnd_numero() + "</th>"
                                                        + "<th>" + imovel.getImo_valor() + "</th>"
                                                        + "<th>" + situacao + "</th>"
                                                        + "<th><center> <a href=\"Edita_Imovel.jsp?cod_imo=" + imovel.getImo_cod() + "\"class=\"btn btn-default\"> <span  class=\"glyphicon glyphicon-edit\" aria-hidden=\"true\"></span>&nbsp;Editar</a> <a href=\"Confirm_Excluir.jsp?cod=" + imovel.getImo_cod() + "&local=imovel\" class=\"btn btn-danger\"  aria-hidden=\"true\" onclick=\"\"><span  class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>&nbsp;Excluir</a></center></th>"
                                                        + "</tr>");

                                            }

                                        }

                                    %>

                                </tbody>
                                
                                  

                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>







        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
