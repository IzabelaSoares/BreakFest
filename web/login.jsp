<%-- 
    Documento       : login
    Desenvolvido por: Yan Claus Fructuoso e Ricardo Natal
    Documentado por : Jefferson Teixeira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Head igualitário para quase todas as telas -->

<head>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
    <!-- Script de alertas -->
    <script src="scripts/alertas-erro.js"></script>
    <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>
        
    <!-- Script de confirmação de login -->
    <script src="scripts/confirmacao-de-login.js"></script>
    
    <!-- Script do jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- Imagem do Cuppa -->
    <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
    
    <!-- Link do fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
   
    <!-- Link da página 'login' em css -->
    <link rel="stylesheet" href="styles/login.css">
    
    <!-- Link da página 'util' em css -->
    <link rel="stylesheet" href="styles/util.css">
    
    <!-- Email Recuperar Senha -->
    <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
    <script src="scripts/email-recuperar-senha.js"></script>
    
    <!-- Título -->
    <title>Break Fest</title> 

</head>

<!-- Início do modelo da foto -->
<body onload="javascript: alertar(resultado)">
    <div class="container h-100">
        <div class="d-flex justify-content-center h-100">
            <div class="user_card">
                <div class="d-flex justify-content-center">
                    
                    <!-- Div da foto -->
                    <div class="brand_logo_container">
                        <img src="imagens/CuppaLogin Background.gif" class="brand_logo" alt="Cuppa">
                    </div>
                </div>
                <div class="d-flex justify-content-center form_container">
                    <form action="recebelogin.jsp" method="post">
                        <div class="input-group mb-3">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <!-- Fim da modelagem da foto -->
                            
                            <!-- Início dos inputs dos dados para login -->
                            <!-- E-mail -->
                            <input type="text" name="email" class="form-control input_user" placeholder="E-mail">
                        </div>
                        
                        <!-- Senha -->
                        <div class="input-group mb-2">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" name="senha" class="form-control input_pass" placeholder="Senha">
                        </div>
                        
                        <!-- Parte do 'Lembre de mim' -->
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customControlInline">
                                <label class="custom-control-label" for="customControlInline">Lembre de mim</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="submit" name="button" onclick="confirmaLogin()" class="btn login_btn">Entrar</button>
                        </div>
                    </form>
                </div>
                <!-- Fim dos inputs dos dados -->
               
                <!-- Botões de redirecionamento-->
                <div class="mt-4">
                    
                    <!-- Parte para quem não possuí uma conta -->
                    <div class="d-flex justify-content-center links">
                        Não possui uma conta? <a href="tipopessoa.jsp" class="ml-2">Registrar-se</a>
                    </div>
                    
                    <!-- Parte de esqueceu a senha (para recuperar claro) -->
                    <div class="d-flex justify-content-center links">
                        Esqueceu sua senha? <a href="#" onclick="recuperarSenha()" class="ml-2">Recupere-a</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>