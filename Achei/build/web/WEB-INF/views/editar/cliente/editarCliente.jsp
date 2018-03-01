<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Clientes</title>

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

            #AlterarFoto{

                display : none;

            }

        </style>

        <div class="row">
            <br>
        </div>  

        <div class="row">


            <div class=" col-xs-2" style=" alignment-adjust: 10px;margin-left: 10px; ">


            </div>

            <div class=" col-xs-12" >

                <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px">
                    <div class="panel-body" style="margin-left: 100px">

                        <jsp:include page="../../NavigationBar/navbar.jsp"/> 


                    </div>
                </div>

            </div>

        </div>


        <div class="row">


            <div class="col-xs-4">

                <div class="panel panel-default" style="margin-top: 10px;margin-left: 20px;">
                    <div class="panel-body" style="margin-bottom: 10px">

                        <img src=" <c:url value="/resources/img/perfil.jpg" />" alt="Error" width="100" height="100" style="margin-left:115px"/>
                        <output id="list" ></output>
                    </div>
                    <div class="panel-footer">
                        <label for="AlterarFoto" class="btn btn-warning " style="margin-left: 120px">Alterar Foto </label>

                        <input id="AlterarFoto" name="input7[]" type="file" multiple class="file-loading">
                    </div>
                </div>
            </div>
            <div class="col-xs-8"> 
                <label>${cliente.nome}</label>
                <br>
                <br>
                <label>Nome de usuário:  ${cliente.nome} </label> <input id="btnAlterarNomeCliente" type="submit" class="btn btn-warning" value="Alterar" style="margin-left: 126px;">
                <br>
                <br>
                <label style="margin-left: 74px;">Senha: </label><input type="password" id="txPassCliente">
                <br>
                <label>Confirmar Senha: </label><input type="password" id="txPassClienteConfirm"><input id="btnAlterarSenhaCliente"type="submit" class="btn btn-warning" value="Alterar" style="margin-left: 10px;">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4" >
                <label style="margin-left: 20px;"> Avaliações feitas por você:  </label> <a href="#"> visualizar notas </a>
                <div class="panel panel-default" style="margin-top: 10px;margin-left: 20px;width: 200px;height: 80px;">
                    <div class="panel-body" style="margin-bottom: 10px;">

                        <label id="LbMostrarUltimasAvaliacoesFeitas" style="color: orange;font-size: 32px">Avaliações</label>

                    </div>



                </div>


            </div>

        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>
