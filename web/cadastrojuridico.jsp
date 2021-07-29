<%-- 
    Document   : cadastrojuridico
    Created on : 27 de jul. de 2021, 14:53:33
    Author     : Ricardo.Schvambach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Empresa</title>
        <link href="styles/start.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <img src="imagens/cuppa-inicio.gif" alt="Cuppa">
        </header>
        <form action="cadastroendereco.jsp" method="POST">
            <center>
                <input type="text" name="razao" maxlength="40" placeholder="Razão Social:">    
                <input type="text" name="email" placeholder="E-mail:">           
                <input type="password" name="senha" placeholder="Senha:">
                <input type="text" name="cnpj" placeholder="CNPJ:">           
                <textarea name="descricao" placeholder="Informações da padaria:"
                          maxlength="250"></textarea>
            
            <input type="submit" class="btn btn-outline-secondary" value="Salvar">
            <input type="reset" class="btn btn-outline-secondary" value="Limpar">
            </center>
        </form>
    </body>
</html>
