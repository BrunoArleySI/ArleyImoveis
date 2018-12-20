<%-- 
    Document   : index
    Created on : 01/12/2018, 11:21:14
    Author     : Bruno Arley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.*" %>
<%@page import="Daos.*"%>
<!DOCTYPE html>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%
        
        
            session.removeAttribute("cod_usu");
            session.removeAttribute("usu_cod");
            session.removeAttribute("Mensagem5");
            session.removeAttribute("mensagem2");
            session.removeAttribute("Mensagem6");
            session.removeAttribute("mensagem6");
            session.removeAttribute("Mensage3");
            session.removeAttribute("mensagem");
            session.removeAttribute("Mensagem");
    %>

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="SourcesIndex/fav.ico">
        <title>Arley Imóveis</title>


        <!-- Custom fonts for this theme -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="SourcesIndex/all.min.css" rel="stylesheet">
        <link href="SourcesIndex/css" rel="stylesheet">


        <!-- Plugin styles -->
        <link href="SourcesIndex/jquery.fancybox.min.css" rel="stylesheet">
        <link href="SourcesIndex/device-mockups.min.css" rel="stylesheet">
        <link href="SourcesIndex/slick.css" rel="stylesheet">

        <!-- Custom styles for this theme -->
        <link href="SourcesIndex/theme-default.css" rel="stylesheet">
        <!-- Alternate color schemes: uncomment to use! -->

        <!-- <link href="css/theme-green.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-yellow.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-orange.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-purple.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-turquoise.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-pink.css" rel="stylesheet"> -->
        <!-- <link href="css/theme-brown.css" rel="stylesheet"> -->

        <style type="text/css">


            a:active{
                color:white;
                top:10px;
                background-color: #3b5998;
            }









            
            hr.primary {
                border-top-width: 1px;
                border-bottom-width: 1px;
                border-style: solid;
                height: 0.125rem;
                border-color: #3b5998;
            }
            .btn-primary{
                background-color: #053359;
            }
            .btn-primary:hover{
                position: relative;
                right:5px;
                background-color: #053359;
            }

        </style>

    </head>

    <body id="page-top">

        <!-- * * * * * * * * -->
        <!-- * Navigation * -->
        <!-- * * * * * * * * -->

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="navbar-main">
            <div class="container">
                
                <div class="navbar-brand masthead-title text-uppercase" style="  "><b>Arley Imóveis</b>
                
                    
                
                </div>
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <button class="btn btn-primary" href="" data-toggle="modal" data-target="#exampleModal">Faça Login ou Cadastre-se</button>

                           

                            
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- * * * * * * * -->
        <!-- * Masthead * -->
        <!-- * * * * * * * -->

        <header class="masthead masthead-full text-white" >
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col text-center">
                        <img class="masthead-logo mb-4" src="SourcesIndex/logop.png" alt="">
                        <div class="masthead-title text-uppercase">Arley Imóveis</div>
                        <hr class="primary small">
                        <div class="masthead-subtitle">Sua corretora de imóveis online.</div>
                    </div>
                </div>
            </div>
            <div class="masthead-scroll">
                <a href="#about" class="masthead-scroll-btn js-scroll-trigger">
                    <span class="glyphicon glyphicon glyphicon-menu-down" aria-hidden="true"></span>

                </a>
            </div>
        </header>

        <!-- * * * * * * * * * -->
        <!-- * About Section * -->
        <!-- * * * * * * * * * -->
        
        <!-- Modal--------------------------------------------------------------------- -->
                            <div class="modal fade" data-backdrop="static" id="exampleModal" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> &nbsp;Acessar como Locador ou Inquilino?</h5>
                                            
                                                
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <center>
                                                 <button style="background-color: #007bff; color:white;" type="button" class="btn btn-default" onclick="window.location.replace('Views/Login_Inquilino.jsp');"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> &nbsp; Inquilino</button>
                                           
                                                <button style="background-color:#3b5998; color:white;" type="button" class="btn btn-default" onclick="window.location.replace('Views/Area_Funcionario.jsp');"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> <span class="glyphicon glyphicon-user" aria-hidden="true"></span> &nbsp; Locador</button>
                                            </center>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" onclick="window.location.replace('index.jsp');" data-dismiss="modal">Close</button>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                              <!-- Modal fim--------------------------------------------------------------------- -->


        <section class="page-section text-center" id="about">
            <div class="container-fluid">
                <h1 class="page-section-heading text-uppercase">Pensado especialmete para voce</h1>
                <p class="lead">Gerenciar seus imóveis nunca foi tão facil.</p>
                <hr class="primary small mb-5">
                <div class="row">
                    <div class="col-md-6 col-xl-3 px-md-5 mb-4 mb-xl-0">
                        <div class="fas  fa-4x mb-3"><img style="width: 100px; padding: auto;" src="SourcesIndex/seguro.png"></div>
                        <h4 class="text-uppercase">Seguro</h4>
                        <p>O sistema conta com uma vasta gama de aplicação de testes para que se garanta o aperfeiçoamento e segurança nos dados.</p>
                    </div>
                    <div class="col-md-6 col-xl-3 px-md-5 mb-4 mb-xl-0">
                        <div class="fas  fa-4x mb-3"><img style="width: 100px; padding: auto;" src="SourcesIndex/usabilidade.png"></div>
                        <h4 class="text-uppercase">Facil de Usar</h4>
                        <p>Pensado para usuarios de todos os tipos, do basico ao avançado, utilizando meios simples de se fazer até as tarefas mais complexas.</p>
                    </div>
                    <div class="col-md-6 col-xl-3 px-md-5 mb-4 mb-xl-0">
                        <i class="fas  fa-4x mb-3"><img  style="width: 100px; padding: auto;" src="SourcesIndex/ajuda.png"></i>
                        <h4 class="text-uppercase">Possui sistema de ajuda</h4>
                        <p>A Arley Imóveis conta com ampla assistencia de uso do sistema, disponibilizando auxílio nas tarefas mais complicadas.</p>
                    </div>
                    <div class="col-md-6 col-xl-3 px-md-5">
                        <i class="fas  fa-4x mb-3"><img style="width: 100px; padding: auto;" src="SourcesIndex/gratis.png"></i>
                        <h4 class="text-uppercase">totalmente gratis</h4>
                        <p>Esqueça as taxas de adesão, utilize o sistema sem pagar nada por isso.</p>
                    </div>
                </div>
            </div>
        </section>








        

        <footer class="footer text-center text-white-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h5 class="text-uppercase">
                            <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>

                            Telefone
                        </h5>
                        <a class="text-white-50" href="">3635-0000</a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h5 class="text-uppercase">
                           <span class="glyphicon glyphicon-user" aria-hidden="true"></span>

                            Responsáveis</h5>
                        <div>
                            Arley Imoveis 
                            <br>
                            Development
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <h5 class="text-uppercase">
                           <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>

                            Email
                        </h5>
                        <!-- Make sure to change the mailto address below! -->
                        <a class="text-white-50" href="">ArleyImoveis@gmail.com</a>
                    </div>
                </div>
                <br>
                <br>
                
            </div>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="SourcesIndex/jquery.min.js.download"></script>
        <script src="SourcesIndex/bootstrap.bundle.min.js.download"></script>

        <!-- Plugin JavaScript -->
        <script src="SourcesIndex/jquery.fancybox.min.js.download"></script>
        <script src="SourcesIndex/jquery.easing.min.js.download"></script>
        <script src="SourcesIndex/slick.min.js.download"></script>

        <!-- Custom scripts for this theme -->
        <script src="SourcesIndex/contact.js.download"></script>
        <script src="SourcesIndex/validation.js.download"></script>
        <script src="SourcesIndex/core.js.download"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>


    </body></html>