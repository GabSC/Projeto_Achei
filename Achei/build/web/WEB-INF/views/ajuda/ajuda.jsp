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
        h1{
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
        <div class="container">
            <jsp:include page="../NavigationBar/navbar.jsp"/>

       </div>
        <img src="resources/img/ajuda.png" width="200" height="250" class="pull-left" style="margin-left:80px;">
        <div class="rowclearfix">

            <div class=" col col-md-3"></div>
            <div class=" col col-md-9">

                <center><h1>Achei Ajuda!</h1></center>
                <a href="<c:url value="/sobre"/>" style="margin-left: 25px">O que é Achei ?</a>
                <b><h2>Como faço para me cadastrar no Achei?</h2></b>

                <p>Com apenas três passos cadastre-se no Achei é muito rápido e simples:</p>

                <p>1 Passo:	Selecione o tipo de conta que melhor se encaixa em seus interesses em usar o Achei.
                    Para isso disponibilizamos os tipos de usuários clientes e profissionais.</p>

                <p>2 Passo:	Em seguida  abrirá um formulário que você deve completar .</p>

                <p>3 Passo: Clique em confirmar. Dessa forma você finalizará o processo e ficará cadastrado.</p>


                <h2>Quanto custa usar o achei ?</h2>

                <h3>Clientes:</h3>
                <p>Para clientes a utilização do software é gratuita.</p>

                <h3>Profissionais:</h3>
                <p>para melhor atender os seus parceiros o Achei possui  4 tipos de planos :</p>
                <h2>Grátis:</h2><p>Este plano é sem custo para divulgação, e possui um prazo determinado de 15 dias, dessa forma o profissional poderá experimentar o Achei e tirar suas conclusões antes de contratar um plano maior.</p>
                <h2>Básico:</h2><p>Ao Adquirir este plano o profissional poderá utilizar dos serviços prestados pelo Achei por um período de  03 meses. O valor do plano : R$ 10,00.</p>
                <h2>Médio:</h2><p>Ao Adquirir este plano o profissional poderá utilizar dos serviços prestados pelo Achei por um período de  06 meses. O valor do plano : R$ 20,00.</p>
                <h2>Pró:</h2><p>Ao Adquirir este plano o profissional poderá utilizar dos serviços prestados pelo Achei por um período de  01 ano. O valor do plano : R$ 30,00.</p>

                <h2>Profissional  quais são as vantagens de anunciar no achei ?</h2>
                <p>O objetivo do Achei é ajudar profissionais como você a conseguirem mais e melhores clientes, além de fornecer ferramentas para facilitar e melhorar o seu trabalho.
                <p>Algumas Vantagens do Achei:</p>  
                <ol>
                    <li>Aumentar a visibilidade do seu trabalho;</li><br>
                    <li>Ser parte de uma lista segura de profissionais certificados, gerando mais confiança em novos clientes;</li><br>
                    <li>Otimize seu trabalho para poder atender mais clientes em um mesmo dia;</li><br>
                    <li>Obter novos clientes através da avaliação de pessoas que já contrataram seus serviços;</li><br>
                    <li>Se manter informado sobre novos cursos e qualificações que estão disponíveis no mercado de forma que o profissional aumente sua capacitação;</li><br>
                </ol>

            </div>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    </body>
</html>

