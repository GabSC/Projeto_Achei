<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Profissionais</title>

        <!-- Bootstrap -->
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/select2-bootstrap.css"/>" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="<c:url value="/resources/js/html5shiv.min.js"/>"></script>
          <script src="<c:url value="/resources/js/respond.min.js"/>"></script>
        <![endif]-->
        <style type="text/css">
            p{
                color: blue;
                font-stretch: expanded;
                font-family: verdana;
                font-size: 130%;
                font-weight: 700;
                font-stretch: expanded;
            }
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
            <Strong><h1>Bem-Vindo Profissional! 
                    <c:if test="${empty profissional.id}"></c:if><c:if test="${not empty profissional.id}"><small>editar</small></c:if></h1></strong>
                <div class="row">
                </div>
                <form method="post">
                    <div class="row"  >
                        <div class="col-xs-5">


                            <div class="form-group">
                                <label>*</label>
                                <label for="inputNome">Nome:</label>
                                    <input type="text" class="form-control" id="inputNome" name="nome" value="${profissional.nome}"/>
                            <label>*</label>
                            <label for="inputCPF">CPF:</label>
                            <input type="text" class="form-control" id="inputCPF" name="cpf" value="${profissional.cpf}"/>
                            <label for="inputCNPJ">CNPJ:</label>
                            <input type="text" class="form-control" id="inputCNPJ" name="cnpj" value="${profissional.cnpj}"/>
                            <label>*</label>
                            <label for="inputEmail">Email:</label>
                            <input type="email" class="form-control" id="inputEmail" name="email" value="${profissional.email}"/>
                            <label>*</label>
                            <label for="cidade">Cidade:</label>
                            <select class="form-control" id="comboCidade" name="cidade.id">
                                <c:forEach items="${cidadeList}" var="cidade">
                                    <option value="${cidade.id}">${cidade.nome}>${cidade.uf}</option>
                                </c:forEach>
                            </select>
                            <label>*</label>
                            <label for="inputUF">UF:</label>
                            <input type="text" class="form-control" id="inputNome" name="UF" value="${profissional.uf}"/>
                            <label>*</label>
                            <label for="inputCategoria">Categoria:</label>
                            <input type="text" class="form-control" id="categoria" name="categoria" value="${profissional.categoria}"/>

                            <label for="inputtelefoneFixo">Telefone Fixo:</label>
                            <input type="text" class="form-control" id="inputTelefoneFixo" name="telefonefixo" value="${profissional.telefonefixo}"/>
                            <label>*</label>
                            <label for="inputTelefoneCelular">Telefone Celular:</label>
                            <input type="text" class="form-control" id="inputCidade" name="telefonecelular" value="${profissional.telefonecelular}"/>
                            <label for="inputDescricao">Descricao:</label>
                            <input type="text" class="form-control" id="inputDescricao" name="descricao" value="${profissional.descricao}"/>
                            <label>*</label>
                            <label for="inputSenha">Senha:</label>
                            <input type="password" class="form-control" id="inputSenha" name="senha" value="${profissional.senha}"/>
                            <label>*</label>
                            <label for="inputConfirmarSenha">Confirmar Senha:</label>
                            <input type="password" class="form-control" id="inputConfirmarSenha" name="ConfirmarSenha" value="${profissional.confirmarsenha}"/>
                            <input hidden="true" id="txtFoto" name="foto" value="${cliente.foto}">
                            <input hidden="true" id="txtcartaoVisitas" name="cartaoVisitas" value="${cliente.cartaoVisitas}">
                        </div>


                    </div>
                    <div class="rowclearfix">
                        <div class="col-lg-6">
                            <div class="row" >
                                <div class="col-lg-12">
                                    <div class="panel panel-default" style="margin-top: 20px; margin-left: 100px">
                                        <div class="panel-body" style="margin-bottom: 50px">
                                            <c:if test="${not empty profissional.foto}">
                                                <center><img style="max-width: 250px; max-height: 250px;" id="imgFoto" src="<c:url value="${profissional.foto}"/>"></center>
                                                </c:if>
                                                <c:if test="${empty profissional.foto}">
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
                            <div class="row clearfix">
                                <div class=" col-lg-12">      
                                    <div class="panel panel-default" style="margin-top: 20px; margin-left: 100px">
                                        <c:if test="${not empty profissional.cartao}">
                                            <center><img style="max-width: 250px; max-height: 250px;" id="imgFoto" src="<c:url value="${profissional.cartao}"/>"></center>
                                            </c:if>
                                            <c:if test="${empty profissional.cartao}">
                                            <center> <img style="max-width: 250px; max-height: 250px;" id="imgFoto" src="<c:url value="/resources/img/clip.png"/>"/></center>
                                            </c:if>
                                        <output id="list" ></output>
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
                <jsp:include page="../../planos/planos.jsp"></jsp:include>
                    <center><button type="submit" class="btn btn-warning">Confirmar</button></center>
                </form>

                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
            <!-- Include all compiled plugins (below), or include individual files as needed -->
            <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
            <script src="<c:url value="/resources/js/select.min.js"/>"></script>

            <script type="text/javascript">
                $('#comboCidade').select2();
            </script>
            <script>
                $('#file').change(function (event) {

                    var fileFoto = event.currentTarget;

                    var txtFoto = $('#txtFoto');
                    var imgFoto = $('#imgFoto');

                    var data = new FormData();
                    data.append('file', fileFoto.files[0]);
                    $.ajax({
                        method: 'POST',
                        url: '/web/uploadFotoProfissional',
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

            <script>
                $('#file').change(function (event) {

                    var filecartaoVisitas = event.currentTarget;

                    var txtcartaoVisitas = $('#txtcartaoVisitas');
                    var imgcartaoVisitas = $('#imgcartaoVisitas');

                    var data = new FormData();
                    data.append('file', filecartaoVisitas.files[0]);
                    $.ajax({
                        method: 'POST',
                        url: '/web/uploadCartaoProfissional',
                        data: data,
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            txtcartaoVisitas.val(data);
                            imgcartaoVisitas.attr('src', data);
                        }
                    });
                });
            </script> 


    </body>
</html>