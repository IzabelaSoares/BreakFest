<%-- 
    Document   : consultarpedidojuridico
    Created on : 8 de set. de 2021, 16:08:19
    Author     : Ricardo Natal Schvambach
--%>

<%@page import="dominio.BairrosFrete"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.PessoaFisica"%>
<%@page import="java.util.List"%>
<%@page import="dominio.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <!-- Título e Favicon -->
        <title>Break Fest</title>
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <!-- Navbar Usuário -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>

        <!-- CSS para utilização alheia -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
        <link href="styles/consultar-pedidos.css" rel="stylesheet">
        <link href="styles/util.css" rel="stylesheet">

        <!-- Título e imports -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

        <!-- CSS, JS e BootStrap do cartão de crédito -->
        <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <!-- Link da página "midias" em css -->
        <link rel="stylesheet" href="styles/midias.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <!--        <link rel="stylesheet" href="styles/cartaoestilo.css">-->
        <script src="scripts/cartao-de-credito.js"></script>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>


        <!-- Instanciando classe para consulta para tabela -->
        <%
            //Instanciar a Pessoa Juridica
            PessoaJuridica pj = new PessoaJuridica();

            //Pegar o cpf dela
            String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
            String cnpj = pj.procuraCnpj(fkemail);

            //Pesquisar pedidos para pessoa juridica
            Pedido pedido = new Pedido();
            List<Pedido> pedidos = pedido.consultarPedidosUsuarioJuridico(cnpj);

            BairrosFrete bairro = new BairrosFrete();
            List<BairrosFrete> bairros = bairro.consultarBairros(cnpj);

            //Formatação para data
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

        %>
    </head>
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
                                <div class="field-container">
                                    <br>
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
                        <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script><script src="./script.js"></script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JS para passar parametros de consulta do pedido -->
    <script>
            function acionar(parametro) {
                document.getElementById('custId').value = parametro;
                document.theForm.submit();
            }
    </script>
    <!-- Modal Alterar Status do Pedido -->
    <div class="modal fade" id="modalEditarStatus" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="alterarstatuspedido.jsp" method="post">
                        <h2>Mude o status do pedido aqui:</h2>
                        <div class="forSelect">
                            <select>
                                <option value="NA" selected disabled hidden>Selecione aqui</option>
                                <option value="Em Preparado">Em preparo</option>
                                <option value="Pedido à Caminho">A caminho</option>
                                <option value="Pedido Entregue">Entregue</option>
                                <option value="Pedido Cancelado">Cancelar Pedido</option>
                            </select>  
                        </div>
                        <br>
                        <button class="enviarStatus" type="submit">Enviar</button>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </div>


    <!-- modal de midias --> 
    <div class="modal fade" id="modalMidias" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <section class="container max-w-xl mx-auto flex flex-col py-8">
                        <h1 class="text-xl font-black">Informações Adicionais</h1>

                        <!-- Form com as informações -->
                        <form action="RecebeImagemPerfil" method="post" enctype="multipart/form-data" class="form-midias">
                            <label for="instagram">Link para o Instagram</label>
                            <br>
                            <input type="text" name="instagram" placeholder="Instagram">
                            <br><br>
                            <label for="facebook">Link para o Facebook</label>
                            <br>
                            <input type="text" name="facebook" placeholder="Facebook" height="300px">
                            <br><br><hr>
                            <label>Foto da padaria</label>
                            <br>
                            <div id="center">
                                <div x-data="imageData()" class="file-input flex items-center">

                                    <!--          //////////                      Preview da Imagem                      ////////                -->
                                    <div class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">

                                        <!-- Placeholder da Imagem -->
                                        <div class="flex items-center">

                                            <!-- Input de foto -->
                                            <div class="ml-5 rounded-md shadow-sm">
                                                <input @change="updatePreview($refs)" x-ref="input"
                                                        type="file" maxlength="50px" 
                                                        accept="image/*,capture=camera" 
                                                        name="photo" id="photo" 
                                                        class="custom">
                                                <label for="photo" style="position: relative; right: 48px; border-left: none; border-bottom: 2px solid #995a1a; border-top: none; border-right: none; padding-left: 8px; padding-right: 8px;">
                                                    Adicionar
                                                </label>
                                            </div>
                                            <div class="flex items-center text-sm text-gray-500 mx-2">
                                                <span x-text="fileName || emptyText"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <!-- Botão de enviar -->
                                <div class="botaoLegal">
                                    <input type="submit" value="Enviar"/>
                                </div>
                            </div>
                        </form>
                    </section>

                    <!-- Scripts do Cloud Flare e Mídias -->
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.6.0/alpine.js'></script><script  src="scripts/midias.js"></script>
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script><script src="./script.js"></script>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalFrete" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="tudoCentral">
                        <h2> Gerenciador de fretes </h2>
                        <hr>
                        <div class="container table-responsive py-5"> 
                            <table class="table table-bordered table-hover">
                                <thead class="tabelinha">
                                    <tr>
                                        <th scope="col">Bairro</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">Alterar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>       
                                    <tr>
                                        <td>Vorstard</td>
                                        <td>R$12,50</td>
                                        <td><a style="color: blueviolet;" href="#">Alterar</a></td>
                                        <td><a style="color: red;" href="#">Excluir</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                            <form action="recebefrete.jsp" method="post">
                                <input type="hidden" value="<%%>">
                                <select>
                                    <option value="" selected disabled hidden>Selecione o bairro aqui</option>
                                    <option value="nada">Bairros futuros</option>
                                </select>
                                <br><br>
                                <div class="valor"><p>R$</p>
                                    <input type="number" placeholder="Informe o preço">
                                </div>
                                <br>
                                <button type="submit">Salvar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <body class="tabela">
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
                                    <a href="alterarusuariojuridico.jsp"><li class="drop-down__item">Cadastro</li></a>
                                    <a href="consultarpedidofisico.jsp"><li class="drop-down__item">Pedidos</li></a>
                                    <a href="#" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
                                    <a href="#" data-toggle="modal" data-target="#modalMidias"><li class="drop-down__item">Midias</li></a>
                                    <a href="consultarmeusprodutos.jsp"><li class="drop-down__item">Produtos</li></a> 
                                    <a href="#" data-toggle="modal" data-target="#modalFrete"><li class="drop-down__item">Frete</li></a>
                                </ul>
                            </div>
                        </div>
                        <!-- Essa opção será para sair da página, será levado para a página de login -->
                        <li><a href="login.jsp">Sair</a></li>
                    </ul>
                </nav>
            </header>
            <!-- partial:index.partial.html -->
            <div class="container table-responsive py-5"> 
                <table class="table table-bordered table-hover">
                    <thead class="tabelinha">
                        <tr>
                            <th scope="col">Pedido</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Preço Total</th>
                            <th scope="col">Data</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Pedido p : pedidos) {%>
                        <tr onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')">
                            <th scope="row"><%out.write(String.valueOf(p.getIdPedido()));%></th>
                            <td data-toggle="modal" data-target="#modalPedido"><%out.write(p.getNome());%></td>
                            <td data-toggle="modal" data-target="#modalPedido"><%out.write(String.valueOf(p.getTotalCompra()).replace(".", ",") + "0");%></td>
                            <td data-toggle="modal" data-target="#modalPedido"><%out.write(String.valueOf(formato.format(p.getDataPedido())));%></td>
                            <td><%out.write(String.valueOf(p.getStatus()));%><button data-toggle="modal" data-target="#modalEditarStatus">Alterar</button></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <form id="theForm" name="theForm" action="consultarpedidojuridico_1.jsp" method="post">
                    <input type="hidden" id="custId" name="custId" value="3487">
                </form>
            </div>
            <!-- JS para Menu -->
            <script src="scripts/bairros.js"></script>
            <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
            <script src='https://unpkg.com/popper.js'></script>
            <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
        </body>
</html>