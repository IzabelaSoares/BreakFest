<%-- 
    Document   : recebepix
    Created on : 09/08/2021, 14:42:05
    Author     : Maria
--%>

<%@page import="dominio.Pix"%>
<% //instancia o pix = pix  
    Pix pix = new Pix();

    //recebe os valores da tela HTML
    pix.setFkTipoChave(request.getParameter("fktipochave"));
    pix.setChave(request.getParameter("chave"));
    pix.setNome(request.getParameter("nome"));
    
    //se cadastrar pessoa e o login dela
    if (pix.cadastrarPix()) {
        response.sendRedirect("index.html");
    } else {
        response.sendRedirect("cadastrocartao.jsp");
    }
%>
