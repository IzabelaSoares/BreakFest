<%-- 
    Document   : recebedeletarproduto
    Created on : 13/09/2021, 13:42:32
    Author     : Maria
--%>
<%@page import="dominio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//instancia Produto = pdrt
    Produto prdt = new Produto();

    prdt.setIdProduto(Integer.parseInt(String.valueOf(request.getSession().getAttribute("id"))));
    
    if(prdt.excluirProduto()){
        request.getSession().setAttribute("resultado", "ProdutoExcluido");
        response.sendRedirect("consultarmeusprodutos.jsp");
    }
    
%>