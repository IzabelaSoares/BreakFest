<%-- 
    Document   : consultarpedidojuridico
    Created on : 8 de set. de 2021, 16:08:19
    Author     : Izabela Maria Soares
--%>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
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

            //Formatação para data
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

        %>
    </head>
    <!-- modal de pagamento -->
    
    
    <!-- Modal para ver dados do pedido especifico -->
    <%   String fkId = request.getParameter("custId");
        Integer valor = Integer.valueOf(fkId);

        //produtos pedido
        Pedido dados = new Pedido();
        List<Pedido> individual = dados.consultarPedidoIndividual(fkId);

    %>
    <div class="modal fade" id="modalPedido" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
                    <br>
                    <div class="w-auto p-3">
                        <!-- Inicio do Card dos Detalhes do Pedido -->	
                        <div  class="fade show active " id="order" aria-labelledby="nav-home-tab">	
                            <div class="row">
                                <div class="col-md-auto">
                                    <div class="card w-100">
                                        <!-- Cabeçalho do Card-->
                                        <% for (Pedido i : individual) {%>
                                        <div class="card-header">
                                            <div class="d-inline h4">Detalhes do Pedido #<%out.write(fkId); %></div>

                                        </div>
                                        <!-- Dados Principais -->	
                                        <div class="card-body">
                                            <dl class="row">
                                                <dd class="col-sm-4">Cliente </dd>
                                                <dt class="col-sm-8"><% out.write(i.getNome() + " " + i.getSobrenome()); %></dt>
                                            </dl>
                                            <dl class="row">
                                                <dd class="col-sm-4">Total Produtos</dd>
                                                <dt class="col-sm-8">R$ <% out.write(String.valueOf(i.getTotalCompra()).replace(".", ",") + "0"); %></dt>
                                                <dd class="col-sm-4">Frete </dd>								
                                                <dt class="col-sm-8">R$ 0,00</dt>
                                                <dd class="col-sm-4">Valor Total </dd>
                                                <dt class="col-sm-8">R$ <% out.write(String.valueOf(i.getTotalCompra()).replace(".", ",") + "0"); %></dt>
                                            </dl>
                                            <dl class="row">
                                                <dd class="col-sm-4">Data de Emissão</dd>
                                                <dt class="col-sm-8"><%out.write(String.valueOf(formato.format(i.getDataPedido())));%></dt>
                                                <dd class="col-sm-4">Status</dd>
                                                <dt class="col-sm-8"><% out.write(String.valueOf(i.getStatus())); %></dt>
                                            </dl>
                                            <dl class="row">
                                                <dd class="col-sm-4">Endereço de Entrega</dd>
                                                <dt class="col-sm-8">
                                                    <% out.write(i.getCep() + ", " + i.getCidade() + "-" + i.getEstado());%><br>
                                                    <% out.write(i.getRua() + ", numero " + String.valueOf(i.getNumero())); %>
                                                </dt>
                                                <dd class="col-sm-4">Complemento</dd>
                                                <dt class="col-sm-8"><% out.write(i.getComplemento()); %><br>
                                                </dt>
                                            </dl>
                                            <% break;
                                                }%>
                                            <!-- Tabela com os Produtos -->	
                                            <table class="table">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th scope="col">Produto</th>
                                                        <th scope="col">Quantidade</th>
                                                        <th scope="col">Preço Unitário</th>
                                                        <th scope="col">Preço Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% for (Pedido i : individual) {%>
                                                    <tr>
                                                        <th scope="row"><% out.write(i.getProduto()); %></th>
                                                        <td><% out.write(String.valueOf(i.getQuantidade())); %> un</td>
                                                        <td>R$ <% out.write(String.format("%.2f", i.getPrecoUn()).replace(".", ",")); %></td>
                                                        <td>R$ <% out.write(String.format("%.2f", i.getPrecoTotal()).replace(".", ",")); %></td>
                                                    </tr>
                                                    <% }%>
                                                </tbody>
                                            </table>
                                            <!-- Observação -->	
                                            <dl class="row">
                                                <dt class="col-sm-12">Observação</dt>
                                                <dd class="col-sm-12">
                                                    Pedido sem observações
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <!-- Fim Card -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JS para passar parametros de consulta do pedido -->
    <script>
            window.onload = function () {
                $('#modalPedido').modal('show');
            };
            function acionar(parametro) {
                document.getElementById('custId').value = parametro
                document.theForm.submit();
            }
    </script>
    <!-- Modal Alterar Status do Pedido -->
    <div class="modal fade" id="modalEditarStatus" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="recebealterarstatus.jsp" method="post">
                        <h2>Mude o status do pedido aqui:</h2>
                        <div class="forSelect">
                            <select id="statusPedido" name="status">
                                <option value="Em Preparado">Em preparo</option>
                                <option value="Pedido à Caminho">A caminho</option>
                                <option value="Pedido Entregue">Entregue</option>
                                <option value="Pedido Cancelado">Cancelar Pedido</option>
                            </select>  
                        </div>
                        <% request.getSession().setAttribute("idped", fkId); %>
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
    <body class="tabela">
        <!-- Alerta -->
        <header id="navbar" onload="javascript: alertar(resultado)">
             <a href="index.html"><img src="imagens/Break Fest Animated Logo in.gif" alt="Cuppa"></a>
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
                    <tr>
                        <th scope="row" onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')"><%out.write(String.valueOf(p.getIdPedido()));%></th>
                        <td data-toggle="modal" data-target="#modalPedido"><%out.write(p.getNome());%></td>
                        <td data-toggle="modal" data-target="#modalPedido">R$ <%out.write(String.format("%.2f", p.getTotalCompra()).replace(".", ","));%></td>
                        <td data-toggle="modal" data-target="#modalPedido"><%out.write(String.valueOf(formato.format(p.getDataPedido())));%></td>
                        <td><%out.write(String.valueOf(p.getStatus()));%>
                            <button data-toggle="modal" data-target="#modalEditarStatus">Alterar</button>
                        </td>
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
        <!-- JS para Modal de Pedidos -->
        <script src='https://code.jquery.com/jquery-3.2.1.slim.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js'></script>
        <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js'></script>
    </body>
</html>
