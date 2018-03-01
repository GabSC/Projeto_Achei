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
            th{
                font-family: verdana;
                color: orange;
                font-size: 150%;
                font-stretch: expanded;                
            }
            p{
                font-family: verdana;
                color: black;
                font-size: 150%;
                font-stretch: expanded;
            }
            h1{
                color: orange;
                font-family: verdana;
                font-size: 200%;
                font-weight: 900;
                font-stretch: expanded;

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

        <div class="container"> 
            <br/>
            <div class="rowclearfix">
                <div class="col-lg-12">
                    <h2>No Achei você encontra uma variedade de profissionais bem qualificados </h2>
                    <center><h2>pertinho de você!</h2></center>
                </div>
            </div>
            <div class="rowclearfix">
                <div class="col-lg-12">
                    <form class="form-inline" method="get">
                        <input type="hidden" name="limit">
                        <input type="hidden" name="offset">
                    </form>
                    <c:if test="${empty categoriaList}">
                        <div class="alert alert-info" role="alert">Nenhum resultado foi encontrado!</div>
                    </c:if>
                    <c:if test="${not empty categoriaList}">
                        <table class= "table table-bordered" style="margin-top: 15px; border: orange">
                            <tr>
                                <th>NOME</th>
                                <th>DESCRIÇÃO</th>
                            </tr> 
                            <c:forEach items="${categoriaList}" var="categoria">
                                <tr>
                                    <td>${categoria.nome}</td>
                                    <td>${categoria.descricao}</td>
                                </tr>    
                            </c:forEach>
                        </table>

                        <div class="text-center">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${(offset - limit)>=0}">
                                        <li> 
                                            <a href="<c:url value="/categorias?limit=${limit}&offset=${offset - limit}"/>" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <li>
                                        <a href="<c:url value="/categorias?limit=${limit}&offset=${offset + limit}"/>" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </c:if>
                </div> 
            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>