<%-- 
    Document   : recebealterarstatus
    Created on : 11/09/2021, 18:05:53
    Author     : Maria
--%>
<%@page import="dominio.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  Pedido p = new Pedido();
    
    p.setStatus(request.getParameter("status"));
    p.setIdPedido(Integer.parseInt(String.valueOf(request.getSession().getAttribute("idped"))));
    
    if(p.alterarStatus()){
        response.sendRedirect("consultarpedidofisico.jsp");
    }else{
        out.write("não foi");
    }
    
%>