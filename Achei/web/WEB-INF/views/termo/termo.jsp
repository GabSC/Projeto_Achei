<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
            color: orange;
            font-family: verdana;
            font-size: 120%;

        }
        h2{
            color: orange;
            font-family: verdana;
            font-size: 90%;
        }
        h3{
            color: orange;
            font-family: verdana;
            font-size: 90%;
        }
        p{
            color: black;
            font-family: verdana;
            font-size: 100%;  
        }
        label {
            color: black;
            font-family: verdana;
            font-size: 100%;     
        }
    </style>
    <body>

        <h1 align="center"><Strong>Termo de Contrato e prestação de Serviços</center></Strong><br/>

            <br><p>Esta LICENÇA DE USO deve ser lida com atenção antes do SOFTWARE ser utilizado. A utilização do SOFTWARE, mesmo que parcial ou a título de teste,<br>
                indica que o cliente está ciente dos termos desta LICENÇA DE USO DE SOFTWARE, concordando com os mesmos.<br>
                Em caso de discordância dos termos aqui apresentados, 
                a utilização do SOFTWARE deve ser imediatamente interrompida.<br>
                Esta LICENÇA DE USO DE SOFTWARE se encontra também publicada dentro do próprio SOFTWARE.</p>

            <p align="center">O software objeto desta LICENÇA DE USO, pode ser tratado também pela denominação de programa de computador, programa, software, sistema ou site.</label></p>

            <h3 align="center"><b>Adesão ao Contrato:</b></center><p align="center"> A aceitação deste CONTRATO se concretiza na ocasião da utilização, mesmo que parcial ou a título de teste do SOFTWARE,<br> 
                    ou na aquisição desta LICENÇA DE USO DE SOFTWARE, feita eletronicamente através da internet.</center></p>

                <h2 align="center"><b> Normas e condições gerais:</center></b>

                    <br><p>O SOFTWARE é disponibilizado pela LICENCIANTE para utilização da LICENCIADA via internet. 
                        <br>Para que a LICENCIADA possa utilizar o SOFTWARE se faz necessário que o mesmo esteja devidamente instalado 
                        e mantido hospedado em um servidor de internet da LICENCIANTE 
                        ou outro por ela expressamente homologado.</p>
                    <h2 align="center"><b>Regras para publicação de conteúdo:</center></b>
                        <p><labe> As seguintes regras devem ser obedecidas pela LICENCIADA, visando respeito moral e social,<br> bem como o bom e perfeito funcionamento do site, sendo expressamente proibida a inclusão dos seguintes conteúdos:</label><br/>

                            <br><label>- Publicação ou veiculação de material pornográfico, racista ou ofensivo.</label> 
                            <br><label>- Incitação ao crime ou informações sobre atividades ilegais.</label> 
                            <br><label>- Informações relativas à pirataria de software.</label>
                            <br><label>- Material calunioso, que atribua falsamente a alguém , afirmações injuriosas que ofendam a dignidade de alguém. </label>
                            <br></label></p>

                            <div class="container"> 
                                <form method="post">
                                    <div class="form-group">
                                        <button type="submit" class=" center-block btn btn-warning">Voltar</button>
                                    <c:if test="${tipo == 'C'}">
                                        <div class="col-xs-12"> 
                                            <a href="<c:url value="/web/cadastros/cliente"/>" style="margin-left:50px"<button  class="btn btn-warning"><b>Voltar</b></button></a>
                                        </div>
                                    </c:if>
                                    <c:if test="${tipo == 'P'}">
                                        <div class="col-xs-12"> 
                                            <a href="/web/planos/planos" style="margin-left:50px "><button  class="btn btn-warning"><b>Voltar</b></button></a>
                                        </div>
                                    </c:if>                                
                                    </div>
                                    </form>     


                                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                                <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
                                <!-- Include all compiled plugins (below), or include individual files as needed -->
                                <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
                                </body>
                                </html>
