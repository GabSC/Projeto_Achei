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
        <link href="<c:url value="/resources/css/star-rating.css"/>" rel="stylesheet" media="all" type="text/css">

        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="<c:url value="/resources/js/html5shiv.min.js"/>"></script>
          <script src="<c:url value="/resources/js/respond.min.js"/>"></script>
         <script src="<c:url value="/resources/js/star-rating.js"/>"type="text/javascript ></script>
        <![endif]-->
    </head>
    <body>


        <div class="row">

            <div class=" col-xs-2" style=" alignment-adjust: 10px;margin-left: 10px; ">

            </div>

            <div class=" col-xs-12" >

                <div class="panel panel-default" style="margin-left: 20px;margin-right: 20px;margin-top:10px;">
                    <div class="panel-body" style="margin-left: 100px">
                        <jsp:include page="../NavigationBar/navbar.jsp"/> 
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="center" style="margin-left: 40%">
                <label style="margin-left: 15%">Filtros: </label>
                <form method="Post">
                    <input type="checkbox" name="filtro" id="dis" value="1">Disponibilidade
                    <input type="checkbox" name="filtro" id="loc" value="2">Localização
                    <input type="checkbox" name="filtro"  id="qua" value="3">Qualidade
                    <input type="Submit" class="alert alert-danger" name="Filtrar" value="Filtrar!" style="font-size: 10px">
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <c:if test="${empty autonomosList}">
                    <div class="alert alert-info" role="alert">Nenhum resultado foi encontrado!</div>
                </c:if>

                <c:if test="${not empty autonomosList}">

                    <c:forEach items="${autonomosList}" var="autonomo">

                        <div class="row">


                            <div class="col-xs-12">

                                <div class="container" style="margin-left: 12%">

                                    <div class="panel panel-default">

                                        <div class="panel-heading">

                                            <span style="font-size: 25px;font-style: oblique">${autonomo.nome}</span>

                                        </div>

                                        <div class="panel-body">

                                            <img src="<c:url value="/resources/img/cursos.jpg"/>" width="200px" height="100px"/>

                                            <label style="margin-left: 30%">Disponibilidade:</label>


                                            <c:if test="${autonomo.status == true}">

                                                <span class="glyphicon glyphicon-thumbs-up" style="font-size: 20px;margin-left: 5px"></span>

                                            </c:if>

                                            <c:if test="${autonomo.status == false}">

                                                <span class="glyphicon glyphicon-thumbs-down" style="font-size: 20px;margin-left: 5px"></span>

                                            </c:if>


                                            <br>

                                            <label style="margin-left: 49%;">Local: </label>
                                            ${autonomo.cidade.nome}
                                            <br>



                                            <div class="container" >  

                                                <div class="rating-container rating-xs rating-animate">
                                                    <div class="clear-rating clear-rating-active" title="Clear">
                                                        <div class="rating">
                                                            <div class="caption">
                                                                <input id="input-21e" class="rating hide" value="2.5" min="0" max="5" step="0.5" data-size="xs" type="number" readonly="true">
                                                            </div>

                                                        </div>


                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>
                                </div>


                            </div>

                            <!--                    <div class="col-xs-6">    -->


                            <!--                                                <div class="container">
                            
                                                                <div class="panel panel-default">
                            
                                                                    <div class="panel-heading">
                            
                                                                        <span style="font-size: 25px;font-style: oblique">${autonomo.nome}</span>
                            
                                                                    </div>
                            
                                                                    <div class="panel-body">
                            
                                                                        <img src="<c:url value="/resources/img/cursos.jpg"/>" width="50px" height="50px"/>
                            
                                                                        <label>Disponibilidade:</label>
                                                                       
                                                                        <br>
                            
                                                                        <label>Local: </label>
                                                                     
                                                                        <br>
                            
                                                                        <label>Qualidade: </label>
                            
                                                                        <div class="container"> 
                            
                                                                            <div class="rating-container rating-xs rating-animate">
                                                                                <div class="clear-rating clear-rating-active" title="Clear">
                                                                                    <div class="rating">
                                                                                        <div class="caption">
                                                                                            <input id="input-21e" class="rating hide" value="2.5" min="0" max="5" step="0.5" data-size="xs" type="number" readonly="true">
                                                                                        </div>
                            
                                                                                    </div>
                            
                            
                                                                                </div>
                            
                                                                            </div>
                            
                                                                        </div>
                            
                                                                    </div>
                            
                                                                </div>
                                                            </div>
                            -->

                            <!--                                </div>        -->


                        </div>                       


                    </c:forEach>


                </c:if>  

            </div>


        </div>        


    </body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/star-rating.min.js"/>"type="text/javascript" ></script>


</body>
</html>




