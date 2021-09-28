<%-- 
    Documento       : recebemidias
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%> 
<%@page import="dominio.PessoaJuridica"%>
<%  //instancia o pessoajuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    //pega o email e procura o cnpj
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(fkemail);
    
    //manda os valores para a classe
    pj.setCnpj(cnpj);
    pj.setFacebook(String.valueOf(request.getSession().getAttribute("facebook")));
    pj.setInstagram(String.valueOf(request.getSession().getAttribute("instagram")));
    String img = String.valueOf(request.getSession().getAttribute("existenteimg"));
    if(img == "tem"){
        pj.setImagem(String.valueOf(request.getSession().getAttribute("localizacao")));
    }

    //se cadastrar midias der certo
    if(pj.cadastrarMidias()){
        request.getSession().setAttribute("resultado", "MidiasCadastradas");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }else{
        //erro no  cadastro
        request.getSession().setAttribute("resultado", "MidiasNaoCadastradas");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }
%>
