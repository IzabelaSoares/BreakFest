<%-- 
    Documento       : recebefrete
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.BairrosFrete"%>
<%@page import="java.util.*"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
    
    //instancia a barirrosfrete = bf
    BairrosFrete bf = new BairrosFrete();

    //seta os dados do HTML para a classe
    bf.setFkCnpj(request.getParameter("cnpj"));
    bf.setBairroAtendimento(request.getParameter("bairros"));
    bf.setFrete(Float.parseFloat(request.getParameter("frete")));

    //se cadastrar frete deu certo
    if (bf.alterarFrete()){
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }else{
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }

%>
