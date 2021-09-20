<%-- 
    Documento       : recebealterarstatus
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
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