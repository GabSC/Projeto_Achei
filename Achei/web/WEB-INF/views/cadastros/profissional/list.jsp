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
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="<c:url value="/resources/js/html5shiv.min.js"/>"></script>
          <script src="<c:url value="/resources/js/respond.min.js"/>"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container"> 
            <h1>Profissionais</h1>
            <br/>
            <a class="pull-right btn btn-primary" 
               href="<c:url value="/cadastros/profissional"/>">Nova</a>
            <br/>
            <br/>
            <c:if test="${empty profissionalList}">
                <div class="alert alert-info" role="alert">Nenhum resultado foi encontrado!</div>
            </c:if>
            <c:if test="${not empty profissionalList}">
                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>NOME</th>
                        <th>EMAIL</th>
                        <th>CPF</th>
                        <th>CNPJ</th>
                        <th>CIDADE</th>
                        <th>STATUS</th>
                        <th>CATEGORIA</th>
                        <th>PLANODIVULGACAO</th>
                        <th>TELEFONEFIXO</th>
                        <th>TELEFONECELULAR</th>
                        <th>DESCRICAO</th>
                        <th>SENHA</th>
                        <th>CONFIRMARSENHA</th>
                        <th></th>
                    </tr> 
                    <c:forEach items="${profissionalList}" var="profissionais">
                        <tr>
                            <td>${profissional.id}</td>
                            <td>${profissional.nome}</td>
                            <td>${profissional.cpf}</td>
                            <td>${profissional.email}</td>
                            <td>${profissional.senha}</td>
                            <td>${profissional.foto}</td>
                            <td>${profissional.descricao}</td>
                            <td>${profissional.cartaoVisitas}</td>
                            <td>${profissional.planoDivulgacao}</td>
                            <td>${profissional.telefoneFixo}</td>
                            <td>${profissional.telefoneCelular}</td>
                            <td>${profissional.cnpj}</td>
                            <td>${profissional.cidade}</td>
                            <td>${profissional.categoria}</td>
                            <td class="text-right">
                                <a href="<c:url value="/profissionais/${profissional.id}/editar"/>" class="btn btn-sm btn-default">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </a>
                                <a href="<c:url value="/profissionais/${profissional.id}/excluir"/>" class="btn btn-sm btn-danger">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>    
                    </c:forEach>
                </table>
            </c:if>
        </div>  
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>