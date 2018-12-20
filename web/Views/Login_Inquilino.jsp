<%-- 
    Document   : LoginCliente
    Created on : 21/10/2018, 16:56:35
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

        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto;
                masc = mascara;
                setTimeout("fMascEx()", 1);
            }

            function fMascEx() {
                obj.value = masc(obj.value);
            }

            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "");
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
                return cpf;
            }


        </script>



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
        <div class="jumbotron" style="width: 60%; border-radius: 15px; top: 20%; left: 20%; position: absolute;">
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
                                    Bem vindo inquilino.
                                    <br><br>
                                    Esta é sua área. Para acessar os seus dados 
                                    <br>
                                    dos aluguéis digite seu CPF e clique em Entrar.
                                    <br><br>
                                    Caso apareça a mensagem <b style="color: red;">* Inquilino não cadastrado.</b>
                                    <br>
                                    significa que o seu Locador não cadastrou você no sistema
                                    <br>
                                    ou seu CPF está incorreto.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Entendi <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>

                                </div>
                            </div><!-- /.modal-content -->
                        </div>
                    </div>
                </div><!-- ---------------------------------------------------------------------- Modal fim -->

                <img style="width: 25%;" src="../Sources/Images/Logo002.png">
                <br>

                <br>

                <div style="width: 40%; ">





                    <form class="form-horizontal <%

                        try {

                            String variable = (String) request.getSession().getAttribute("Mensagem5");
                            if (variable == null) {

                            } else {
                                out.print("has-error");
                            }

                        } catch (Exception e) {

                        }


                          %> " name="cadastro" action="../Inq_Consulta" method="post">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label ">CPF</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" id="inputEmail3" maxlength="18" name="cpf" onkeydown="javascript: fMasc(this, mCPF);" placeholder="Digite aqui seu CPF">
                                <div style="color: red;">
                                    <%                                    try {

                                            String variable = (String) request.getSession().getAttribute("Mensagem5");
                                            if (variable == null) {

                                            } else {
                                                out.print(variable);
                                            }

                                        } catch (Exception e) {
                                            //Imprime en pantalla el error que se ocasione 

                                        }

                                        session.removeAttribute("Mensagem");
                                    %>
                                </div>
                            </div>
                        </div>




                        <br>
                        <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp; Entrar</button>
                        <a href="../index.jsp" class="btn btn-primary"> <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>&nbsp; Voltar a página inicial </a>

                </div>
                </form>
            </div>

        </div>
    </div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>