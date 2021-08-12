<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Head igualitário para quase todas as telas -->

<head>
    <title>Break Fest</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/login.css">
    <link rel="stylesheet" href="styles/util.css">
</head>
<!-- Início do modelo da foto -->
<body>
    <div class="container h-100">
        <div class="d-flex justify-content-center h-100">
            <div class="user_card">
                <div class="d-flex justify-content-center">
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
                            <input type="text" name="email" class="form-control input_user" placeholder="E-mail">
                        </div>
                        <div class="input-group mb-2">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" name="senha" class="form-control input_pass" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="customControlInline">
                                <label class="custom-control-label" for="customControlInline">Lembre de mim</label>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center mt-3 login_container">
                            <button type="submit" name="button" class="btn login_btn">Entrar</button>
                            <span id="erro" style="color: transparent;">Deu bosta</span>
                        </div>
                    </form>
                </div>
                <!-- Fim dos inputs dos dados -->
                <!-- Botões de redirecionamento-->
                <div class="mt-4">
                    <div class="d-flex justify-content-center links">
                        Não possui uma conta? <a href="tipopessoa.jsp" class="ml-2">Registrar-se</a>
                    </div>
                    <div class="d-flex justify-content-center links">
                        Esqueceu sua senha? <a href="recuperarsenha.jsp" class="ml-2">Recupere-a</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>