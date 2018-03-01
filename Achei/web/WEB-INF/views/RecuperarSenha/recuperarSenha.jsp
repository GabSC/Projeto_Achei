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
    <Style>
        h1{
              
            font-weight: 900;
            font-stretch: expanded;                   
            color: red;
            font-family: verdana;
            font-size: 30px;
        } 
        h2{
            color : black;
            font-family: verdana;
            font-size: 20px;
        }

        p{
            color: black;
            font-family: verdana;
            font-size: 10px;  

        }
    </Style>   
    <body>
        <br>   
        <div class="row">

            <div class=" col-xs-2" style=" alignment-adjust: 10px;margin-left: 10px; ">

            </div>

            <div class=" col-xs-12" >

                <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
                    <div class="panel-body" style="margin-left: 100px">
                        <img src="resources/img/Achei.png" width="140" height="53" class="pull-left" style="margin-right:150px;">
                        <jsp:include page="../NavigationBar/navbar.jsp"/> 
                    </div>
                </div>

            </div>
        </div>
        <div class="row clearfix">
            <br>
            <br>
            <Strong><center><b><h1>Email ou Senha Inválidos</h1></b></center></strong>
            <center><h2>Digite um email válido para recuperar senha</h2></center>
            <br>
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <br>
                    <div class="caption">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Usuario123" aria-describedby="basic-addon2">
                            <span class="input-group-addon" id="basic-addon2">@exemplo.com</span>
                        </div>
                        <br>
                        <center><button type="button" class="btn btn-warning btn-sm" style="margin-left: 50px"><b>Enviar</button><br></b></center>   
                        <br>
                        <center><labe>Ainda não possui uma conta?</labe>
                            <a href="/web" style="">Cadastre-se!</a></center> 
                      </div>
                </div>
            </div>
    </body>
</html>
