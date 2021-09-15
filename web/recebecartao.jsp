<%-- 
    Document   : recebecartao
    Created on : 09/08/2021, 13:58:18
    Author     : Maria
--%>

<%@page import="dominio.PessoaFisica"%>
<%@page import="dominio.Cartao"%>
<%  //instancia o cartão = card
    Cartao card = new Cartao();

    //Pega o cpf
    String cpf = request.getParameter("cpf");
    
    //Passar os parametros do HTML
    card.setFkcpf(cpf);
    card.setNome(request.getParameter("cardname"));
    card.setNumero(request.getParameter("cardnumber").replaceAll("[^0-9]",""));
    card.setValidade(request.getParameter("expirationdate"));
    card.setCodSeguranca(request.getParameter("securitycode"));
    
    //se não existir dados
    if(card.verificaDados(cpf) == false){
        //se cadastrar cartao
        if (card.cadastrarCartao()) {
            request.getSession().setAttribute("resultado", "CartaoSalvo");
            response.sendRedirect("alterarusuariofisico.jsp");
        } else {
            request.getSession().setAttribute("resultado", "CartaoNaoSalvo");
            response.sendRedirect("alterarusuariofisico.jsp");
        }
    //se existir dados só altera
    }else{
        //se cadastrar cartao
        if (card.alterarCartao()) {
            request.getSession().setAttribute("resultado", "CartaoSalvo");
            response.sendRedirect("alterarusuariofisico.jsp");
        } else {
            request.getSession().setAttribute("resultado", "CartaoNaoSalvo");
            response.sendRedirect("alterarusuariofisico.jsp");
        }
    }
    
%> 