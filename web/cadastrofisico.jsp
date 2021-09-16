<!-- Tela de cadastro físico, criada por: Ricardo
Feito os inputs de endereço e informações necessárias posto no mesmo lugar, separadaos
por dois lado pelo fato de ser mais simples.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                
        <!-- Script da pessoa física -->
        <script src="scripts/pessoa-fisica.js"></script>

        <!-- Script do SweetAlert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        
        <!-- Script do alerta -->
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- Link da página 'cadastro' em css -->
        <link href="styles/cadastro.css" rel="stylesheet">
        
        <!-- Link da página 'util' em css -->
        <link href="styles/util.css" rel="stylesheet">
        
        <!-- Título -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Break Fest</title>
        
    </head>
    <!-- Inicio da NavBar de cima -->
    <!-- Alerta -->
    <header id="navbar" onload="javascript: alertar(resultado)">
         <a href="index.html"><img src="imagens/Break Fest Animated Logo in.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            
            <!-- Painel padrão com as opções de Sobre nós, cadastro e login -->
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <!-- Fim da NavBar de cima -->
    
    <!-- Início da página -->
    <body class="form-v10">
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="recebeclientefisico.jsp" method="post" id="myform">
                   
                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>
                        
                        <!-- Dois inputs seguidos "Nome e Sobrenome"-->
                        <div class="form-group">
                            
                            <!-- Input do nome -->
                            <div class="form-row form-row-1">
                                <input type="text" maxlength="50" name="nome" id="nome" class="input-text" placeholder="Nome" required>
                            </div>
                            
                            <!-- Input do sobrenome -->
                            <div class="form-row form-row-2">
                                <input type="text" maxlength="50" name="sobrenome" id="sobrenome" class="input-text" placeholder="Sobrenome" required>
                            </div>
                        </div>
                        
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        
                        <!-- Input da data de nascimento -->
                        <div class="form-row">
                            <input type="date" name="nascimento" id="nascimento" placeholder="Data de nascimento" required pattern="(?:((?:0[1-9]|1[0-9]|2[0-9])\/(?:0[1-9]|1[0-2])|(?:30)\/(?!02)(?:0[1-9]|1[0-2])|31\/(?:0[13578]|1[02]))\/(?:19|20)[0-9]{2})"></div>
                        
                        <!-- Dois inputs seguidos "CPF e Telefone" -->
                        <div class="form-group">
                            
                            <!-- Input do CPF -->
                            <div class="form-row form-row-3">
                                <input type="text" name="cpf" id="cpf" placeholder="CPF" required maxlength="14">
                            </div>
                            
                            <!-- Input do telefone -->
                            <div class="form-row form-row-2">
                                <input type="text" name="telefone" id="telefone" placeholder="Telefone" maxlength="15">
                            </div>
                        </div>
                        
                        <!-- Input da senha -->
                        <div class="form-row">
                            <input type="password" name="senha" id="senha" placeholder="Senha" minlength="8">
                        </div>
                        
                        <!-- Confirmação de senha -->
                        <div class="form-row">
                            <input type="password" name="checksenha" id="checksenha" placeholder="Confirmar senha" minlength="8">
                            <p id="alertPassword"></p>
                        </div>
                    </div>
                    <!-- Fim do lado esquerdo do form -->
                    
                    <!-- Início do lado direito do form -->
                    <div class="form-right">
                        <h2>Endereço</h2>
                        <!-- Form group para o input do CEP não ficar gigante. -->

                        <!-- input do CEP -->
                        <div class="form-row form-row-3">
                            <input type="text" maxlength="10" name="cep" id="cep" placeholder="CEP" onblur="pesquisacep(this.value);" required maxlength="15">
                        </div>
                       
                        <!-- Form group para o estado e da cidade ficarem um ao lado do outro -->
                        <div class="form-group">
                           
                            <!-- Input do estado  -->
                            <div class="form-row form-row-1">
                                <input type="text" name="estado" id="estado" placeholder="Estado" required readonly>
                            </div>
                            
                            <!-- Input da cidade -->
                            <div class="form-row form-row-2">
                                <input type="text" name="cidade" id="cidade" placeholder="Cidade" required readonly>
                            </div>
                        </div>
                        
                        <!-- Input do bairro  -->
                        <div class="form-row form-row-2">
                            <input type="text" name="bairro" id="bairro" placeholder="Bairro" required readonly>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        
                        <!-- Form group para o número da casa e a rua ficarem um ao lado do outro -->
                        <div class="form-group">
                            
                            <!-- Input do número da casa -->
                            <div class="form-row form-row-1">
                                <input type="text" maxlength="5" name="numero" id="numero" placeholder="Nr." required>
                            </div>
                            
                            <!-- Input da rua -->
                            <div class="form-row form-row-2">
                                <input type="text" name="rua" id="rua" placeholder="Rua" required readonly>
                            </div>
                        </div>
                        
                        <!-- Input do complemento -->
                        <div class="form-row">
                            <input type="text" maxlength="80" name="complemento" id="complemento" placeholder="Complemento (opcional)">
                        </div>
                        
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            <input type="submit" name="cadastrar" class="register" value="Cadastrar">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>