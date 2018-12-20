<%-- 
    Document   : Dados_Usuario
    Created on : 08/11/2018, 09:41:16
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
        <div class="jumbotron" style="box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 90%; border-radius: 15px;  position: relative;">
            
             <!-- ---------------------------------------------------------------------- Modal  -->
                <div style="position: absolute; float:right; font-size: 40px; bottom:0px; right: 10px; ">
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
                                    Aqui você poderá editar os dados da sua conta.
                                    <br><br>
                                    Observe o menu de opções e clique nos botões 
                                    <br><br>
                                    respectivos a ação que você deseja.
                                    <br><br>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div>
                    </div>
                </div><!-- ---------------------------------------------------------------------- Modal fim -->

            
            
            <div class="container">
                
                
                
                
                
                <center>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-primary" style="width: 90%;" >




                                <div class="panel-heading" style="text-align: center; "><b style="font-size: 22px;"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;Dados Do Usuario</b></div>

                                <div class="panel-body">


                                    <form class="form-horizontal" action="../Imo_Edita" method="post">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label" style="width: 35%; text-align: left;" >Codigo Do Usuario</label>
                                            <div class="col-sm-8" style="width: 49%;">
                                                <input type="text" required name="codigo" value="<%out.print(usuario.getUsu_cod());%>" class="form-control"  id="disabledInput"  readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label"  >Nome</label>
                                            <div class="col-sm-8">
                                                <input type="text" required name="rua" value="<%out.print(usuario.getUsu_nome());%>" class="form-control" id="inputEmail3" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-8">
                                                <input type="text" value="<%out.print(usuario.getUsu_email());%>" required name="numero" class="form-control" id="inputEmail3"  readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Senha</label>
                                            <div class="col-sm-8">
                                                <input type="text" required name="cidade" value="<%out.print(usuario.getUsu_senha());%>" class="form-control" id="inputEmail3"  readonly>
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

                                    <a type="button" class="btn btn-default" href="Edita_Usuario.jsp"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>&nbsp;Editar</a>  
                                   
                                    
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target=".bs-example-modal-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp; Excluir</button>
                                    <a type="button" class="btn btn-primary"  href="Painel_Usuario.jsp"><span  class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp; Voltar a Página Inicial</a>
                                    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                        <div class="modal-dialog " role="document">
                                            <div class="modal-content">
                                                
                                                
                                                <div style="width: 80%;">
                                                <br>
                                                <h1 style="color: red;"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span></h1>
                                                <br>
                                                Se você excluir sua conta, todos os dados serão perdidos !<br>
                                                deseja continuar?
                                                <br>
                                                <br>
                                                <a type="button" class="btn btn-danger"  href="../Usu_Exclui" ><span style="color: white;" class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp; Excluir Conta</a>
                                                <a type="button" class="btn btn-default"  href=""><span  class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp; Cancelar Operação</a>
                                                <br>
                                                <br>
                                                <br>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <%
                                String msg = "";
                                try {

                                    String variable = (String) request.getSession().getAttribute("Mensagem");
                                    msg = variable;

                                } catch (Exception e) {

                                }

                                try {

                                    String variable = (String) request.getSession().getAttribute("Mensagem");
                                    if (variable == null) {

                                    } else {
                                        out.print(variable);
                                        msg = variable;
                                    }

                                } catch (Exception e) {
                                    //Imprime en pantalla el error que se ocasione 

                                }

                                session.removeAttribute("Mensagem");


                            %>






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
