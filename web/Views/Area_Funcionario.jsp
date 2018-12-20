<%-- 
    Document   : LoginFuncionario
    Created on : 21/10/2018, 16:56:56
    Author     : Bruno Arley
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <link rel="shortcut icon" href="../SourcesIndex/fav.ico">
        <title>Arley Imóveis</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style=" background: url('../Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;

          ">

        <br>
        <br>
    <center>
        <div class="jumbotron" style="width: 90%; border-radius: 15px;  position: relative;   box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666;">
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
                                    Para fazer o cadastro basta preencher o <br>formilário da esquerda e clicar em
                                    <br>
                                    <b>Cadastrar</b>
                                    <br><br>
                                    Para realiar o login basta preencer o <br>formulário da direita e clicar em.
                                    <br>
                                     <b>Entrar</b>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div>
                    </div>
                </div><!-- ---------------------------------------------------------------------- Modal fim -->



                <img style="width: 250px; padding: auto;" src="../Sources/Images/Logo002.png">
                <br>


                <center>
                    <div class="row">

                        <form class="form-horizontal" action="../Usu_Cadastra" method="post">

                            <div class="col-md-6" style="width: 50%;  ">
                                <h3>Não possui conta? <span class="label label-default">Cadastre-se</span></h3>
                                <br>
                                <div class="form-group" style="width: 80%;">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Nome</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputPassword3" name="nome" placeholder="Nome">
                                    </div>
                                </div>


                                <div class="form-group"style="width:80%; ">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input  type="email" class="form-control"  name="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group" style="width: 80%;">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" name="senha" id="inputPassword3" placeholder="Password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
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
                                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;Cadastrar</button>
                                        <a class="btn btn-danger" href="../index.jsp" role="button"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp;
                                            <%                                             if (msg == null) {
                                                    out.print("Cancelar");
                                                } else {
                                                    out.print("Voltar a página inicial");
                                                }
                                            %>
                                        </a>
                                    </div>
                                </div>
                        </form>




                    </div>
                    <div class="col-md-6" style="width: 50%;">
                        <center>
                            <h3>Realizar <span class="label label-default">Login</span></h3>
                            <br>
                            <form class="form-horizontal" action="../Usu_Login" method="post">
                                <div class="form-group"style="width:80%;">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input  type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group" style="width: 80%;">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Senha</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="inputPassword3" name="senha" placeholder="Password">
                                    </div>
                                </div>




                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <%
                                            try {

                                                String variable = (String) request.getSession().getAttribute("Mensagem2");

                                            } catch (Exception e) {

                                            }

                                            try {

                                                String variable = (String) request.getSession().getAttribute("Mensagem2");
                                                if (variable == null) {

                                                } else {
                                                    out.print(variable);

                                                }

                                            } catch (Exception e) {
                                                //Imprime en pantalla el error que se ocasione 

                                            }

                                            session.removeAttribute("Mensagem2");


                                        %>

                                    </div>
                                </div>



                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;Entrar</button>
                                        <a class="btn btn-danger" href="../index.jsp" role="button"><span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp;Voltar a página inicial</a>
                                        <br><br>
                                        <a style=" width: 57%"type="button" href="Recupera_Senha.jsp" class="form-control btn btn-warning" id="inputPassword3" name="recupera" placeholder="recupera"><span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>&nbsp; Recuperar senha</a>

                                    </div>
                                </div>
                                <br>


                            </form>



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