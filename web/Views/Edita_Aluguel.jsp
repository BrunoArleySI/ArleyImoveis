<%-- 
    Document   : Edita_Aluguel
    Created on : 09/11/2018, 18:31:19
    Author     : Bruno Arley
--%>

<%@page import="Daos.*"%>
<%@page import="Classes.*"%>
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
        <script language="javascript">
            function is_cpf(c) {

                if ((c = c.replace(/[^\d]/g, "")).length != 11)
                    return false

                if (c == "00000000000")
                    return false;

                var r;
                var s = 0;

                for (i = 1; i <= 9; i++)
                    s = s + parseInt(c[i - 1]) * (11 - i);

                r = (s * 10) % 11;

                if ((r == 10) || (r == 11))
                    r = 0;

                if (r != parseInt(c[9]))
                    return false;

                s = 0;

                for (i = 1; i <= 10; i++)
                    s = s + parseInt(c[i - 1]) * (12 - i);

                r = (s * 10) % 11;

                if ((r == 10) || (r == 11))
                    r = 0;

                if (r != parseInt(c[10]))
                    return false;

                return true;
            }


            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }

            function fMascEx() {
                obj.value = masc(obj.value)
            }

            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }

            cpfCheck = function (el) {
                document.getElementById('cpfResponse').innerHTML = is_cpf(el.value) ? '' : '';
                if (el.value == '')
                    document.getElementById('cpfResponse').innerHTML = '';
            }

        </script>

    </head>
    <body style=" background: url('../Sources/Images/fundo005.jpg') center center no-repeat fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          ">

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

                aluguel = alu.buscar(Integer.parseInt(request.getParameter("cod_alu")));
                inquilino = inq.buscar(aluguel.getAlu_inq_cod());

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
        <div class="jumbotron" style=" box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 90%; border-radius: 15px; position: relative;">
            <div class="container">
                <center>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-primary" style="width: 80%; position: relative;" >




                                <div class="panel-heading" style="text-align: center; "><b style="font-size: 22px;"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;Dados Do Aluguel</b></div>

                                <div class="panel-body">
                                    <form class="form-horizontal" action="../Alu_Edita" method="post">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">Codigo do Aluguel</label>
                                            <div class="col-sm-6">
                                                <input type="text" required name="codigo" class="form-control" id="inputEmail3" value="<%out.print(aluguel.getAlu_cod());%>" placeholder="Codigo do Aluguel" readonly>
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">Nome Inquilino</label>
                                            <div class="col-sm-6">
                                                <input type="text" value="<%out.print(inquilino.getInq_nome());%>" required name="nome" class="form-control" id="inputEmail3" placeholder="Nome do Inquilino">
                                            </div>
                                        </div> 
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">CPF do Inquilino</label>
                                            <div class="col-sm-6">
                                                <input type="text" required="required" onkeyup="cpfCheck(this)" maxlength="18" onkeydown="javascript: fMasc(this, mCPF);" name="cpf" value="<%out.print(inquilino.getInq_cpf());%>" class="form-control" id="inputEmail3" placeholder="CPF do Inquilino">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">Email do Inquilino</label>
                                            <div class="col-sm-6">
                                                <input type="text" required class="form-control" value="<%out.print(inquilino.getInq_email());%>" name="email" id="inputEmail3" placeholder="Email do Inquilino">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label" >Idade do Inquilino</label>
                                            <div class="col-sm-6">
                                                <input type="text" required name="idade" value="<%out.print(inquilino.getInq_idade());%>" class="form-control" id="inputEmail3" placeholder="Idade do Inquilino">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">Preço do Aluguel</label>
                                            <div class="col-sm-6">
                                                <input type="text" required="required" pattern="([0-9]{0,15})?([0-9]{0,1})?[0-9]{0,1}.[0-9]{0,2}$" name="preco" value="<%out.print(aluguel.getAlu_preco());%>" class="form-control" id="inputEmail3" placeholder="Preço do Aluguel">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-3 control-label">Dia do Pagamento</label>
                                            <div class="col-sm-2">
                                                <input type="text" required class="form-control" value="<%out.print(aluguel.getAlu_dia_pagamento());%>" name="dia" id="inputEmail3" placeholder="Dia">
                                            </div>
                                        </div>







                                </div>
                            </div>





                        </div>
                        <div class="col-md-12">

                            <div class="panel panel-primary" style="width: 80%; ">
                                <div class="panel-heading"><b style="font-size: 22px;"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp;Selecione um Imovel</b></div>
                                <div class="panel-body" style=" ">
                                    <center>
                                        <div style="text-align: left; width: 95%;">


                                            <select class="form-control" name="cod_imo" id="cod_imo">
                                                <%                                String situacao;

                                                    for (int i = 0; i < imo.listar().size(); i++) {
                                                        situacao = "Desocupado";
                                                        if (imo.listar().get(i).getImo_usu_cod() == usuario.getUsu_cod()) {
                                                            int a = i;
                                                            imovel = imo.buscar(imo.listar().get(i).getImo_cod());

                                                            endereco = end.buscar(imovel.getImo_cod_end());

                                                            for (int loop = 0; loop < alu.listar().size(); loop++) {

                                                                if (alu.listar().get(loop).getAlu_imo_cod() == imovel.getImo_cod()) {
                                                                    situacao = "Alugado";
                                                                }

                                                            }

                                                            if (imo.listar().get(i).getImo_cod() == aluguel.getAlu_imo_cod() && situacao == "Alugado") {

                                                                out.print("<option value=\"" + imovel.getImo_cod() + "\" selected>"
                                                                        + " Codigo : " + imovel.getImo_cod() + ""
                                                                        + " Rua : " + endereco.getEnd_rua() + ""
                                                                        + " Numero : " + endereco.getEnd_numero() + ""
                                                                        + " Cidade : " + endereco.getEnd_cidade() + ""
                                                                        + " Bairro : " + endereco.getEnd_bairro() + ""
                                                                        + "</option>");

                                                            } else {
                                                                if (situacao.equals("Desocupado")) {

                                                                    out.print("<option value=\"" + imovel.getImo_cod() + "\">"
                                                                            + " Codigo : " + imovel.getImo_cod() + ""
                                                                            + " Rua : " + endereco.getEnd_rua() + ""
                                                                            + " Numero : " + endereco.getEnd_numero() + ""
                                                                            + " Cidade : " + endereco.getEnd_cidade() + ""
                                                                            + " Bairro : " + endereco.getEnd_bairro() + ""
                                                                            + "</option>");

                                                                }

                                                            }

                                                        }

                                                    }

                                                %>


                                            </select>


                                        </div>
                                </div>
                            </div>

                            <div class="panel panel-warning" style="width: 80%; position: relative; ">
                                <div class="panel-heading"><b style="font-size: 22px;"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>&nbsp;Confirmação do Cadastro</b></div>
                                <div class="panel-body">

                                    <button type="submit" class="btn btn-success"><span  class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;Salvar</button>  
                                    <a type="button" href="Painel_Aluguel.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>&nbsp; Cancelar</a>



                                </div>
                            </div>


                            <%                                out.print("");
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
