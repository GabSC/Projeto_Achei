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
        <style type="text/css">

            h1{
                color: orange;
                font-family: verdana;
                font-size: 200%;
                font-weight: 900;
                font-stretch: expanded;

            }
            #ok{
                display: none; 
            }

            #enviar{

                display: none;
            }

            .thumb {
                height: 75px;
                border: 1px solid #000;
                margin: 10px 5px 0 0;
            }
            button{
                color: white;
                font-family: verdana;
                font-size: 80%;
            }
            label{color: orangered;
                  font-weight: 900;
            }
        </style>



    </head>
    <body>
        <div class="container"> 
            <Strong><h1>Bem-Vindo! 
                    <c:if test="${empty cliente.id}"></c:if><c:if test="${not empty cliente.id}"><small>editar</small></c:if></h1></strong>
                <br/>

                <div class="row">
                    <br>
                    <br>
                    <br>
                </div>
                <div class="row"  >
                    <div class=" col-xs-5">
                        <form method="post">

                            <div class="form-group">
                            <label>*</label>
                            <label for="inputNome">Nome:</label>
                            <input type="text" class="form-control" id="inputNome" name="nome" value="${cliente.nome}"/>
                            <label>*</label>
                            <label for="inputCPF">CPF:</label>
                            <input type="text" class="form-control" id="inputCPF" name="cpf" value="${cliente.cpf}"/>
                            <label>*</label>
                            <label for="inputEmail">Email:</label>
                            <input type="text" class="form-control" id="inputEmail" name="email" value="${cliente.email}"/>
                            <label>*</label>
                            <label for="inputSenha">Senha:</label>
                            <input type="password" class="form-control" id="inputSenha" name="senha" value="${cliente.senha}"/>
                            <label>*</label>
                            <label for="inputConfirmarSenha">Confirmar Senha:</label>
                            <input type="password" class="form-control" id="inputConfirmarSenha" name="ConfirmarSenha" value="${cliente.confirmarsenha}"/>
                            <input hidden="true" id="txtFoto" name="foto" value="${cliente.foto}">
                        </div>
                        <button type="submit" id="ok" name="ok" class="pull-right btn btn-warning" >Confirmar</button> 
                    </form>
                </div>         
                <div class="col-xs-offset-7">

                    <div class="row" >

                        <div class="col-lg-12">

                            <div class="panel panel-default" style="margin-top: 20px">
                                <div class="panel-body" style="margin-bottom: 50px">
                                    <c:if test="${not empty cliente.foto}">
                                        <center><img style="max-width: 250px; max-height: 250px;" id="imgFoto" src="<c:url value="${cliente.foto}"/>"></center>
                                        </c:if>
                                        <c:if test="${empty cliente.foto}">
                                        <center> <img style="max-width: 250px; max-height: 250px;" id="imgFoto" src="<c:url value="/resources/img/perfil.jpg"/>"/></center>
                                        </c:if>
                                    <output id="list" ></output>
                                </div>
                                <div class="panel-footer">
                                    <div class="container">
                                        <section style="margin-right:100px;">
                                            <input id="file" type="file" name="file">
                                        </section>
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <div class="row" >    
            <div class="col-xs-offset-4" >
                <br>
                <a href="/web/cliente/termo "style="margin-left: 55px">Termo de contrato e prestação de serviço </a><br>
                <input type="radio" id = "termoSim" name =" termo" style="margin-left: 100px">sim</input>
                <input type="radio" id = "termoNao" name =" termo" style="margin-left: 100px">Não</input>
                <br>
                <br>
                <label for="ok" class="btn btn-warning" style="margin-left: 110px"><b>Confirmar Cadastro</b></label>
                <p id="demo"> </p>
            </div>
            <div>   
            </div>
        </div>  
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script>
            $('#file').change(function (event) {

                var fileFoto = event.currentTarget;

                var txtFoto = $('#txtFoto');
                var imgFoto = $('#imgFoto');

                var data = new FormData();
                data.append('file', fileFoto.files[0]);
                $.ajax({
                    method: 'POST',
                    url: '/web/uploadFoto',
                    data: data,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        txtFoto.val(data);
                        imgFoto.attr('src', data);
                    }
                });

            });

        </script>
    </body>
</html>