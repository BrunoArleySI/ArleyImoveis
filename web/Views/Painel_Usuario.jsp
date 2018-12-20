<%-- 
    Document   : Painel_Usuario
    Created on : 27/10/2018, 13:23:51
    Author     : Bruno Arley
--%>

<%@page import="Daos.DaoUsuario"%>
<%@page import="Classes.Usuario"%>
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

        <style type="text/css">

            .menu{
                box-shadow: 0px 0px 1em #666; 
                -webkit-box-shadow: 4px 4px 1em #666; 
                -moz-box-shadow: 0px 0px 1em #666;
            }

            .menu:hover{
                box-shadow: 0px 0px 1em #666; 
                -webkit-box-shadow: 4px 4px 1em #666; 
                -moz-box-shadow: 0px 0px 1em #666;
                position: relative;
                bottom: 10px;
            }

            .masthead {
                 background: url('../Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
            }

        </style>



    </head>
    <body class="masthead" >

        <%
            session.removeAttribute("Mensagem");
            session.removeAttribute("mensagem");
            Usuario usuario = new Usuario();
            DaoUsuario usu = new DaoUsuario();
            try{
            String cod = (String) request.getSession().getAttribute("usu_cod");
            usuario = usu.buscar(Integer.parseInt(cod));
            } catch (Exception erro) {
                request.getSession().setAttribute("Mensagem", "Sua sessão expirou, faça login novamente;");
                request.getSession().setAttribute("Link", "../index.jsp");
                response.sendRedirect("Status_Imovel.jsp");
            }
        %>
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

                    <p class="navbar-text navbar-right" ><b>Usuario :</b> <% out.print(usuario.getUsu_nome()); %> <b>Email : </b> <% out.print(usuario.getUsu_email());%> &nbsp;</p>
                </div> 
            </div> 
        </nav>                      



    </center>





    <div  style="width: 85%; border-radius: 15px; left: 10%; position: relative;">
       
        <div >
            <center>
                <img style="width: 310px; padding: auto;" src="../Sources/Images/Logo002.png">
                
            


                <div class="row" >

                    <div class="col-sm-6 col-md-4" >
                        <div class="thumbnail menu" >
                            <div style="position: absolute; float: right; font-size: 30px;">
                                <span style="color: #01579b;" class="glyphicon glyphicon-info-sign" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg"></span>




                                <!-- Small modal -->

                                <div class="modal fade  bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                    <div class="modal-dialog " role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h1 class="modal-title">

                                                    <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Meus Imóveis
                                           
                                                </h1>
                                            </div>
                                            <div class="modal-body" style="font-size: 20px;">
                                                Aqui voce poderá cadastrar, editar e excluir seus imóveis.
                                                <br><br>
                                                Basta somente clicar em  
                                                <br><br>
                                                <img src="../Sources/Images/Meus_Imoveis.png" style="border: 2px #666 solid; border-radius: 5px;">
                                                <br><br>
                                                Para acessar o menu de imóveis.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div>
                                </div>



                            </div>
                            <div class="caption" onclick="window.location.replace('Painel_Imovel.jsp');" style="">
                                <h1> <span class="glyphicon glyphicon-home" aria-hidden="true"></span></h1>

                                <h3>Meus Imóveis</h3>
                                <br>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-4" >
                        <div class="thumbnail menu" >
                            <!-- ---------------------------------------------------------------------- Modal fim -->
                            <div style="position: absolute; float: right; font-size: 30px;">
                                <span style="color: #01579b;" class="glyphicon glyphicon-info-sign" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg2"></span>




                                <!-- Small modal -->

                                <div class="modal fade  bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                    <div class="modal-dialog " role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h1 class="modal-title">

                                                    <span class="glyphicon glyphicon-paste" aria-hidden="true"></span> Meus Aluguéis

                                                </h1>
                                            </div>
                                            <div class="modal-body" style="font-size: 20px;">
                                                Aqui voce poderá cadastrar, editar e excluir seus Aluguéis.
                                                <br><br>
                                                Basta somente clicar em  
                                                <br><br>
                                                <img src="../Sources/Images/Meus_Alugueis.png" style="border: 2px #666 solid; border-radius: 5px;">
                                                <br><br>
                                                Para acessar o menu de aluguéis.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div>
                                </div>
                            </div><!-- ---------------------------------------------------------------------- Modal fim -->

                            <div class="caption" onclick="window.location.replace('Painel_Aluguel.jsp');">
                                <h1><span class="glyphicon glyphicon-paste" aria-hidden="true"></span></h1>
                                <h3>Meus Aluguéis</h3>
                                <br>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4" >
                        <div class="thumbnail menu" >
                            <!-- ---------------------------------------------------------------------- Modal  -->
                            <div style="position: absolute; float: right; font-size: 30px;">
                                <span style="color: #01579b;" class="glyphicon glyphicon-info-sign" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg3"></span>




                                <!-- Small modal -->

                                <div class="modal fade  bs-example-modal-lg3" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                    <div class="modal-dialog " role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h1 class="modal-title">

                                                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Meus Inquilinos

                                                </h1>
                                            </div>
                                            <div class="modal-body" style="font-size: 20px;">
                                                Aqui voce poderá visualizar e editar os dados seus Inquilinos.
                                                <br><br>
                                                Basta somente clicar em  
                                                <br><br>
                                                <img src="../Sources/Images/Meus_Inquilinos.png" style="border: 2px #666 solid; border-radius: 5px;">
                                                <br><br>
                                                Para acessar o menu de inquilinos.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div>
                                </div>
                            </div><!-- ---------------------------------------------------------------------- Modal fim -->

                            <div class="caption" onclick="window.location.replace('Dados_Inquilino.jsp');">
                                <h1><span class="glyphicon glyphicon-user" aria-hidden="true"></span></h1>

                                <h3>Meus Inquilinos</h1>
                                    <br>
                                    </div>
                                    </div>
                                    </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 col-md-4" >
                                            <div class="thumbnail menu" >
                                                <!-- ---------------------------------------------------------------------- Modal  -->
                                                <div style="position: absolute; float: right; font-size: 30px;">
                                                    <span style="color: #01579b;" class="glyphicon glyphicon-info-sign" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg4"></span>




                                                    <!-- Small modal -->

                                                    <div class="modal fade  bs-example-modal-lg4" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                                        <div class="modal-dialog " role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h1 class="modal-title">

                                                                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Meus Inquilinos

                                                                    </h1>
                                                                </div>
                                                                <div class="modal-body" style="font-size: 20px;">
                                                                    Aqui voce poderá editar e excluir os seus dados.
                                                                    <br><br>
                                                                    Basta somente clicar em  
                                                                    <br><br>
                                                                    <img src="../Sources/Images/Meus_Dados.png" style="border: 2px #666 solid; border-radius: 5px;">
                                                                    <br><br>
                                                                    Para acessar os dados da sua conta.
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div>
                                                    </div>
                                                </div><!-- ---------------------------------------------------------------------- Modal fim -->

                                                <div class="caption" onclick="window.location.replace('Dados_Usuario.jsp');">
                                                    <h1><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span></h1>

                                                    <h3>&nbsp;Meus dados</h3>
                                                    <br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-4">
                                            <div class="thumbnail menu" >
                                                <!-- ---------------------------------------------------------------------- Modal  -->
                                                <div style="position: absolute; float: right; font-size: 30px;">
                                                    <span style="color: #01579b;" class="glyphicon glyphicon-info-sign" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-lg5"></span>




                                                    <!-- Small modal -->

                                                    <div class="modal fade  bs-example-modal-lg5" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                                                        <div class="modal-dialog " role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h1 class="modal-title">

                                                                        <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> Relatórios

                                                                    </h1>
                                                                </div>
                                                                <div class="modal-body" style="font-size: 20px;">
                                                                    Aqui voce poderá os dados dos seus aluguéis pagos.
                                                                    <br><br>
                                                                    Basta somente clicar em  
                                                                    <br><br>
                                                                    <img src="../Sources/Images/Meus_Relatorios.png" style="border: 2px #666 solid; border-radius: 5px;">
                                                                    <br><br>
                                                                    Para acessar os relatórios.
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div>
                                                    </div>
                                                </div><!-- ---------------------------------------------------------------------- Modal fim -->

                                                <div class="caption"  onclick="window.location.replace('Relatorio.jsp');">
                                                    <h1><span class="glyphicon glyphicon-tasks" aria-hidden="true"></span></h1>


                                                    <h3>&nbsp;Relatórios</h3>
                                                    <br>
                                                </div>
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
