<%-- 
    Documento       : recebealterarstatus
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8");
    
    //instanciando a classe pedido
    Pedido p = new Pedido();
    
    //passando os parâmetros para a classe
    p.setStatus(request.getParameter("status"));
    p.setIdPedido(Integer.parseInt(String.valueOf(request.getSession().getAttribute("idped"))));
    String pag = String.valueOf(request.getSession().getAttribute("pag"));
    
    //se alterar status der certo
    if(p.alterarStatus()){
        request.getSession().setAttribute("resultado", "StatusAterado");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }else{
        request.getSession().setAttribute("resultado", "StatusNaoAterado");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));

    }
    
%>