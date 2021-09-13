<%-- 
    Document   : produtospadrao
    Created on : 16/08/2021, 16:46:19
    Author     : Izabela
--%>
<%@page import="dominio.Banco"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR" dir="ltr">
    <head>
        <meta charset="utf-8">
        <!-- Navbar Usuário -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>

        <link rel="stylesheet" href="styles/cadastro-produto.css"/>

        <!-- Título e imports padrão -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Break Fest</title>
        <link href="styles/util.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <!-- Sweet Alert -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

        <!-- CSS, JS e BootStrap de Preferencia de pagamento -->
        <link rel="stylesheet" href="styles/midias.css">
        <link rel="stylesheet" href="styles/preferenciapagamento.css">
        <script src="scripts/midias.js"></script>
        <script src="scripts/preferencia-de-pagamento.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

        <!-- CSS, JS e BootStrap de Importar produtos -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <link rel="stylesheet" href="styles/galeria-de-produtos.css">
        <link rel="stylesheet" href="styles/util.css">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        <script src="scripts/galeria-de-produtos.js"></script>
    </head>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar" onload="javascript: alertar(resultado)">
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
                            <a href="alterarusuariojuridico.jsp"><li class="drop-down__item">Cadastro</li></a>
                            <a href="consultarpedidojuridico.jsp"><li class="drop-down__item">Pedidos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalMidias"><li class="drop-down__item">Midias</li></a>
                            <a href="consultarmeusprodutos.jsp"><li class="drop-down__item">Produtos</li></a>
                        </ul>
                    </div>
                </div>
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
    </header>
    <%
        //Instanciar a Produto
        Produto novo = new Produto();
        List<Produto> consulta = novo.consultarProdutosBreakFest();

        //Instanciar a Pessoa Juridica
        PessoaJuridica pj = new PessoaJuridica();

        //Pegar o cnpj dela
        String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
        String cnpj = pj.procuraCnpj(fkemail);

        //Instanciar uma nova pessoa juridica e consultar os dados através do cnpj
        PessoaJuridica consult = new PessoaJuridica();
        consult = consult.consultarConta(cnpj);

        //Instanciar uma nova pessoa juridica e consultar os dados através do cnpj
        PessoaJuridica pix = new PessoaJuridica();
        pix = consult.consultarDados(cnpj);

        //Instanciar banco para escolher o pagamento.
        Banco lista = new Banco();
        List<Banco> listabanco = lista.consultarGeral();

    %>
    <!-- Fim da NavBar de cima -->
    <!-- modal de pagamento -->
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

                                    <!--          //////////Preview da Imagem////////                -->
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
                                <div class="botaoLegal">
                                    <input type="submit" value="Enviar"/>
                                </div>
                            </div>
                        </form>
                    </section>
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.6.0/alpine.js'></script><script  src="scripts/midias.js"></script>
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script><script src="./script.js"></script>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPagamento" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h3>Como deseja receber seu pagamento?</h3>
                    <div id="inputbonito">

                        <div class="pagamento">

                            <!-- Selecionando método de recebimento -->

                            <form action="recebepagamento.jsp" method="post" >
                                <select id="pagamento" name="pagamento" onchange="formaPagamento()">
                                    <option value="NA" selected disabled hidden>Selecione aqui a forma de pagamento</option>
                                    <option value="pix">Pix</option>
                                    <option value="deposito">Depósito Bancário</option>
                                </select>
                                <br><br>

                                <!-- PIX -->

                                <div id="pix-pagamento" style="display:none">           
                                    <label for="pix_metodo">Escolha sua Chave Pix</label><br>
                                    <select name="fktipochave" id="pix_metodo" onchange="chavePix()">
                                        <option value="NA" selected disabled hidden>Selecione a chave PIX aqui</option>
                                        <option value="cnpj">CNPJ</option>
                                        <option value="email">E-mail</option>
                                        <option value="telefone">Telefone</option>
                                    </select>
                                    <br>

                                    <!-- Input de CPNJ -->
                                    <div id="cnpj-pagamento" style="display:none">
                                        <label for="chave-cnpj">Informe seu CNPJ</label>
                                        <input type="text" name="chave-cnpj" id="chave-cnpj" placeholder="XX.XXX.XXX/XXXX-XX"
                                               value="<% out.print(String.valueOf(pix.getCnpj())); %>">
                                    </div>
                                    <!-- Input do E-mail -->
                                    <div id="email-pagamento" style="display:none">
                                        <label for="chave-telefone">Informe seu E-mail</label>
                                        <input type="text" name="chave-email" id="chave-email" placeholder="exemplo@email.com"
                                               value="<% out.print(String.valueOf(pix.getEmail())); %>">
                                    </div>
                                    <!-- Input do Telefone -->
                                    <div id="telefone-pagamento" style="display:none">
                                        <label for="chave-telefone">Informe seu Telefone</label>
                                        <input type="text" name="chave-telefone" id="chave-telefone" placeholder="(XX)XXXXX-XXXX"
                                               value="<% out.print(String.valueOf(pix.getTelefone())); %>">
                                    </div><br>
                                    <!-- Input do dia de recebimento -->
                                    <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                    <select name="dia" id="dia">
                                        <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                        <option value="05">Dia 05</option>
                                        <option value="10">Dia 10</option>
                                        <option value="25">Dia 25</option>
                                    </select>
                                </div>  

                                <!-- Depósito Bancário -->

                                <!-- Input do CNPJ -->
                                <div id="deposito-pagamento" style="display:none">
                                    <label for="conta-cnpj">Informe o CNPJ</label>
                                    <input name="cnpj" type="text" id="conta-cnpj" placeholder="Informe o CNPJ"> 
                                    <br><br>
                                    <!-- Input do banco -->
                                    <label>Banco</label> <br/>
                                    <select name="banco" id="bankaccount">
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
                                    <select name="dia" id="dia">
                                        <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                        <option value="05">Dia 05</option>
                                        <option value="10">Dia 10</option>
                                        <option value="25">Dia 25</option>
                                    </select>
                                </div>
                                <!-- Botão de Submit -->
                                <div class="botaoLegal">
                                    <button type="submit">
                                        <p>Enviar</p>
                                        <span></span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalNovoProduto" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <!-- Inicio divs de container -->
                    <div class="container">
                        <!--  Fomulario de Cadastro -->
                        <form action="RecebeImagemProduto" method="post" enctype="multipart/form-data">
                            <div class="row"  style="margin-left: 30px;">
                                <div class="input-group mb-3"><br>
                                    <!-- Inicio divs do produto -->
                                    <div style="margin-left: 30px; font-size: 30px; font-family: 'Muli', sans-serif; font-weight: 600; color:#995a1a;">
                                        Cadastrar Produto    
                                    </div>
                                    <!-- Titulo Produto  -->
                                    <div class="mb-3" style="margin-top: 15px;">
                                        <div class="form-group row">
                                            <label for="first" class="col-sm-4 col-form-label">Produto</label>
                                            <div class="col-sm-8">
                                                <input maxlength="30" type="text" class="form-control" required
                                                       name = "titulo" id="first" placeholder="EX: Café"
                                                       style="height:40px; width:215px; box-shadow:none; 
                                                       border-bottom: 2px solid #995a1a; border-left: 0; 
                                                       border-top: 0; border-right: 0; border-radius: 2px;">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Código Produto  -->
                                    <div class="mb-3" style="margin-top: 15px;">
                                        <div class="form-group row">
                                            <label for="codigoproduto" class="col-sm-4 col-form-label">Código</label>
                                            <div class="col-sm-8">
                                                <input maxlength="30" type="text" class="form-control" 
                                                       name = "codigoproduto" id="codigoproduto" placeholder="EX: 2134"
                                                       style="height:40px; width:215px; box-shadow:none; 
                                                       border-bottom: 2px solid #995a1a; border-left: 0; 
                                                       border-top: 0; border-right: 0; border-radius: 2px;" required>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Categoria   -->
                                    <div class="mb-3">
                                        <div class="form-group row">
                                            <label for="categoria" class="col-sm-4 col-form-label">Categoria</label>
                                            <div class="col-sm-8">
                                                <select style="height:40px; width:215px; box-shadow:none; border-bottom: 2px 
                                                        solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" 
                                                        class="form-control" id="categoria" name="categoria"required>
                                                    <option value="NA" selected disabled hidden>Doces, Salgados, Bebidas..</option>
                                                    <option value="Doce">Doces</option>
                                                    <option value="Salgado">Salgados</option>
                                                    <option value="Bebida">Bebidas</option>
                                                    <option value="Agridoce">Frios</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Tamanho  -->
                                    <div class="mb-3">
                                        <div class="form-group row">
                                            <label for="first" class="col-sm-4 col-form-label">Tamanho</label>
                                            <div class="col-sm-8">
                                                <input maxlength="30" style="height:40px; width:215px; box-shadow:none;  
                                                       border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; 
                                                       border-right: 0; border-radius: 2px;" type="tel" class="form-control" 
                                                       name = "tamanho" id="phone" required placeholder="EX: Uma xícara de 60 ml">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Unidade de Medida  -->
                                    <div class="mb-3">
                                        <div class="form-group row">
                                            <label for="unidadedemedida" class="col-sm-4 col-form-label">Unidade de Medida</label>
                                            <div class="col-sm-8" style="padding: 0" >
                                                <select style="height:40px; width:215px; box-shadow:none; 
                                                        border-bottom: 2px solid #995a1a; border-left: 0; 
                                                        border-top: 0; border-right: 0; border-radius: 2px;" 
                                                        class="form-control" name="unidadedemedida" required>
                                                    <option value="NA" selected disabled hidden>Litros, Gramas, Quilos..</option>
                                                    <option value="KG">Quilo</option>
                                                    <option value="G">Grama</option>
                                                    <option value="L">Litro</option>
                                                    <option value="ML">Ml</option>
                                                    <option value="FATIA">Fatia</option>
                                                    <option value="UN">Unidade</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Preço do Produto  -->
                                    <div class="mb-3">
                                        <div class="form-group row">
                                            <label for="preco" class="col-sm-4 col-form-label">Preço</label>
                                            <div class="col-sm-8">
                                                <div class="input-group-prepend">
                                                    <span for="preco" style="border-style:none; height: 40px;" class="input-group-text">R$</span>

                                                    <input maxlength="500" style="height:40px; width:177px; box-shadow:none; 
                                                           border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; 
                                                           border-right: 0; border-radius: 2px; outline:none;" type="text" 
                                                           id="preco" name="preco" placeholder="2,99" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   

                                    <!-- Descrição do Produto  -->
                                    <div class="input-group mb-3">
                                        <div class="form-group">
                                            <label for="descricao">Descrição do Produto</label>
                                            <div class="col-sm-12">
                                                <textarea style="height:80px; width:310px; box-shadow:none; 
                                                          border-bottom: 2px solid #995a1a; border-left: 0;
                                                          border-top: 0; border-right: 0; border-radius: 2px;" 
                                                          name="descricao" id="descricao" class="form-control" 
                                                          aria-label="With textarea" placeholder="EX: Café Preto sem açúcar" required></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <!-- Selecionar a Imagem  -->
                                    <div id="center">
                                        <div x-data="imageData()" class="file-input flex items-center">

                                            <!--          //////////                      Preview da Imagem                      ////////                -->
                                            <div class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">

                                                <!-- Placeholder da Imagem -->
                                                <div >

                                                    <!-- Input de foto -->
                                                    <div class="rounded-md shadow-sm">
                                                        <input @change="updatePreview($refs)" x-ref="input"
                                                                type="file" maxlength="50px" 
                                                                accept="image/*,capture=camera" 
                                                                name="produto" id="produto" 
                                                                class="custom">
                                                        <label for="produto" style="border-left: none;
                                                               border-bottom: 2px solid #995a1a; border-top: none; 
                                                               border-right: none; padding-left: 8px; padding-right: 8px;">
                                                            Adicionar Imagem ao Produto
                                                        </label>
                                                    </div><br>
                                                    <div class="flex items-center text-sm text-gray-500 mx-2">
                                                        <span name="nomeArquivo" x-text="fileName || emptyText"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </div>

                                    <div class="input-group mb-3">
                                        <div id="msg"></div>
                                        <form method="post" id="image-form">
                                            <input type="file" name="file" class="file" accept="image/*"
                                                   style="box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;">
                                            </div>

                                            <!-- Fim divs do produto -->
                                            <button type="submit" style="border: 1px solid #995a1a; box-shadow: 0 0 0 0; outline: none; position: relative; left: 40%; width: 90px; height: 40px; text-align: center; background-color: #995a1a; border-radius: 5px; color: white;">Enviar</button>
                                        </form>
                                    </div>
                                </div>
                        </form>
                    </div>
                    <!-- Fim divs de container -->
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <br>
        <div class="botoes">
            <form class="form-detail" action="recebeprodutospadrao.jsp" method="post" id="myform">
                <!-- Input de importar os produtos -->
                <input type="hidden" id="produtos-teste" name="produtosteste" value="">  
                <button class="botao" data-toggle="modal" data-target="#modalNovoProduto" type="button">Cadastrar Produto</button> &nbsp
                <a href="consultarmeusprodutos.jsp"><button onclick="<!-- puxar o cnpj e os produtos aqui -->" class="botao" type="button">Meus Produtos</button></a> &nbsp
                <button id="botao-importar" onclick="importar()" class="botao" type="submit">Importar Produtos</button>
            </form>
        </div>
        <br>
        <input id="search" type="text" placeholder="Procure um produto ou informe uma categoria aqui..."><br>        
        <h1>Selecione produtos</h1><br>
        <div class="borda">
            <table class="table table-image">
                <thead class="tabelaThead">
                    <tr>
                        <th class="check"><input type="checkbox" id="cc" onclick="javascript:checkAll(this)"/></th>
                        <th class="titulo" >Imagem</th>
                        <th class="titulo" >Produto</th>
                        <th class="titulo" >Categoria</th>
                        <th class="titulo" >Descrição </th>
                        <th class="titulo" >Tamanho</th>
                        <th class="titulo" >Un. Medida</th>
                        <th class="titulo" >Preço</th>
                    </tr>
                </thead>
                <tbody id="table">
                    <tr>
                        <% for (Produto n : consulta) {%>

                        <td class="check"><input type="checkbox" 
                                                 data-id="<% out.write(String.valueOf(n.getIdProduto()));%>" name="box" class="importar-produto"></td>
                        <td name="imagem" value="<% n.getImagem(); %>" class="imagem"><img src="<%out.write(n.getImagem());%>" class="img-fluid img-thumbnail" alt="<%out.write(n.getTitulo().toUpperCase()); %>"></td>
                        <td name="titulo" class="produto" > <%out.write(n.getTitulo()); %> </td>
                        <td name="categoria" class="categoria"><%out.write(n.getCategoria()); %></td>
                        <td><input type="hidden" name="descricao" value="<%out.write(n.getDescricao());%>"><%out.write(n.getDescricao());%></td>
                        <td name="tamanho" class="tamanho"><%out.write(n.getTamanho()); %> </td>
                        <td name="unidadedemedida" class="unidade"><%out.write(n.getUnidadeDeMedida()); %> </td>
                        <td name="preco" class="preco">R$ <%out.write(String.valueOf(n.getPreco()).replace(".", ",") + "0");%></td>
                    </tr>

                    <%}%>
                </tbody>
            </table>   
        </div>
    </div>
    <br><br><br>
    <!-- JS de produtos padrão -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://unpkg.com/popper.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>

</body>
</html>
