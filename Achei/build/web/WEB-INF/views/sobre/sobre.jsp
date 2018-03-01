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
        <div class="rowclearfix"></div>
        <div class="col-md-offset-0"></div>
        <div class="col-md-1">
            <img src="resources/img/sobre.png" width="300" height="250" class="pull-left" style="margin-left:10px;">
        </div>
        <br>
        <div class="rowclearfix"></div>
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <p align="justify"> Fundada em outubro de 2016 na cidade de Santa Rita do Sapucaí, sul de Minas Gerais, o Achei é uma plataforma que conecta clientes a prestadores de serviços. 
                Sua principal missão é apoiar a contratação de profissionais autônomos divulgando-os neste competitivo mercado de trabalho. No Achei, você tem acesso a todos os detalhes de profissionais, tais como informações de contato, fotos. Estas informações lhe ajudam a escolher aquele que você considerar o mais adequado para realizar o seu trabalho.
                Atualmente contamos com 3 funcionários e nossos principais clientes são os mais diversos profissionais que desejam aumentar sua renda.
            </p>
        </div>
        <br>

        <div class="row clearfix">

            <br>
            <div class="col-md-3"></div>
            <div class="col-md-2">
                <div class="figura">
                    <p><img src="resources/img/seguranca.png" width="200" height="200" alt="Transparencia ">
                    <center><h4>Segurança</h4></center>
                    <br>
                    <p align="center">Perfis e dados pessoais verificados</p>
                </div>
            </div>
            <div class="col-md-offset-1"></div>
            <div class="col-md-2">
                <div class="figura">
                    <p><img src="resources/img/transparencia.png" width="200" height="200" alt="Transparencia ">
                    <center><h4>Transparência</h4></center>
                    <br>
                    <p align="center">Compare a reputação do profissional, mediante suas notas</p>
                </div>
            </div>
            <div class="col-md-offset-1"></div>
            <div class="col-md-2">
                <div class="figura">
                    <p><img src="resources/img/qualidade.png" width="200" height="200" alt="Qualidade ">
                    <center><h4>Qualidade</h4></center>
                    <br>
                    <p align="center">Profissionais avaliados pela comunidade</p>
                </div>
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>

