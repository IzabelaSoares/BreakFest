<%-- 
    Document   : cadastroenderecopessoa
    Created on : 27 de jul. de 2021, 15:08:13
    Author     : Ricardo.Schvambach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de endereço</title>
    </head>
    <body>
        <form action="login.jsp" method="post">
            <center>
            <label> CEP: </label>
            <input type="text" name="cep">
            
            <label> Rua: </label>
            <input type="text" name="rua">
            
            <label> Número: </label>
            <input type="number" name="nrcasa">
            
            <input type="submit" name="Salvar">
            <input type="reset" name="Limpar"> 
            </center>
        </form>
    </body>
</html>
