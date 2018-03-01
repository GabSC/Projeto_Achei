
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

            #EnviarCartao{

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
                        <!--  <button type="button" class="btn btn-danger" style="margin-left: 170px">Enviar Foto</button> -->
                        <label for="AlterarFoto" class="btn btn-warning " style="margin-left: 120px">Alterar Foto </label>

                        <input id="AlterarFoto" name="input5[]" type="file" multiple class="file-loading">
                    </div>
                </div>
            </div>
            <div class="col-xs-4">

                <label> Categorias cadastradas: <select name="CategoriasCadastradasSelect"> </select> </label>
                <br>
                <label> Email: Var </label>
                <br>
                <label>Telefones:<select name="TelefonesCadastrados"> </select> </label>
                <br>
                <label> Senha: <input type="password" name="senha" id="senhaTxB"> </label>
                <br>
                <label> Confimar Senha: <input type="password" name="Confimarsenha" id="ConfirmarsenhaTxB"></label>
            </div >
            <div class="col-xs-4">

                <label> Status Semanal</label>
                <br>
                <input type="radio" name="Status" id="DisponvelRadio"> Disponível 
                <br>
                <input type="radio" name="Status" id="IndisponivelRadio"> Indisponível
                <br>

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


                        <!--  <button type="button" class="btn btn-danger" style="margin-left: 170px">Enviar Foto</button> -->
                        <label for="EnviarCartao" class="btn btn-warning " style="margin-left: 80px">Enviar Cartão de Visitas </button>

                            <input id="EnviarCartao" name="input6[]" type="file" multiple class="file-loading">
                            </div>

                            </div>
                            </div>
                            <div class="col-xs-4">
                                <label>Aprensentação Profissional </label>
                                <br>
                                <textarea id="TxAreaProf" Name="TxArea1" cols="25" rows="8" style="margin-top: 3px;"> </textarea>
                                <input type="button" class="btn btn-warning" name="btnApresentacao" id="btnApresentacaoProf" value="Editar" style="margin-bottom: 20px;">
                            </div>
                            <div class="col-xs-4">
                                <label> Sua nota média é: </label>
                                <br>
                                <div class="panel panel-default" style="margin-top: 10px;margin-left: 20px;width: 80px;height: 80px;">
                                    <div class="panel-body" style="margin-bottom: 10px;">

                                        <label id="LbMostrarNota" style="color: orange;font-size: 32px">var</label>
                                    </div>
                                    <a href="#"> ver detalhes </a>
                                </div>
                            </div> <!-- fim div row -->
                    </div>          
                    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
                    <!-- Include all compiled plugins (below), or include individual files as needed -->
                    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
                    </body>
                    </html>
