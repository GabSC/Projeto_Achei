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
    <style>
        button{
            color: white;
            font-family: verdana;
            font-size: 80%;
        }
        
    </style>
    <body style="background-color:white">
        <div class="row">
            <br>
        </div>  
        <div class="row">
            <div class=" col-xs-2" style=" alignment-adjust: 10px;margin-left: 10px; ">
            </div>
            <div class=" col-xs-12" >

                <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
                    <div class="panel-body" style="margin-left: 100px">
                        <jsp:include page="WEB-INF/views/NavigationBar/navbar.jsp"/> 
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <jsp:include page="WEB-INF/views/Carrossel/carrosselComp.jsp"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row clearfix">
                    <div class=" col-lg-12" style="padding-left: 40px; padding-right: 40px;">      
                        <div class="panel panel-default">
                            <div class="panel-heading"><font size="3">Clientes</font></div>
                            <form action="<c:url value="/login"/>" method="post">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="ClienteEmail">Email:</label>
                                        <input type="email" class="form-control" id="ClienteEmail" name="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="ClientePassword">Senha:</label>
                                        <input type="password" class="form-control" id="ClientePassword" name="senha">
                                    </div>
                                    <div class="row clearfix">
                                        <center><button type="submit" class="btn-warning btn"><b>Entrar e Procurar!</b></button></center>
                                    </div>
                                    <label>Ainda não possui uma conta?</label>
                                    <a href="/web/cadastros/cliente" style="">Cadastre-se!</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class=" col-lg-12" style="padding-left: 40px; padding-right: 40px;">      
                        <div class="panel panel-default">
                            <div class="panel-heading"><font size="3">Profissionais Autônomos</font></div>
                            <form action="<c:url value="/login"/>"method="post">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="profissionalEmail">Email:</label>
                                        <input type="email" class="form-control" id="ClienteEmail">
                                    </div>
                                    <div class="form-group">
                                        <label for="profissionalPassword">Senha:</label>
                                        <input type="password" class="form-control" id="ClientePassword">
                                    </div>
                                    <div class="row clearfix">
                                        <center><button type="button" class="btn-warning btn"><b>Entrar e Divulgar!</b></button></center>
                                    </div>
                                    <label>Ainda não possui uma conta?</label>
                                    <a href="/web/cadastros/profissional" style="">Cadastre-se!</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <p style="margin-left: 10%;">©2016,Achei Encontre profissionais e mão de obra especializada.
                FAI - Santa Rita do Sapucaí - MG.Todos os direitos reservados</p>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>