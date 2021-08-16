<%-- 
    Document   : recuperarsenha
    Created on : 11 de ago. de 2021, 14:02:59
    Author     : Ricardo.Schvambach e Maria
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
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null); %>
        <title>Recuperando Senha</title>
    </head>
    <body onload="javascript: alertar(resultado)">
        <div class="body">
            <!-- Inicio do Form -->
            <form action="receberecuperarsenha.jsp" method="post">
               <!-- Container -->
            <div class="container">
                <h2 id="title">Recuperar senha</h2>
                <!-- Inputs -->
                <input type="text" name="email" class="login-element" placeholder="E-mail">
                <input type="password" name="senhanova" class="login-element" placeholder="Nova senha">
                <input type="password" id="confirmarsenha" class="login-element" placeholder="Confirme-a">
                <input type="submit" id="login-btn" value="Criar nova senha">
            </div>
           </form>
            <!-- Fim do form -->
        </div>
        <script>
            <!-- Fazer a validação das senhas aqui -->
        </script>
    </body>
</html>
