<%-- 
    Document   : Status_Imovel
    Created on : 07/11/2018, 21:26:50
    Author     : Bruno
--%>

<%@ page pageEncoding="UTF-8" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<%
    String mensagem = (String) request.getSession().getAttribute("Mensagem");
    String link = (String) request.getSession().getAttribute("Link");
    
%>

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
        <div class="jumbotron"  style="box-shadow: 0px 0px 1em #666; -webkit-box-shadow: 4px 4px 1em #666; -moz-box-shadow: 0px 0px 1em #666; width: 60%; border-radius: 15px;  position: relative;">
            <div class="container">

                <img style="width: 220px; padding: auto;" src="../Sources/Images/Logo002.png">
                <br>

                <br>
                
                <div class="panel panel-primary">
                    <div class="panel panel-heading" style="font-size: 24px;">
                       <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> Mensagem
                        
                        
                    </div>
                    <div class=" panel-body">
                        
                        <div style="width: 90%; ">

                    <h3> <% out.print(mensagem); %></h3>
                    <br>
                    <a class="btn btn-primary" href="<%out.print(link);%>"> <span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>&nbsp;ok. Entendi</a>
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