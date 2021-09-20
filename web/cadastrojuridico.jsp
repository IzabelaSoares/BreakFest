<%-- 
    Documento       : cadastrojuridico
    Desenvolvido por: Izabela Maria Soares e Ricardo Natal
    Documentado por : Jefferson Teixeira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- Link de escolhas de bairro -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="styles/bairros.css">   
        
        <!-- Script pessoa juridica -->
        <script src="scripts/pessoa-juridica.js"></script>
        
        <!-- Script do SweetAlert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        
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
                <form class="form-detail" action="recebeclientejuridico.jsp" method="post" id="myform">
                   
                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>
                        
                        <!-- Input da razão social -->
                        <div class="form-row form-row-1">
                            <input type="text" maxlength="80" name="razaosocial" id="razaosocial" class="input-text" placeholder="Razão Social" required>
                        </div>
                        
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        
                        <!-- Input do nome da padaria -->
                        <div class="form-row">
                            <input type="text" maxlength="80" name="nomefantasia" id="nomefantasia" placeholder="Nome da padaria"required>
                        </div>
                        
                        <!-- Dois inputs seguidos "CNPJ e Telefone" -->
                        <div class="form-group">
                            
                            <!-- Input do CNPJ -->
                            <div class="form-row form-row-3">
                                <input type="text" name="cnpj" id="cnpj" placeholder="CNPJ" required maxlength="18" >
                            </div>
                            
                            <!-- Input do telefone -->
                            <div class="form-row form-row-2">
                                <input type="text" name="telefone" id="telefone" placeholder="Telefone" maxlength="15">
                            </div>
                        </div>

                        <!-- Input do "sobre" da padaria -->
                        <div class="form-row">
                            <textarea type="text" maxlength="120" name="sobre" id="sobre" placeholder="   Sobre a padaria..." maxlength="500"></textarea>
                        </div>
                        
                        <!-- Input da senha -->
                        <div class="form-row">
                            <input type="password" name="senha" id="senha" placeholder="Senha" >
                        </div>
                        <div class="form-row">
                            <input type="password" name="checksenha" id="checksenha" placeholder="Confirmar senha" >
                            <p id="alertPassword"></p><br>

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
                        
                        <!-- Input dos bairros que ela deseja atender -->
                        <div class="form-row">
                            <div class="combo js-csv">
                                <div role="combobox" aria-haspopup="listbox" aria-expanded="false" aria-owns="listbox1" class="input-wrapper">
                                    <input
                                        placeholder="Selecione os bairros de interesse em fornecer"
                                        aria-activedescendant=""
                                        aria-autocomplete="list"
                                        id="combo1"
                                        name="bairros"
                                        class="combo-input"
                                        type="text">
                                </div>
                                <div class="combo-menu" role="listbox" aria-multiselectable="true" id="listbox1"></div>
                            </div>
                        </div>
                        
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            <input type="submit" name="cadastrar" class="register" value="Cadastrar">
                        </div>
                    </div>
                </form>
            </div>
        </div>       
        <!-- Script do Bairro -->
        <script  src="scripts/bairros.js"></script> 
    </body>
</html>
