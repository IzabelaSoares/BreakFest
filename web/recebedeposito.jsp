<%-- 
    Document   : recebedeposito
    Created on : 09/08/2021, 14:38:42
    Author     : Maria
--%>
<%@page import="dominio.Deposito"%>
<% //instancia o depósito = dep  
    Deposito dep = new Deposito();

    //recebe os valores da tela HTML
    dep.setNome(request.getParameter("nome"));
    dep.setCnpj(request.getParameter("cnpj"));
    dep.setNumeroBanco(Integer.parseInt(request.getParameter("numerobanco")));
    dep.setFkAgencia(request.getParameter("fkagencia"));
    dep.setConta(Integer.parseInt(request.getParameter("conta")));
    
    //se cadastrar pessoa e o login dela
    if (dep.cadastrarDeposito()) {
        response.sendRedirect("index.html");
    } else {
        response.sendRedirect("cadastrocartao.jsp");
    }
%>