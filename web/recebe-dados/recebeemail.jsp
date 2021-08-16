<%-- 
    Document   : recebeemail
    Created on : 12/08/2021, 14:43:20
    Author     : Maria
--%>

<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="dominio.EnviarEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  //instancia o usuariofisico = uf
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    ////instancia o enviaremail = email
    EnviarEmail email = new EnviarEmail();
    
    String endereco = request.getParameter("email");
    
    //se o email existir em algum dos tipos de usuário, ele envia o email para a recuperação de senha
    if(uf.verificaExistencia(request.getParameter("email")) || uj.verificaExistencia(request.getParameter("email"))){
        if(email.enviaEmail(endereco)){
            response.sendRedirect("login.jsp");
            request.getSession().setAttribute("resultado", "EnviadoEmailRecuperarSenha");
        }else{
            response.sendRedirect("index.html");
            request.getSession().setAttribute("resultado", "NaoEnviadoEmailRecuperarSenha");
        //alerta de email não existende no banco
        
    }
%>
