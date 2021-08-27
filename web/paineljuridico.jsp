<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Navbar Usuário -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>
        <!-- Imports de escolhas de bairro -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="styles/bairros.css">
        <!-- Título e imports -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Break Fest</title>
        <script src="scripts/pessoa-juridica.js"></script>
        <link href="styles/cadastro.css" rel="stylesheet">
        <link href="styles/util.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

    </head>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar" ">
        <a href="index.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                  <div class="drop-down">
                    <div id="dropDown" class="drop-down__button">
                      <a>Meu Painel</a>
                    </div>
                    <div class="drop-down__menu-box">
                      <ul class="drop-down__menu">
                        <a><li data-name="profile" class="drop-down__item">Meu Cadastro</li></a>
                        <a><li data-name="dashboard" class="drop-down__item">Meus Pedidos</li></a>
                        <a><li data-name="activity" class="drop-down__item">Meus Pagamentos</li></a>
                        <a><li data-name="activity" class="drop-down__item">Minhas Midias</li></a>
                        <a><li data-name="activity" class="drop-down__item">Meus Produtos</li></a>
                      </ul>
                    </div>
                  </div>
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
    </header>
    <div>
    </div>
    <!-- Fim da NavBar de cima -->
    <body class="form-v10" onload="javascript: alertar(resultado)>
        <%
                      String cnpj = request.getParameter("cnpj");
                        PessoaJuridica p = new PessoaJuridica();
                          p = p.consultarConta(cnpj);   
        %>
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="recebeclientejuridico.jsp" method="post" id="myform">
                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        <!-- Input do nome da padaria -->
                        <div class="form-row">
                            <input type="text" name="nomefantasia" id="nomefantasia" placeholder="Nome da padaria"required>
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
                            <textarea style="height:135px; width:443px; box-shadow:0 0 0 0; outline: 0;" type="text" name="sobre" id="sobre" placeholder="Sobre a padaria..."></textarea>
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
                            <input type="text" name="cep" id="cep" placeholder="CEP" onblur="pesquisacep(this.value);" required maxlength="15">
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
                                <input type="text" name="numero" id="numero" placeholder="Nr." required>
                            </div>
                            <!-- Input da rua -->
                            <div class="form-row form-row-2">
                                <input type="text" name="rua" id="rua" placeholder="Rua" required readonly>
                            </div>
                        </div>
                        <!-- Input do complemento -->
                        <div class="form-row">
                            <input type="text" name="complemento" id="complemento" placeholder="Complemento (opcional)">
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
                                        class="combo-input"
                                        type="text">
                                </div>
                                <div class="combo-menu" role="listbox" aria-multiselectable="true" id="listbox1"></div>
                            </div>
                        </div>
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cadastrar" class="register" value="Salvar alteração">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cadastrar" class="register" value="Cancelar alteração">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="scripts/bairros.js"></script>
    </body>
</html>
