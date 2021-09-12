<%-- 
    Document   : consultarmeusprodutos
    Created on : 10 de set. de 2021, 15:25:36
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="java.util.List"%>
<%@page import="dominio.Pedido"%>
<%@page import="dominio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus produtos</title>
        <link href="styles/produtos-padaria-comprar.css" rel="stylesheet">
        
        <!-- Instanciando a classe -->
        <% 
        Produto novo = new Produto();
        
        String cnpj = request.getParameter("padaria");
        List<Produto> produto = novo.consultarProdutosPadaria(cnpj);
        %>
    </head>
    <body>
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
    </body>
</html>
