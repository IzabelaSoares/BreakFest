<%-- 
    Document   : recebecartao
    Created on : 09/08/2021, 13:58:18
    Author     : Maria
--%>

<%@page import="dominio.Cartao"%>
<%  //instancia o cartão = card
    
    Cartao card = new Cartao();

    //recebe os valores da tela HTML
    card.setFkcpf(request.getParameter("fkcpf"));
    card.setNome(request.getParameter("nome").toUpperCase());
    card.setNumero(Integer.parseInt(request.getParameter("numero")));
    card.setValidade(request.getParameter("validade"));
    card.setCodSeguranca(request.getParameter("codseguranca"));
    
    //se cadastrar pessoa e o login dela
    if (card.cadastrarCartao()) {
        response.sendRedirect("index.html");
    } else {
        response.sendRedirect("cadastrocartao.jsp");
    }
%> 