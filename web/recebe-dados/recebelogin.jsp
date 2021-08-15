<%-- 
    Document   : recebelogin
    Created on : 09/08/2021, 14:47:04
    Author     : Maria
--%>

<%@page import="dominio.Pix"%>
<%@page import="dominio.Deposito"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Cartao"%>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.UsuarioFisico"%>
<%  //instancia o usuariofisico = uf  
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    //instancia o pessoajuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    //instancia o deposito = dep
    Deposito dep = new Deposito();
    
    //instancia o pix = pix
    Pix pix = new Pix();
    
    String email = request.getParameter("email");
    
    //se login for válido no UsuarioJuridico ou UsuarioFisico
    if (uj.podeLogar(email, request.getParameter("senha")) || uf.podeLogar(email, request.getParameter("senha"))) {
        //instancia Cartao = card
        Cartao card = new Cartao();
        //se a pessoa não possue dados de cartao, redireciona para a pagina de cadastro
        if(!card.verificaDados(email)){
            response.sendRedirect("dadoscartaocredito.jsp");
        //se for pessa juridica, verifica se possui algum metodo para receber o dinheiro
        }else if (dep.verificaDados(email) || pix.verificaDados(email)){
            response.sendRedirect("preferenciapagamento.jsp");
        //se for pessoa jurídica, verifica se ela possue redes sociais cadastradas
        }else if(!pj.verificaSociais(email)){
            response.sendRedirect("cadastroredes.jsp");
        //se não, redireciona para o index
        }else{
            response.sendRedirect("index.html");
        }
    } else {
        //login não deu certo
        response.sendRedirect("login.jsp");
    }
%>