<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.PessoaFisica"%>
<!-- Tela de alterar cadastro físico, criada por: Iza
Feito os inputs de endereço e informações necessárias posto no mesmo lugar, separadaos
por dois lado pelo fato de ser mais simples.

Página sem Navbar e sem footer de dúvidas pois é uma simples tela de cadastro.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- Script do jquery -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        
        <!-- Script da pessoa física -->
        <script src="scripts/pessoa-fisica.js"></script>
                
        <!-- Script do cadastro -->
        <link href="styles/cadastro.css" rel="stylesheet">
        
        <!-- Script de alerta -->
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>
        
        <!-- Script do SweetAlert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
                
        <!-- Link da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">
                
        <!-- Navbar Usuário -->
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>
        
        <!-- Título -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pessoa</title>
        
    </head>
    
    <!-- Fim dos Scripts, Bootstrap e etc... -->
    
    <!-- Inicio da NavBar de cima nessa página terá o painel com as opções de cadastro, pedidos e pagamentos. -->
    <!-- Alerta -->
    <header id="navbar" onload="javascript: alertar(resultado)">
        <a href="index.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                  <div class="drop-down">
                    <div id="dropDown" class="drop-down__button">
                      <a>Meu Painel</a>
                    </div>
                      
                    <!-- Painel da navbar com as opção de cadastro, pedidos e pagamentos. -->
                    <div class="drop-down__menu-box">
                        <ul class="drop-down__menu">
                        <a><li data-name="profile" class="drop-down__item">Cadastro</li></a>
                        <a><li data-name="dashboard" class="drop-down__item">Pedidos</li></a>
                        <a><li data-name="activity" class="drop-down__item">Pagamentos</li></a>
                      </ul>
                    </div>
                  </div>
                
                <!-- Essa opção será para sair da página, será levado para a página de login -->
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
    </header>
    
    <!-- Instanciamento de classes e método em Java  -->
    <%
        //formatação para data
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        //Instanciar a Pessoa Fisica
        PessoaFisica pf = new PessoaFisica();

        //Pegar o cpf dela
        String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
        String cpf = pf.procuraCpf(fkemail);

        //Instanciar uma nova pessoa fisica e consultar os dados através do cpf
        PessoaFisica consulta = new PessoaFisica();
        consulta = consulta.consultarConta(cpf);
    %>
    
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
                                <input type="text" name="nome" id="nome" value="<% out.write(String.valueOf(consulta.getNome())); %>" 
                                       class="input-text" placeholder="Nome" required>
                            </div>
                            
                            <!-- Input do sobrenome -->
                            <div class="form-row form-row-2">
                                <input type="text" name="sobrenome" id="sobrenome" value="<% out.write(String.valueOf(consulta.getSobrenome())); %>"
                                       class="input-text" placeholder="Sobrenome" required>
                            </div>
                        </div>
                        
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" value="<% out.write(String.valueOf(consulta.getEmail())); %>"
                                   class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        
                        <!-- Input da data de nascimento -->
                        <div class="form-row">
                            <input type="date" max="" name="nascimento" id="nascimento" value="<% out.write(formato.format(consulta.getDataNascimento())); %>"
                                   placeholder="Data de nascimento" required pattern="(?:((?:0[1-9]|1[0-9]|2[0-9])\/(?:0[1-9]|1[0-2])|(?:30)\/(?!02)(?:0[1-9]|1[0-2])|31\/(?:0[13578]|1[02]))\/(?:19|20)[0-9]{2})"></div>
                        
                        <!-- Dois inputs seguidos "CPF e Telefone" -->
                        <div class="form-group">
                            
                            <!-- Input do CPF -->
                            <div class="form-row form-row-3">
                                <input type="text" name="cpf" id="cpf" value="<% out.write(String.valueOf(consulta.getCpf())); %>"
                                       placeholder="CPF" required maxlength="14">
                            </div>
                            
                            <!-- Input do telefone -->
                            <div class="form-row form-row-2">
                                <input type="text" name="telefone" id="telefone" value="<% out.write(String.valueOf(consulta.getCelular())); %>"
                                       placeholder="Telefone" maxlength="15">
                            </div>
                        </div>
                        
                        <!-- Input da senha -->
                        <div class="form-row">
                            <input type="password" name="senha" id="senha" placeholder="Informe sua senha ou Informe uma nova senha" minlength="8">
                        </div>
                        
                        <!-- Confirmação de senha -->
                        <div class="form-row">
                            <input type="password" name="checksenha" id="checksenha" placeholder="Confirmar senha atual ou confirmar senha nova" minlength="8">
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
                            <input type="text" name="cep" id="cep" placeholder="CEP" value="<% out.write(String.valueOf(consulta.getCep())); %>"
                                   onblur="pesquisacep(this.value);" required maxlength="15">
                        </div>
                        
                        <!-- Form group para o estado e da cidade ficarem um ao lado do outro -->
                        <div class="form-group">
                            
                            <!-- Input do estado  -->
                            <div class="form-row form-row-1">
                                <input type="text" name="estado" id="estado" value="<% out.write(String.valueOf(consulta.getEstado())); %>"
                                       placeholder="Estado" required readonly>
                            </div>
                            
                            <!-- Input da cidade -->
                            <div class="form-row form-row-2">
                                <input type="text" name="cidade" id="cidade" value="<% out.write(String.valueOf(consulta.getCidade())); %>"
                                       placeholder="Cidade" required readonly>
                            </div>
                        </div>
                        
                        <!-- Input do bairro  -->
                        <div class="form-row form-row-2">
                            <input type="text" name="bairro" id="bairro" value="<% out.write(String.valueOf(consulta.getBairro())); %>"
                                   placeholder="Bairro" required readonly>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        
                        <!-- Form group para o número da casa e a rua ficarem um ao lado do outro -->
                        <div class="form-group">
                          
                            <!-- Input do número da casa -->
                            <div class="form-row form-row-1">
                                <input type="text" name="numero" id="numero" value="<% out.write(String.valueOf(consulta.getNumero())); %>"
                                       placeholder="Nr." required>
                            </div>
                            
                            <!-- Input da rua -->
                            <div class="form-row form-row-2">
                                <input type="text" name="rua" id="rua" value="<% out.write(String.valueOf(consulta.getRua())); %>"
                                       placeholder="Rua" required readonly>
                            </div>
                        </div>
                        
                        <!-- Input do complemento -->
                        <div class="form-row">
                            <input type="text" name="complemento" id="complemento" placeholder="Complemento (opcional)"
                                   value="<%out.write(String.valueOf(consulta.getComplemento()));%>">
                        </div>
                        
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="alterar" class="register" value="Salvar Alterações">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cancelar" class="register" value="Cancelar Alterações">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>