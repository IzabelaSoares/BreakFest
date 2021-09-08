<%-- 
    Document   : produtospadariacomprar
    Created on : 04/09/2021, 09:18:51
    Author     : Izabela
--%>
<%@page import="java.util.List"%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.PessoaFisica"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Título -->
        <meta charset="UTF-8">
        <title>Padarias</title>
       
        <!-- Navbar Usuário -->
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>
        
        <!-- Script da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- CSS, JS e BootStrap do cartão de crédito -->
        <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <link rel="stylesheet" href="styles/cartaoestilo.css">
        <script src="scripts/cartao-de-credito.js"></script>
        
        <!-- Link do Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        
        <!-- Script do Jquery, Cloud Flare e Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        
        <!-- Link da página "uprodutos-padaria-comprar" em css -->
        <link rel="stylesheet" href="styles/produtos-padaria-comprar.css">
    </head>
    <!-- Inicio da NavBar de cima nessa página terá o painel com as opções de cadastro, pedidos e pagamentos. -->
    <!-- Alerta -->

    <header id="navbar" onload="javascript: alertar(resultado)">
        <a href="index.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <li><a href="#" data-toggle="modal" data-target="#cart">Carrinho</a></li>
                <div class="drop-down">
                    <div id="dropDown" class="drop-down__button">
                        <a>Meu Painel</a>
                    </div>

                    <!-- Painel da navbar com as opção de cadastro, pedidos e pagamentos. -->
                    <div class="drop-down__menu-box">
                        <ul class="drop-down__menu">
                            <a><li data-name="profile" class="drop-down__item">Cadastro</li></a>
                            <a><li data-name="dashboard" class="drop-down__item">Pedidos</li></a>
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
        //Instanciar a Pessoa Juridica para Consultar os produtos dela
        String cnpj = request.getParameter("padaria");
        
        //Instanciar a Produto
        Produto novo = new Produto();
        List<Produto> produto = novo.consultarProdutosPadaria(cnpj);
        
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
    <body>
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
                                <!-- Form do recebe cartão -->
                                <form action="recebecartao.jsp" method="post">
                                    <div class="field-container">
                                        <label for="name">Nome Impresso no Cartão</label>
                                        <input id="name" minlength="5" maxlength="20" type="text" required>
                                    </div>

                                    <div class="field-container">
                                        <label for="cardnumber">Número do Cartão</label><span id="generatecard">generate random</span>
                                        <input id="cardnumber" type="text"  maxlength="19"  inputmode="numeric" required>
                                        <svg id="ccicon" class="ccicon" width="750" height="471" viewBox="0 0 750 471" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                             xmlns:xlink="http://www.w3.org/1999/xlink">
                                        </svg>         
                                    </div>     
                                    <div class="field-container">
                                        <label for="expirationdate">Expiração (mm/yy)</label>
                                        <input id="expirationdate" type="text"  minlength="5" inputmode="" required>
                                    </div>
                                    <div class="field-container">
                                        <label for="securitycode">Código de Segurança</label>
                                        <input id="securitycode" type="text"  minlength="3"  inputmode="numeric" required>
                                    </div>
                                    <button type="submit" class="button">Salvar</button>
                                </form>
                            </div>
                            <!-- partial -->
                            <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script><script src="./script.js"></script>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
        <!-- NAVBAR ANTIGO (SOMENTE RICARDO COM PERMISSÃO PARA APAGAR)
        <nav class="navbar navbar-inverse bg-inverse fixed-top bg-faded">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cart">Cart (<span class="total-count"></span>)</button>
                    <button class="clear-cart btn btn-danger">Clear Cart</button>
                </div>
            </div>
        </nav>
        <!-- Fim Nav -->
        
        <!-- Container de Produto -->
        <div class="container">
            <div class="row">
                
                <!-- Inicio Tabela -->
                <table>
                    <tbody>
                        <tr>
                            
                            <!-- Inicio Lista de Produtos -->
                            <% for (Produto n : produto) { %>
                            <td>
                                
                                <!-- Inicio Produto Individual-->
                                <div class="col">
                                    <div class="card" style="width: 20rem;">
                                        <img class="card-img-top" alt="<% out.write(n.getTitulo()); %>"
                                             src="<% out.write(n.getImagem()); %>">
                                        <div class="card-block">
                                            <h4 class="card-title"><% out.write(n.getTitulo()); %></h4>
                                            <p class="card-text" style="height: 130px;">
                                                <% out.write(n.getDescricao()); %>
                                            </p>
                                            <p class="card-text">R$ <% out.write(String.valueOf(n.getPreco())); %></p>
                                            <a href="#" class="add-to-cart btn btn-primary"
                                               data-name="<% out.write(n.getTitulo()); %>" 
                                               data-price="<% out.write(String.valueOf(n.getPreco())); %>" >
                                                Adicionar ao Carrinho</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Fim Produto Individual -->
                            </td>
                        </tr>
                        <%}%>
                        <!-- Fim Lista de Produtos -->
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Fim Container de Produto -->
        
        <!-- Inicio Modal de Compra -->
        <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Carinho de Compras</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="recebepedido.jsp" method="post">
                    <div class="modal-body">
                        <table class="table">
                        <thead>
                            <tr>
                                <th>Produto</th>
                                <th>Preço Unitário</th>
                                <th>Quantidade</th>
                                <th>Preço Total</th>
                            </tr>
                        </thead>
                        <tbody class="show-cart"></tbody>
                        </table>
                        <div>Total da Compra R$<span class="total-cart"></span></div>
                    </div>
                    <div class="modal-footer">
                        
                        <!-- Inputs hidden para passar os dados para o jsp -->
                        <input type="hidden" id="fkcnpj" name="fkcnpj" value="<% out.write(cnpj); %>">
                        <input type="hidden" id="fkcpf" name="fkcpf" value="<% out.write(cpf); %>">                       
                        <input type="hidden" id="produtos" name="produtos" value="">
                        <input type="hidden" id="preco-unitario" name="preco-unitario" value="">
                        <input type="hidden" id="quantidade" name="quantidade" value="">
                        <input type="hidden" id="preco-total" name="preco-total" value="">
                        <input type="hidden" id="total-compra" name="total-compra" value="">                      
                        
                        <!-- Fim Inputs hidden para passar os dados para o jsp -->
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="submit" class="btn btn-primary">Comprar agora</button>
                       
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Fim Modal de Compra -->
       
        <!-- JS Comprar produtos -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script  src="scripts/produtos-padaria-comprar.js"></script>
        
        <!-- JS Menu -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='https://unpkg.com/popper.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
    </body>
</html>
