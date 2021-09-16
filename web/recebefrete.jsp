<%-- 
    Document   : recebefrete
    Created on : 08/09/2021, 15:40:09
    Author     : Maria
--%>
<%@page import="dominio.BairrosFrete"%>
<%@page import="java.util.*"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
    
    //instancia a barirrosfrete = bf
    BairrosFrete bf = new BairrosFrete();

    //seta os dados do HTML para a classe
    bf.setFkCnpj(String.valueOf(request.getSession().getAttribute("cnpj")));
    bf.setBairroAtendimento(request.getParameter("bairros"));
    bf.setFrete(Float.parseFloat(request.getParameter("frete")));

    //se cadastrar frete deu certo
    if (bf.cadastrarBairroFrete()){
        response.sendRedirect("consultarpedidojuridico.jsp");
    }

%>
