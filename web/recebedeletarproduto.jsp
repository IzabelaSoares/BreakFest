<%-- 
    Documento       : recebedeletarproduto
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//instancia Produto = pdrt
    Produto prdt = new Produto();

    prdt.setIdProduto(Integer.parseInt(String.valueOf(request.getSession().getAttribute("id"))));
    
    if(prdt.excluirProduto()){
        request.getSession().setAttribute("resultado", "ProdutoExcluido");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }else{
        request.getSession().setAttribute("resultado", "ProdutoNaoExcluido");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }
    
%>