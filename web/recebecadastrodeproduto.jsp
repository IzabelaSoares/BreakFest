<%-- 
    Document   : recebecadastrodeproduto
    Created on : 19/08/2021, 13:56:42
    Author     : Maria
--%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.Cartao"%>
<%  //instancia o produto = prdt
    Produto prdt = new Produto();

    //recebe os valores da tela HTML
    /*prdt.set(request.getParameter("fkcpf"));
    prdt.set(request.getParameter("nome").toUpperCase());
    prdt.set(Integer.parseInt(request.getParameter("numero")));
    prdt.set(request.getParameter("validade"));
    prdt.set(request.getParameter("codseguranca"));
    */

    //se cadastrar cartao
    if (prdt.cadastrarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect("perfil.jsp");
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect("cadastrodeproduto.jsp");
    }
%> 