<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        ul {
            color: white;
            font-family: verdana;
            font-size: 100%;
        }
    </style>
    <body>

        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="margin-right: 150px;padding-left: 0px;padding-top: 2px">

                <img src=" <c:url value="/resources/img/Achei.png"/> " width="140" height="53"   >

            </a>
        </div>   
        <ul class="nav nav-pills">
<li role="presentation" class="btn btn-warning"><a  href="/web" style="color:white;"><Strong>Início</a></li></strong>
<li role="presentation" class=" btn btn-warning mudacor"><a href="<c:url value="/servicos"/>"style="color:white; background-color:ffa726;color:white;    
}"><Strong>Serviços Existentes</a></li></strong>
<li role="presentation" class="btn-warning btn"><a href="<c:url value="/cursos"/>"style="color:white;"><Strong>Cursos e Qualificações</a></li></strong>
<li role="presentation" class="btn-warning btn"><a href="<c:url value="/ajuda"/>"style="color:white;"><Strong>Ajuda</a></li></strong>            
<li role="presentation" class="btn-warning btn"><a href="<c:url value="/sobre"/>" style="color:white;"><Strong>Sobre</a></li></strong>
</ul>

</body>
</html>
