<%-- 
    Document   : Edita_Usuario
    Created on : 08/11/2018, 10:07:40
    Author     : Bruno Arley
--%>

<%@page import="Daos.DaoUsuario"%>
<%@page import="Classes.Usuario"%>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<html lang="pt-br">
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
                                

                                <center>
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
    <center>
        <div class="jumbotron" style=" box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 90%; border-radius: 15px;  position: relative;">
            <div class="container">
                <center>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-primary" style="width: 90%;" >




                                <div class="panel-heading" style="text-align: center; "><b style="font-size: 22px;"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Dados Do Usuario</b></div>

                                <div class="panel-body">


                                    <form class="form-horizontal" action="../Usu_Edita" method="post">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label" style="width: 35%; text-align: left;" >Codigo Do Usuario</label>
                                            <div class="col-sm-8" style="width: 49%;">
                                                <input type="text" required name="codigo" value="<%out.print(usuario.getUsu_cod());%>" class="form-control"  id="disabledInput"  readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label"  >Nome</label>
                                            <div class="col-sm-8">
                                                <input type="text" required name="nome" value="<%out.print(usuario.getUsu_nome());%>" class="form-control" id="inputEmail3" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-8">
                                                <input type="email" value="<%out.print(usuario.getUsu_email());%>" required name="email" class="form-control" id="inputEmail3"  >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Senha</label>
                                            <div class="col-sm-8">
                                                <input type="text" required name="senha" value="<%out.print(usuario.getUsu_senha());%>" class="form-control" id="inputEmail3"  >
                                            </div>
                                        </div>







                                </div>
                            </div>






                        </div>
                        <div class="col-md-6">

                            <%--
                            <div class="panel panel-danger" style="width: 90%; ">
                                <div class="panel-heading"><b style="font-size: 22px;"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;Tipo Do Imovel</b></div>
                                <div class="panel-body" style=" ">
                                   <center>
                                    <div style="text-align: left; width: 20%;">
                                   
                                    </div>
                                </div>
                            </div>

                            --%>

                            <div class="panel panel-warning" style="width: 90%;">
                                <div class="panel-heading"><b style="font-size: 22px;"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;Opções</b></div>
                                <div class="panel-body">

                                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-save" aria-hidden="true"></span>&nbsp;Salvar</button>  
                                    <a type="button" href="Dados_Usuario.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp; Cancelar</a>



                                </div>
                            </div>




                        </div>
                    </div>










                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">

                        </div>
                    </div>
                    </form>





            </div>
        </div>


    </center>








    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>
