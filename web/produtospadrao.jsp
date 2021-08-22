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
    <script src="scripts/galeria-de-produtos.js"></script>
        <%
            Produto novo = new Produto();
            List<Produto> consulta = novo.consultarProdutosBreakFest();
        %>

        <title>GALERIA DE SELEÇÃO DE PRODUTOS</title>
    </head>
    <body>
        <div class="container">
            <h1>Selecione produtos: </h1>
            <input id="search" type="text" class="form-control"  placeholder="Procure um produto ou informe uma categoria aqui..."><br>
            <button class="btn btn-primary">Importar Produtos</button><br>
            <table class="table table-image">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="cc" onclick="javascript:checkAll(this)"/></th>
                        <th class="titulo" >Imagem</th>
                        <th class="titulo" >Produto</th>
                        <th class="titulo" >Categoria</th>
                        <th class="titulo" >Descrição </th>
                        <th class="titulo" >Tamanho</th>
                        <th class="titulo" >Preço</th>
                    </tr>
                </thead>
                <tbody id="table">
                    <tr>
                        <% for (Produto n : consulta) {%>
                        <td class="bs-checkbox "><input type="checkbox"></td>
                        <td class="imagem"><img src="<%out.write(n.getImagem());%>" class="img-fluid img-thumbnail" alt="<%out.write(n.getTitulo().toUpperCase()); %>"></td>
                        <td class="produto"><%out.write(n.getTitulo()); %></td>
                        <td class="categoria"><%out.write(n.getCategoria()); %></td>
                        <td><%out.write(n.getDescricao().toUpperCase()); %></td>
                        <td class="tamanho"><%out.write(n.getTamanho() + " " + n.getUnidadeDeMedida()); %></td>
                        <td class="preco">R$ <%out.write(String.valueOf(n.getPreco()));%></td>
                    </tr>
                     <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
