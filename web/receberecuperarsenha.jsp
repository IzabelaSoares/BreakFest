<%-- 
    Document   : receberecuperarsenha
    Created on : 11/08/2021, 14:52:08
    Author     : Maria
--%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="dominio.UsuarioJuridico"%>

<!-- Instanciamento de classes e método em Java  -->
<% //instancia o usuariofisico = uf
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    //recebe os valores da tela HTML
    uf.setEmail(request.getParameter("email"));
    uf.setSenha(request.getParameter("senhanova"));

    //recebe os valores da tela HTML
    uj.setEmail(request.getParameter("email"));
    uj.setSenha(request.getParameter("senhanova"));

    //se cadastrar pessoa e o login dela
    if (uf.alterarSenha() || uj.alterarSenha()) {
        request.getSession().setAttribute("resultado", "SenhaAlterada");
        response.sendRedirect("login.jsp");
    } else {
        //alert que não deu certo
        request.getSession().setAttribute("resultado", "SenhaNaoAlterada");
        response.sendRedirect("login.jsp");
    }
%>