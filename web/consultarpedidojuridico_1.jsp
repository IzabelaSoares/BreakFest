<%-- 
    Document   : consultarpedidojuridico
    Created on : 8 de set. de 2021, 16:08:19
    Author     : Izabela Maria Soares
--%>

<%@page import="dominio.BairrosFrete"%>
<%@page import="dominio.Deposito"%>
<%@page import="dominio.Pix"%>
<%@page import="dominio.Banco"%>
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

        <!-- Sweet Alert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

        <!-- CSS, JS e BootStrap de Preferencia de pagamento -->
        <link rel="stylesheet" href="styles/preferenciapagamento.css">
        <script src="scripts/preferencia-de-pagamento.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <script src="scripts/alterar-cadastrar-dados.js"></script>
        
        <!-- Midias -->
        <link rel="stylesheet" href="styles/midias.css">
        
        <!-- Search/Barra de Pesquisa -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'> 
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <script src="scripts/pedido-juridico.js"></script>
        <script src="https://kit-pro.fontawesome.com/releases/v5.10.1/js/pro.min.js" data-auto-fetch-svg></script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
        <%
            //Instanciar a Pessoa Juridica
            PessoaJuridica pj = new PessoaJuridica();

            //Pegar o cnpj dela
            String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
            String cnpj = pj.procuraCnpj(fkemail);

            //Pesquisar pedidos para pessoa juridica
            Pedido pedido = new Pedido();
            List<Pedido> pedidos = pedido.consultarPedidosUsuarioJuridico(cnpj);

            //Formatação para data
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            
            //Instanciar os Bairros e verificar o bairro
            BairrosFrete bairro = new BairrosFrete();
            List<String> bairros = bairro.consultarBairros(cnpj);

            List<BairrosFrete> bairrosfretes = bairro.consultarBairrosFretes(cnpj);
            

            //Dados das Midias
            PessoaJuridica midias = new PessoaJuridica();
            midias = midias.consultarConta(cnpj);

            //Consultar Midias
            String instagram = midias.getInstagram();
            String facebook = midias.getFacebook();
            String imagem = midias.getImagem();

            //verificar se as midias estão nulas
            if (instagram == null) {
                instagram = "";
            } else if (facebook == null) {
                facebook = "";
            }

        %>
    </head>  
    <%  //Dados do pedido individual
        String fkId = request.getParameter("custId");
        Integer valor = Integer.valueOf(fkId);

        //produtos pedido
        Pedido dados = new Pedido();
        List<Pedido> individual = dados.consultarPedidoIndividual(fkId);

    %>
    <!-- Modal de Pedido Individual -->
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
    <!-- Modal Alterar Status do Pedido -->
    <div class="modal fade" id="modalEditarStatus" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <form action="recebealterarstatus.jsp" method="post">
                        <h2>Mude o status do pedido aqui:</h2>
                        <div class="forSelect">
                            <select id="statusPedido" name="status">
                                <option value="Em Preparo">Em preparo</option>
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
 <!-- Modal de Midias -->
    <div class="modal fade" id="modalMidias" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body" style="padding: 50px">
                    <section class="container max-w-xl mx-auto flex flex-col py-8">
                        <h3 id="titulo-midias" style="text-align: center">Informações Adicionais</h3>

                        <!-- Form com as informações -->
                        <form action="RecebeImagemPerfil" method="post" enctype="multipart/form-data" class="form-midias">
                            <label for="instagram">Link para o Instagram</label>
                            <br>
                            <input type="text" value="<% out.write(instagram); %>" name="instagram" placeholder="Instagram">
                            <br><br>
                            <label for="facebook">Link para o Facebook</label>
                            <br>
                            <input type="text" value="<% out.write(facebook); %>" name="facebook" placeholder="Facebook" height="300px">
                            <br><br>
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
                                <!-- Botão de Submit -->
                                <div style="margin: 50px;">
                                    <button type="submit" style="width: 150px" class="btn botao" >Salvar Midias</button>
                                </div>
                            </div>
                        </form>
                    </section>
                    <!-- Scripts do Cloud Flare e Mídias -->
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.6.0/alpine.js'></script>
                    <script  src="scripts/midias.js"></script>
                </div>
            </div>
        </div>
    </div>
    <%  //Instanciar uma nova pessoa juridica e consultar os dados através do cnpj
        PessoaJuridica consulta = new PessoaJuridica();
        consulta = consulta.consultarConta(cnpj);

        //Instanciar pix e consultar os dados através do cnpj
        PessoaJuridica pix = new PessoaJuridica();
        pix = consulta.consultarDados(cnpj);

        //Instanciar banco para escolher o pagamento.
        Banco lista = new Banco();
        List<Banco> listabanco = lista.consultarGeral();

        //Instanciar depósito e pix
        Pix cadastroPix = new Pix();
        Deposito cadastroDeposito = new Deposito();

        //Verificar se a pessoa possui dados de pagamento
        Boolean verificarPix = cadastroPix.verificaDados(fkemail);
        Boolean verificarDeposito = cadastroDeposito.verificaDados(fkemail);

        //Inicializar variavel de dados
        String dados1 = "";

        //Verificar dados de Pix e Depósito
        if (!verificarPix && !verificarDeposito) {
            dados1 = " Sem dados de Pagamento";
        } else if (verificarPix) {
            dados1 = " Pagamento via Pix";
        } else if (verificarDeposito) {
            dados1 = " Pagamento via Depósito Bancário";
        }
    %>
    <div class="modal fade" id="modalPagamento" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body" style="padding: 50px">
                    <div id="dadospagamento">
                        <h3 id="dados-pagamento" style="text-align: center">Dados de Pagamento</h3>
                        <div class="input-group mb-3 justify-content-center">
                            <div class="input-group-prepend">
                                <span class="input-group-append bg-white">
                                    <button class="btn" style=" height: 50px; background-color: #e9ecef !important; border-radius: 5px 0px 0px 5px;" type="button">
                                        <i class="far fa-money-bill-alt fa-2x" style="color: #006400;"></i>
                                    </button>
                                </span>       
                            </div>
                            <input type="text" class="form-control col-sm-8 border-0" id="dadoscard" readonly style=" margin: 0; height: 50px; border-left: none; border-radius: 0px 5px 5px 0px; color:#006400;" 
                                   value="<%out.write(dados1); %>">

                            <input type="hidden" id="verificarNumero" value="<% out.write(dados1); %>">
                        </div><br>
                        <div style="position: relative; left: 50px">
                            <button id="btnAdicionar" style="display: none; background-color: #995a1a; border-color: #995a1a; width: 150px; height: 50px;" type="submit" class="btn btn-primary" onclick="preferenciaPagamento()">Adicionar Preferência</button>
                            <button id="btnAlterar" style="background-color: #995a1a; border-color: #995a1a; width: 150px; height: 50px;" type="submit" class="btn btn-primary" onclick="preferenciaPagamento()">Alterar Preferência</button>
                            <br><br>
                        </div>
                    </div>
                    <!-- Cadastro de Pagamento -->
                    <div id="divpagamento" style="display: none">
                        <h3 id="pagamento-titulo">Como deseja receber seu pagamento?</h3>
                        <div id="inputbonito">
                            <div class="pagamento">
                                <!-- Selecionando método de recebimento -->
                                <form action="recebepagamento.jsp" method="post" >
                                    <select id="pagamento" name="pagamento" onchange="formaPagamento()">
                                        <option value="NA" selected disabled>Selecione aqui a forma de pagamento</option>
                                        <option value="pix">Pix</option>
                                        <option value="deposito">Depósito Bancário</option>
                                    </select>
                                    <br><br>
                                    <!-- PIX -->
                                    <div id="pix-pagamento" style="display:none;">           
                                        <label for="pix_metodo">Escolha sua Chave Pix</label><br>
                                        <select name="fktipochave" id="pix_metodo" onchange="chavePix()">
                                            <option value="NA" selected disabled>Selecione a chave PIX aqui</option>
                                            <option value="cnpj">CNPJ</option>
                                            <option value="email">E-mail</option>
                                            <option value="telefone">Telefone</option>
                                        </select>
                                        <br>
                                        <!-- Input de CPNJ -->
                                        <div id="cnpj-pagamento" style="display:none; margin-top: 20px">
                                            <label for="chave-cnpj">Informe seu CNPJ</label>
                                            <input type="text" name="chave-cnpj" id="chave-cnpj" placeholder="XX.XXX.XXX/XXXX-XX"
                                                   value="<% out.print(String.valueOf(pix.getCnpj())); %>"><br>
                                            <!-- Input do dia de recebimento -->
                                            <label style="margin-top: 20px" for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                            <select name="dia" id="dia" required >
                                                <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                                <option value="05">Dia 05</option>
                                                <option value="10">Dia 10</option>
                                                <option value="25">Dia 25</option>
                                            </select>
                                            <!-- Botão de Submit -->
                                            <div style="margin: 50px;">
                                                <button type="submit" style="width: 150px" class="btn botao" >Salvar Preferência</button>
                                            </div>
                                        </div>
                                        <!-- Input do E-mail -->
                                        <div id="email-pagamento" style="display:none; margin-top: 20px;">
                                            <label for="chave-telefone">Informe seu E-mail</label>
                                            <input type="text" name="chave-email" id="chave-email" placeholder="exemplo@email.com" 
                                                   value="<% out.print(String.valueOf(pix.getEmail())); %>"><br>
                                            <!-- Input do dia de recebimento -->
                                            <label style="margin-top: 20px" for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                            <select name="dia" id="dia" required >
                                                <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                                <option value="05">Dia 05</option>
                                                <option value="10">Dia 10</option>
                                                <option value="25">Dia 25</option>
                                            </select>
                                            <!-- Botão de Submit -->
                                            <div style="margin: 50px;">
                                                <button type="submit" style="width: 150px" class="btn botao" >Salvar Preferência</button>
                                            </div>
                                        </div>
                                        <!-- Input do Telefone -->
                                        <div id="telefone-pagamento" style="display:none; margin-top: 20px">
                                            <label for="chave-telefone">Informe seu Telefone</label>
                                            <input type="text" name="chave-telefone" id="chave-telefone" placeholder="(XX)XXXXX-XXXX"  
                                                   value="<% out.print(String.valueOf(pix.getTelefone())); %>"><br>
                                            <!-- Input do dia de recebimento -->
                                            <label style="margin-top: 20px" for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                            <select name="dia" id="dia" required >
                                                <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                                <option value="05">Dia 05</option>
                                                <option value="10">Dia 10</option>
                                                <option value="25">Dia 25</option>
                                            </select>
                                            <!-- Botão de Submit -->
                                            <div style="margin: 50px;">
                                                <button type="submit" style="width: 150px" class="btn botao" >Salvar Preferência</button>
                                            </div>
                                        </div>
                                    </div>  
                                    <!-- Depósito Bancário -->
                                    <!-- Input do CNPJ -->
                                    <div id="deposito-pagamento" style="display:none">
                                        <label for="conta-cnpj">Informe o CNPJ</label>
                                        <input name="cnpj" type="text" id="conta-cnpj" placeholder="XX.XXX.XXX/XXXX-XX"> 
                                        <br><br>
                                        <!-- Input do banco -->
                                        <label>Banco</label> <br/>
                                        <select name="banco" id="bankaccount" required >
                                            <option value="NA" selected disabled hidden>Selecione aqui seu banco</option>
                                            <% for (Banco bancos : listabanco) { %>  
                                            <option value="<% out.write(String.valueOf(bancos.getNumero()));%>">
                                                <% out.write(String.valueOf(bancos.getNumero() + " | " + bancos.getBanco())); %>
                                            </option>
                                            <%}%> 
                                        </select>
                                        <br><br>
                                        <!-- Input do número da conta -->
                                        <label for="conta-bancaria">Conta Bancaria</label>
                                        <input name="conta" type="text" id="conta-bancaria" placeholder="Informe o número da conta"> 
                                        <br><br>
                                        <!-- Input do tipo da conta -->
                                        <label>Tipo da Conta</label> <br>
                                        <select name="tipo-conta" id="accounttype">
                                            <option value="NA" selected disabled hidden>Selecione aqui o tipo da conta</option>
                                            <option value="poupanca">Poupança</option>
                                            <option value="corrente">Corrente</option>
                                        </select> 
                                        <br><br>
                                        <!-- Input do número da agência -->
                                        <label for="agencia">Agência</label>
                                        <input name="agencia" type="text" id="agencia" placeholder="Informe a agência">
                                        <br><br>
                                        <!-- Input do dia de recebimento -->
                                        <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                        <select name="dia" id="dia" required >
                                            <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                            <option value="05">Dia 05</option>
                                            <option value="10">Dia 10</option>
                                            <option value="25">Dia 25</option>
                                        </select>
                                        <!-- Botão de Submit -->
                                        <div style="margin: 50px;">
                                            <button type="submit" style="width: 150px" class="btn botao" >Salvar Preferência</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal de Frete --> 
    <div class="modal fade" id="modalFrete" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="tudoCentral" style="margin-top: 30px;">
                        <h2 id="titulo-frete"> Gerenciador de fretes </h2>
                        <div class="container table-responsive py-5" style="margin-top: 0"> 
                            <table class="table table-bordered">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Bairro</th>
                                        <th scope="col">Valor</th>
                                        <th scope="col">Alterar</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>       
                                    <% for (BairrosFrete bf : bairrosfretes) {%>
                                    <tr>
                                        <td><%out.write(bf.getBairroAtendimento());%></td>
                                        <td><%out.write(String.valueOf(bf.getFrete()));%></td>
                                        <td><a style="color: #14a3db; cursor: pointer;" onclick="alterarFrete('<%out.write(bf.getBairroAtendimento());%>');">Alterar</a></td>
                                        <td><a style="color: red; cursor: pointer;" href="" onClick="document.getElementById('<%out.write(String.valueOf(bf.getId()));%>').submit();">Excluir</a></td>
                                <form action="recebedeletafrete.jsp" id="<%out.write(String.valueOf(bf.getId()));%>" >
                                    <input type="hidden" name="id" value="<%out.write(String.valueOf(bf.getId())); %>">
                                </form>
                                </tr>
                                <% }%>
                                </tbody>
                            </table>
                        </div>
                        <div id="divfrete" style="display:none">
                            <div class="d-flex justify-content-center">
                                <form action="recebefrete.jsp" method="post" >
                                    <input type="hidden" name="cnpj" value="<% out.write(cnpj); %>">
                                    <dl class="row">
                                        <dd class="col-sm-4">Bairro</dd>
                                        <dt class="col-sm-6">
                                            <input class="form-control" value="" id="bairros" name="bairros" type="text" readonly>
                                        </dt>
                                    </dl>
                                    <dl class="row">
                                        <dd class="col-sm-4">Preço</dd>
                                        <dt class="col-sm-6">
                                            <input class="form-control" min="0" max="20" name="frete" type="number" required placeholder="Informe o preço">
                                        </dt>
                                    </dl>
                                    <button type="submit">Salvar</button><br><br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Corpo da Página -->  
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
                                <a href="#" onclick="resetarPagamento()" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
                                <a href="#" data-toggle="modal" data-target="#modalMidias"><li class="drop-down__item">Midias</li></a>
                                <a href="consultarmeusprodutos.jsp"><li class="drop-down__item">Produtos</li></a> 
                                <a href="#" onclick="resetarFrete()" data-toggle="modal" data-target="#modalFrete"><li class="drop-down__item">Frete</li></a>
                            </ul>
                        </div>
                    </div>
                    <!-- Essa opção será para sair da página, será levado para a página de login -->
                    <li><a href="login.jsp">Sair</a></li>
                </ul>
            </nav>
        </header>
        <!-- Inicio Tabela -->
        <div class="container table-responsive py-5"> 
            <dl class="row d-flex justify-content-end">
                <dd class="col-sm-auto">
                    <input id="search" class="form-control" type="text" placeholder="Procure por um pedido...">
                </dd>
            </dl>
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
                <tbody id="table">
                    <% for (Pedido p : pedidos) {%>
                    <tr>
                        <th scope="row" onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')">
                            <%out.write(String.valueOf(p.getIdPedido()));%>
                        </th>
                        <td onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')"><%out.write(p.getNome());%></td>
                        <td onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')">R$ <%out.write(String.format("%.2f", p.getTotalCompra()).replace(".", ","));%></td>
                        <td onclick="acionar('<%out.write(String.valueOf(p.getIdPedido()));%>')"><%out.write(String.valueOf(formato.format(p.getDataPedido())));%></td>
                        <td> <%  String icone = "";
                            String status = p.getStatus();
                            if (status.contains("Preparo")) {
                                icone = "class='fas fa-hat-chef fa-lg' style='color: gray;'";
                            } else if (status.contains("aminho")) {
                                icone = "class='fas fa-biking fa-lg' style='color: black;'";
                            } else if (status.contains("Entregue")) {
                                icone = "class='fas fa-check fa-lg' style='color: green;'";
                            } else if (status.contains("Cancelado")) {
                                icone = "class='fas fa-times fa-lg' style='color: red;'";
                            } else if (status.contains("Aprovado")) {
                                icone = "class='fas fa-receipt fa-lg' style='color: green'";
                            } else if (status.contains("Pendente")) {
                                icone = "class='fas fa-exclamation fa-lg' style='color: rgb(246,190,0)'";
                            }
                            %>
                            <i <%out.write(icone);%> aria-hidden="true"></i>
                            <%out.write(String.valueOf(p.getStatus()));%><button data-toggle="modal" data-target="#modalEditarStatus">Alterar</button>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <form id="theForm" name="theForm" action="consultarpedidojuridico_1.jsp" method="post">
                <input type="hidden" id="custId" name="custId" value="">
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
