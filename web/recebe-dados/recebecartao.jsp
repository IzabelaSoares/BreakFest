<%-- 
    Document   : recebecartao
    Created on : 09/08/2021, 13:58:18
    Author     : Maria
--%>

<%@page import="dominio.Cartao"%>
<%  //instancia o cart�o = card
    
    Cartao card = new Cartao();

    //recebe os valores da tela HTML
    card.setFkcpf(request.getParameter("fkcpf"));
    card.setNome(request.getParameter("nome").toUpperCase());
    card.setNumero(Integer.parseInt(request.getParameter("numero")));
    card.setValidade(request.getParameter("validade"));
    card.setCodSeguranca(request.getParameter("codseguranca"));
    
    //se cadastrar cartao
    if (card.cadastrarCartao()) {
        request.getSession().setAttribute("resultado", "CartaoSalvo");
        response.sendRedirect("perfil.jsp");
    } else {
        request.getSession().setAttribute("resultado", "CartaoNaoSalvo");
        response.sendRedirect("perfil.jsp");
    }
%> 