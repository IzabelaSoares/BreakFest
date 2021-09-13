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

        <!-- Título e imports -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Break Fest</title>

        <!-- Script da pessoa física -->
        <script src="scripts/pessoa-fisica.js"></script>

        <!-- Script do cadastro -->
        <link href="styles/cadastro.css" rel="stylesheet">

        <!-- Link da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">

        <!-- Script de alerta de erro -->
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
           
        <!-- CSS, JS e BootStrap do cartão de crédito -->
        <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <link rel="stylesheet" href="styles/cartaoestilo.css">
        <script src="scripts/cartao-de-credito.js"></script>

    </head>

    <!-- Fim dos Scripts, Bootstrap e etc... -->

    <!-- Inicio da NavBar de cima nessa página terá o painel com as opções de cadastro, pedidos e pagamentos. -->
    <!-- Alerta -->
    <header id="navbar" onload="javascript: alertar(resultado)">
        <a href="index_1.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
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
                            <a href="alterarusuariofisico.jsp"><li data-name="profile" class="drop-down__item">Cadastro</li></a>
                            <a href="consultarpedidofisico.jsp"><li data-name="dashboard" class="drop-down__item">Pedidos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
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

    <!-- Início -->
    <!-- modal de pagamento -->
    <div class="modal fade" id="modalPagamento" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
          <div class="centrocartao">
        <!-- partial:index.partial.html -->
        <div class="payment-title">
            <p>Informe os Dados do Cartão</p>
        </div>
        <div class="container preload">
            <div class="creditcard">
                <div class="front">
                    <div id="ccsingle"></div>
                    <svg version="1.1" id="cardfront" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                         x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                    <g id="Front">
                    <g id="CardBackground">
                    <g id="Page-1_1_">
                    <g id="amex_1_">
                    <path id="Rectangle-1_1_" class="lightcolor grey" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                          C0,17.9,17.9,0,40,0z" />
                    </g>
                    </g>
                    <path class="darkcolor greydark" d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z" />
                    </g>
                    <text transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber" class="st2 st3 st4">0123 4567 8910 1112</text>
                    <text transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname" class="st2 st5 st6">CUPPA BREAKFEST</text>
                    <text transform="matrix(1 0 0 1 54.1074 389.8793)" class="st7 st5 st8">Nome</text>
                    <text transform="matrix(1 0 0 1 479.7754 388.8793)" class="st7 st5 st8">Expiração</text>
                    <text transform="matrix(1 0 0 1 65.1054 241.5)" class="st7 st5 st8">Numero do Cartão</text>
                    <g>
                    <text transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire" class="st2 st5 st9">01/23</text>
                    <text transform="matrix(1 0 0 1 479.3848 417.0097)" class="st2 st10 st11">VALIDO</text>
                    <text transform="matrix(1 0 0 1 479.3848 435.6762)" class="st2 st10 st11">ATÉ</text>
                    <polygon class="st2" points="554.5,421 540.4,414.2 540.4,427.9 		" />
                    </g>
                    <g id="cchip">
                    <g>
                    <path class="st2" d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                          c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z" />
                    </g>
                    <g>
                    <g>
                    <rect x="82" y="70" class="st12" width="1.5" height="60" />
                    </g>
                    <g>
                    <rect x="167.4" y="70" class="st12" width="1.5" height="60" />
                    </g>
                    <g>
                    <path class="st12" d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                          c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                          C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                          c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                          c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z" />
                    </g>
                    <g>
                    <rect x="82.8" y="82.1" class="st12" width="25.8" height="1.5" />
                    </g>
                    <g>
                    <rect x="82.8" y="117.9" class="st12" width="26.1" height="1.5" />
                    </g>
                    <g>
                    <rect x="142.4" y="82.1" class="st12" width="25.8" height="1.5" />
                    </g>
                    <g>
                    <rect x="142" y="117.9" class="st12" width="26.2" height="1.5" />
                    </g>
                    </g>
                    </g>
                    </g>
                    <g id="Back">
                    </g>
                    </svg>
                </div>
                <div class="back">
                    <svg version="1.1" id="cardback" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                         x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                    <g id="Front">
                    <line class="st0" x1="35.3" y1="10.4" x2="36.7" y2="11" />
                    </g>
                    <g id="Back">
                    <g id="Page-1_2_">
                    <g id="amex_2_">
                    <path id="Rectangle-1_2_" class="darkcolor greydark" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                          C0,17.9,17.9,0,40,0z" />
                    </g>
                    </g>
                    <rect y="61.6" class="st2" width="750" height="78" />
                    <g>
                    <path class="st3" d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5
                          C707.1,246.4,704.4,249.1,701.1,249.1z" />
                    <rect x="42.9" y="198.6" class="st4" width="664.1" height="10.5" />
                    <rect x="42.9" y="224.5" class="st4" width="664.1" height="10.5" />
                    <path class="st5" d="M701.1,184.6H618h-8h-10v64.5h10h8h83.1c3.3,0,6-2.7,6-6v-52.5C707.1,187.3,704.4,184.6,701.1,184.6z" />
                    </g>
                    <text transform="matrix(1 0 0 1 621.999 227.2734)" id="svgsecurity" class="st6 st7">985</text>
                    <g class="st8">
                    <text transform="matrix(1 0 0 1 518.083 280.0879)" class="st9 st6 st10">CVV</text>
                    </g>
                    <rect x="58.1" y="378.6" class="st11" width="375.5" height="13.5" />
                    <rect x="58.1" y="405.6" class="st11" width="421.7" height="13.5" />
                    <text transform="" id="svgnameback" class="st12 st13">Cuppa BreakFest</text>
                    </g>
                    </svg>
                </div>
            </div>
        </div>
        <div class="form-container">
            <form action="recebecartao.jsp" method="post">
            <div class="field-container"> <br> <br> 
                <label for="name">Nome Impresso no Cartão</label>
                <input id="name" name="cardname" minlength="5" maxlength="20" type="text" required>
            </div>

            <div class="field-container">
                <label for="cardnumber">Número do Cartão</label><span id="generatecard">generate random</span>
                <input id="cardnumber" name="cardnumber" type="text"  maxlength="19"  inputmode="numeric" required>
                <svg id="ccicon" class="ccicon" width="750" height="471" viewBox="0 0 750 471" version="1.1" xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink">
                </svg>         
            </div>     
            <div class="field-container">
                <label for="expirationdate">Expiração (mm/yy)</label>
                <input id="expirationdate" name="expirationdate" type="text"  minlength="5" inputmode="" required>
            </div>
            <div class="field-container">
                <label for="securitycode">Código de Segurança</label>
                <input id="securitycode" name="securitycode" type="text"  minlength="3"  inputmode="numeric" required>
            </div>
            <button type="submit" class="button">Salvar</button>
            </form>
        </div>
        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script>
    </div>
  </div>
</div>
  </div>
    </div>
    <body class="form-v10">
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="recebealterarusuariofisico.jsp" method="post" id="myform">

                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>

                        <!-- Dois inputs seguidos "Nome e Sobrenome"-->
                        <div class="form-group">

                            <!-- Input do nome -->
                            <div class="form-row form-row-1">
                                <input type="text" maxlength="49" name="nome" id="nome" value="<% out.write(String.valueOf(consulta.getNome())); %>" 
                                       class="input-text" placeholder="Nome" required>
                            </div>

                            <!-- Input do sobrenome -->
                            <div class="form-row form-row-2">
                                <input type="text" maxlength="49" name="sobrenome" id="sobrenome" value="<% out.write(String.valueOf(consulta.getSobrenome())); %>"
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
                                       placeholder="CPF" required maxlength="14" readonly>
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
                            <input type="text" maxlength="10" name="cep" id="cep" placeholder="CEP" value="<% out.write(String.valueOf(consulta.getCep())); %>"
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
                                <input type="text" maxlength="5" name="numero" id="numero" value="<% out.write(String.valueOf(consulta.getNumero())); %>"
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
                            <input type="text" maxlength="80" name="complemento" id="complemento" placeholder="Complemento (opcional)"
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
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='https://unpkg.com/popper.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
    </body>
</html>