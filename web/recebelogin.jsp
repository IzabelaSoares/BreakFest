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
    
    //pega o email e manda para a pr�xima p�gina
    String email = request.getParameter("email");
    request.getSession().setAttribute("usuario", email);
    
    //se login for v�lido para UsuarioFisico
    if (uf.podeLogar(email, request.getParameter("senha"))) {
        request.getSession().setAttribute("resultado", "SucessoLogin");
        response.sendRedirect("procurarpadaria.jsp");
    //se for v�lido para PessoaJuridica
    }else if (uj.podeLogar(email, request.getParameter("senha"))){ 
        request.getSession().setAttribute("resultado", "SucessoLogin");
        response.sendRedirect("produtospadrao.jsp");
    } else {
        //login n�o deu certo
        request.getSession().setAttribute("resultado", "ProblemaLogar");
        response.sendRedirect("login.jsp");
    }
%>