<%-- 
    Document   : emailrecuperarsenha
    Created on : 13/08/2021, 09:41:38
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/recuperarsenha.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

        <title>Recuperando Senha</title>
    </head>
    <body onload="javascript: alertar(resultado)">
        <div class="body">
            <!-- Inicio do Form -->
            <form action="recebeemail.jsp" method="post">
                <!-- Container -->
                <div class="container">
                    <h2 id="title">Digite seu email</h2>
                    <!-- Inputs -->
                    <input type="text" name="email" class="login-element" placeholder="E-mail">
                    <input type="submit" id="login-btn" value="Enviar email">
                </div>
            </form>
            <!-- Fim do form -->
        </div>
    </body>
</html>

