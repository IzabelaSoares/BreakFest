<%-- 
    Document   : recebemidias
    Created on : 23/08/2021, 14:55:00
    Author     : Maria
--%>
<%@page import="dominio.PessoaJuridica"%>
<%  //instancia o pessoajuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(fkemail);
    
    pj.setFacebook(String.valueOf(request.getSession().getAttribute("facebook")));
    pj.setInstagram(String.valueOf(request.getSession().getAttribute("instagram")));
    pj.setCnpj(cnpj);
    
    if(pj.cadastrarMidias()){
        request.getSession().setAttribute("resultado", "MidiasCadastradas");
        response.sendRedirect("produtospadra.jsp");
    }else{
        request.getSession().setAttribute("resultado", "MidiasNaoCadastradas");
        response.sendRedirect("midias.jsp");
    }
%>
