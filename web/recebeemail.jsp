<%-- 
    Documento       : recebeemail
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="dominio.EnviarEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Instanciamento de classes e método em Java  -->
<%  //instancia o usuariofisico = uf
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    ////instancia o enviaremail = email
    EnviarEmail email = new EnviarEmail();
    
    String endereco = request.getParameter("email");
    
    //se o email existir em algum dos tipos de usuário, ele envia o email para a recuperação de senha
    if(uf.verificaExistencia(request.getParameter("email")) || uj.verificaExistencia(request.getParameter("email"))){
        //se o email for enviado
        if(email.enviaEmail(endereco)){
            request.getSession().setAttribute("resultado", "EmailEnviado");
            response.sendRedirect("login.jsp");
        }else{
            //erro no envio
            request.getSession().setAttribute("resultado", "EmailNaoEnviado");
            response.sendRedirect("index.html");
        }
    //alerta de email não existende no banco
    }else{
        request.getSession().setAttribute("resultado", "EmailNaoExistente");
        response.sendRedirect("emailrecuperarsenha.jsp");
    }
%>
