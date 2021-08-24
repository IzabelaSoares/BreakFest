<%-- 
    Document   : produtospadrao
    Created on : 16/08/2021, 16:46:19
    Author     : Izabela
--%>
<%@page import="dominio.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
    <meta charset="utf-8">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="./script.js"></script>
    <link rel="stylesheet" href="styles/galeria-de-produtos.css">
    <link rel="stylesheet" href="styles/util.css">
    <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
    <script src="scripts/galeria-de-produtos.js"></script>
        <%
            Produto novo = new Produto();
            List<Produto> consulta = novo.consultarProdutosBreakFest();
        %>

        <title>GALERIA DE SELEÇÃO DE PRODUTOS</title>
    </head>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="dadoscartaocredito.jsp"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a id="login" href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <body>
        <form class="form-detail" action="recebeprodutospadrao.jsp" method="post" id="myform">
        <div class="container">
            <h1>Selecione produtos: </h1>
            <input id="search" type="text" placeholder="Procure um produto ou informe uma categoria aqui..."><br>
            <button class="botao">Importar Produtos</button><br>
            <div class="borda">
            <table class="table table-image">
                <thead>
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
