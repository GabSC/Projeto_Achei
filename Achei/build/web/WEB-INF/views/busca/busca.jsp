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
        label{
            color: orangered;
            font-family: verdana;
            font-size: 30px;
        }
        h2{
            color: orange;
            font-family: verdana;
            font-size: 20px;
        }
        h3{
            color: orangered;
            font-family: verdana;
            font-size: 20px;
        }
        p{
            color: black;
            font-family: verdana;
            font-size: 15px;
        }
        ol{
            color: black;
            font-family: verdana;
            font-size: 15px;
        }

    </style>
    <body>
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
        <div class="row">
            <div class="container" style="margin-left: 35%;">
                <div class="col-xs-8">
                    <div class="col-xs-10">
                        <div class="pull-left">
                            <br>
                            <br>
                            <br>
                            <br>
                            <br>
                            <label>De quem você precisa ? 
                             
                                
                                <div class="col-lg-6">
                                    <form method="Post">
                                    <br>
                                     <div class="input-group">
                                         <input type="text" class="form-control" placeholder="Eletricista, Pedreiro" name="categoria" value="${categoria}">
                                        <span class="input-group-btn" style="margin-left:40px;">
                                            <button class="btn btn-warning" type="Submit" >ir</button>
                                        </span>
                                    </div>
                                    
                                    </form>
                                   
                                </div>
                            </label>
                        </div>
                    </div>
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