<%-- 
    Document   : receberecuperarsenha
    Created on : 11/08/2021, 14:52:08
    Author     : Maria
--%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="dominio.UsuarioJuridico"%>
<% //instancia o usuariofisico = uf
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    //se o email existe no usuario fisico ou juridico a senha é alterada
    if (uf.verificaExistencia(request.getParameter("email")) || uj.verificaExistencia(request.getParameter("email"))){
        //recebe os valores da tela HTML
        uf.setEmail(request.getParameter("email"));
        uf.setSenha(request.getParameter("senhanova"));

        //recebe os valores da tela HTML
        uj.setEmail(request.getParameter("email"));
        uj.setSenha(request.getParameter("senhanova"));

        //se cadastrar pessoa e o login dela
        if (uf.alterarSenha() || uj.alterarSenha()) {
            response.sendRedirect("index.html");
            System.out.println("alterado!");
        } else {
            response.sendRedirect("login.jsp");
            System.out.println("nao deu");
        }
    }else{
        System.out.println("nao existe");
    }
%>