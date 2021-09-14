<%-- 
    Document   : recuperarsenha
    Created on : 11 de ago. de 2021, 14:02:59
    Author     : Ricardo.Schvambach e Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Script do SweetAlert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        
        <!-- Script de alerta -->
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>
        
        <!-- Link da página 'recuperarsenha' em css -->
        <link href="styles/recuperarsenha.css" rel="stylesheet">
        
        <!-- Fonte -->
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- Título -->
        <title>Break Fest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <!-- Alerta -->
    <body onload="javascript: alertar(resultado)" class="imagem">
    <!-- Fim da NavBar de cima -->
        
         <div>  
            <!-- Inicio do Form -->
            <form action="receberecuperarsenha.jsp" method="post">
                
                <!-- Recuperar senha -->
                <div class="container">
                    <div class="quadrado">
                    <h2 id="title">Recuperar senha</h2>
                    </div>
                    
                    <!-- E-mail -->
                    <div class="single-input">
                        <input type="text" class="input" id="nome" required>
                        <label for="nome">E-mail</label>
                    </div>
                    
                    <!-- Senha -->
                    <div class="single-input">
                        <input type="password" class="input" id="senha" required>
                        <label for="senha">Senha</label>
                    </div>
                    
                    <!-- Confirmar senha -->
                    <div class="single-input">
                        <input type="password" class="input" id="confirmsenha" required>
                        <label for="confirmsenha">Confirmar senha</label>
                    </div>
                    
                    <!-- Botão de senha -->
                    <div class="single-input">
                        <button type="submit">Salvar</button>
                    </div>
                </div>
            </form>
            <!-- Fim do form -->
        </div>
    </body>
</html>
