<%-- 
    Documento       : recebecartao
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.PessoaFisica"%>
<%@page import="dominio.Cartao"%>
<%  //instancia o cart�o = card
    Cartao card = new Cartao();

    //Pega o cpf
    String cpf = request.getParameter("cpf");
    
    String redPag = String.valueOf(request.getSession().getAttribute("pagina"));
    
    if(redPag.contains("produtospadariacomprar.jsp")){  
        redPag = "procurarpadaria_1.jsp";
    }
    
    //Passar os parametros do HTML
    card.setFkcpf(cpf);
    card.setNome(request.getParameter("cardname"));
    card.setNumero(request.getParameter("cardnumber").replaceAll("[^0-9]",""));
    card.setValidade(request.getParameter("expirationdate"));
    card.setCodSeguranca(request.getParameter("securitycode"));
    
    //se n�o existir dados
    if(card.verificaDados(cpf) == false){
        //se cadastrar cartao
        if (card.cadastrarCartao()) {
            request.getSession().setAttribute("resultado", "CartaoSalvo");
            response.sendRedirect(redPag);
        } else {
            request.getSession().setAttribute("resultado", "CartaoNaoSalvo");
            response.sendRedirect(redPag);
        }
    //se existir dados s� altera
    }else{
        //se cadastrar cartao
        if (card.alterarCartao()) {
            request.getSession().setAttribute("resultado", "CartaoSalvo");
            response.sendRedirect(redPag);
        } else {
            request.getSession().setAttribute("resultado", "CartaoNaoSalvo");
            response.sendRedirect(redPag);
        }
    }
    
%> 