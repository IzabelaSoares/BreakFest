<%-- 
    Documento       : recuperarsenha
    Desenvolvido por: Yan Claus Fructuoso e Ricardo Natal
    Documentado por : Jefferson Teixeira
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
       
        <!-- Fonte -->
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- Título -->
        <title>Break Fest</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <!-- Script do Alerta -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        <script src="scripts/alertas-erro.js"></script>
        
        <!-- CSS E JS principais-->
        <link href="styles/recuperar-senha.css" rel="stylesheet">
        <script src="scripts/recuperar-senha.js"></script>
    </head>
    <!-- Alerta -->
    <body onload="javascript: alertar(resultado)" class="imagem">
    <!-- Fim da NavBar de cima -->       
         <div>  
            <!-- Inicio do Form -->
            <form name="theForm" action="receberecuperarsenha.jsp" method="post">                
                <!-- Recuperar senha -->
                <div class="container">
                    <div class="quadrado">
                    <h2 id="title">Nova senha</h2>
                    </div>                    
                    <!-- E-mail -->
                    <div class="single-input">
                        <input type="text" placeholder="E-mail" class="input" id="nome" name='email' required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>                       
                    </div>                   
                    <!-- Senha -->
                    <div class="single-input">
                        <input type="password" placeholder="Senha" class="input" name="senhanova" id="senha" minlength="8" required>                       
                    </div>
                    <!-- Confirmar senha -->
                    <div class="single-input">
                        <input type="password" placeholder="Confirmar senha" class="input" id="checksenha" name="confirmsenha" minlength="8" required>                    
                    </div>
                    <p id="alertPassword"></p>
                    <!-- Botão de senha -->
                    <div class="single-input">
                        <button onclick="recuperarSenha();">Salvar</button>
                    </div>
                </div>
            </form>
            <!-- Fim do form -->
        </div>
    </body>
</html>
