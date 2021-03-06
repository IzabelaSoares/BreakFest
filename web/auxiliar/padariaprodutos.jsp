<%-- PÁGINA EM DESUSO
    Document   : padariaprodutos
    Created on : 27/08/2021, 10:44:44
    Author     : Izabela
--%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Link do Cloud Flare -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        
        <!--Script do Jquery -->
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="./script.js"></script>
        
        <!-- Link da página "galeria-de-produtos" em css -->
        <link rel="stylesheet" href="styles/galeria-de-produtos.css">
        
        <!-- Link da página "util" em css -->
        <link rel="stylesheet" href="styles/util.css">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- Script da galeria-de-produtos -->
        <script src="scripts/galeria-de-produtos.js"></script>
        
        <%  //Instanciamento de classes e método em Java
            
            //Instanciar a Pessoa Fisica
            PessoaJuridica pj = new PessoaJuridica();

            //Pegar o cpf dela
            String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
            String cnpj = pj.procuraCnpj(fkemail);

            Produto novo = new Produto();
            List<Produto> consulta = novo.consultarProdutosPadaria(cnpj);
        %>
 
        <!-- Título -->
        <meta charset="utf-8">
        <title>Break Fest</title>
    </head>
    
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="index.html"><img src="imagens/Break Fest Animated Logo in.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <!-- Painel padrão com as opções de Sobre nós, cadastro e login -->
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a id="login" href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <body>
        
        <!-- Form para selecionar os produtos -->
        <form class="form-detail" action="recebeprodutospadrao.jsp" method="post" id="myform">
            <div class="container">
                <h1>Selecione produtos: </h1>
                <input id="search" type="text" placeholder="Procure um produto ou informe uma categoria aqui..."><br>
                <button class="botao">Importar Produtos</button><br>
                <div class="borda">
                    <table class="table table-image">
                        <thead>
                            
                            <!-- Tabela Dos produtos (Imagem,produto,categoria,descrição,tamanho,unidade de medida e preço. -->
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
                                <!-- Produtos -->
                                <% for (Produto n : consulta) {%>
                                <td class="check"><input type="checkbox" name="box"></td>
                                <td name="imagem" value="<% n.getImagem(); %>" class="imagem"><img src="<%out.write(n.getImagem());%>" class="img-fluid img-thumbnail" alt="<%out.write(n.getTitulo().toUpperCase()); %>"></td>
                                <td name="titulo" class="produto" > <%out.write(n.getTitulo()); %> </td>
                                <td name="categoria" class="categoria"><%out.write(n.getCategoria()); %></td>
                                <td><input type="hidden" name="descricao" value="<%out.write(n.getDescricao().toUpperCase());%>"><%out.write(n.getDescricao().toUpperCase());%></td>
                                <td name="tamanho" class="tamanho"><%out.write(n.getTamanho()); %> </td>
                                <td name="unidadedemedida" class="unidade"><%out.write(n.getUnidadeDeMedida()); %> </td>
                                <td name="preco" class="preco"><%out.write(String.valueOf(n.getPreco()));%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>

