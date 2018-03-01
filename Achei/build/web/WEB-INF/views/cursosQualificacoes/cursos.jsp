<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Bootstrap 101 Template</title>
        <link rel="stylesheet" href="achei.css">
        <!-- Bootstrap -->
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="<c:url value="/resources/js/html5shiv.min.js"/>"></script>
          <script src="<c:url value="/resources/js/respond.min.js"/>"></script>
        <![endif]-->
    </head>
    <body>
        <style>
            h1{
                color: orangered;
                font-family: verdana;
                font-size: 20px;
            }
            p{
                font-family: verdana;
                color: black;
            }
            h2{
                color: orangered;
                font-family: verdana;
                font-size: 30px;

            } 
            div.figura {
                float: left;
                width: 50%;
            }
        </style>
        <br>   
        <div class="row">

            <div class=" col-xs-2" style=" alignment-adjust: 10px;margin-left: 10px; ">

            </div>

            <div class=" col-xs-12" >

                <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
                    <div class="panel-body" style="margin-left: 100px">
                        <jsp:include page="../NavigationBar/navbar.jsp"/> 
                    </div>
                </div>

            </div>
        </div>
    <center><h1>No Achei você pode avançar na sua carreira!</h1></center> 
    <center><p>Com o mercado de trabalho cada vez mais competitivo, todo profissional precisa estar preparado para os desafios constantes!</p>
        <p>Pensando nisso o Achei reune parcerias para você sempre avançar na sua carreira!</p></center>
    <div class="row">
        <div class="pull-left">
            <div class="figura">
                <p><img src="resources/img/cursos.jpg" width="300" height="200" class="pull-left">
            </div>
        </div>
        <div class="pull-left">
            <br>
            <a href="http://www.fai-mg.br/"> 
                <img src="resources/img/fai.png" width="300" height="200" class="pull-left"/></a>
        </div>
        <br>
        <div class="pull-left"> 
            <a href="http://www.etefmc.com.br/"><img src="resources/img/ete.jpg" width="300" height="200" class="pull-left"/></a>
        </div>
        <div class="pull-rigth">
            <a href="http://www.colegiotecnologico.g12.br/"><img src="resources/img/cp1.png"width="300" height="200" class="pull-left"/></a>
        </div>

    </div>
    <div class="row">
        <div class="container" style=" margin-left:290px;">
            <div class="pull-left">
                <br>
                <a href="http://www7.fiemg.com.br/regionais/sul/unidade/senai-santa-rita-do-sapucai-cdtsve-stefan-bogdan-salej"> 
                    <center><p><img src="resources/img/senai.jpg" width="300" height="200" class="pull-left"/></a></p></center>
            </div>
            <div class="pull-left" style="margin-left:10px;">

                <a href="http://www.mg.senac.br/internet/unidades/unidades/pousoalegre/aunidade.htm"> 
                    <img src="resources/img/senac.png" width="250" height="150" class="pull-left"/></a>
            </div>

        </div>
    </div>










    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>
