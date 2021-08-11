<%-- 
    Document   : preferenciapagamento
    Created on : 11 de ago. de 2021, 14:44:57
    Author     : Ricardo.Schvambach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/preferenciapagamento.css" rel="stylesheet">
        <title>Pagamento</title>
    </head>
    <body>
        <div class="central">
        <div class="container">
        <label>Como você receberá o pagamento?</label>
        <select>
            <option value="" selected disabled hidden>Escolha aqui</option>
            <option value="deposito">Depósito Bancário</option>
            <option value="pix">Pix</option>
        </select>
        </div>
        </div>
    </body>
</html>
