<%-- 
    Document   : recebemidias
    Created on : 23/08/2021, 14:55:00
    Author     : Maria
--%>
<%@page import="dominio.PessoaJuridica"%>
<%  //instancia o pessoajuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    //pega o email e procura o cnpj
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(fkemail);
    
    //manda os valores para a classe
    pj.setFacebook(String.valueOf(request.getSession().getAttribute("facebook")));
    pj.setInstagram(String.valueOf(request.getSession().getAttribute("instagram")));
    pj.setImagem(String.valueOf(request.getSession().getAttribute("localizacao")));
    pj.setCnpj(cnpj);

    //se cadastrar midias der certo
    if(pj.cadastrarMidias()){
        request.getSession().setAttribute("resultado", "MidiasCadastradas");
        response.sendRedirect("alterarusuariojuridico.jsp");
    }else{
        //erro no  cadastro
        request.getSession().setAttribute("resultado", "MidiasNaoCadastradas");
        response.sendRedirect("alterarusuariojuridico.jsp");
    }
%>
