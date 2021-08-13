<%-- 
    Document   : recebelogin
    Created on : 09/08/2021, 14:47:04
    Author     : Maria
--%>

<%@page import="dominio.Cartao"%>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.UsuarioFisico"%>
<%  //instancia o usuariofisico = uf  
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    String email = request.getParameter("email");
    
    //se login for válido no UsuarioJuridico ou UsuarioFisico
    if (uj.podeLogar(email, request.getParameter("senha")) || uf.podeLogar(email, request.getParameter("senha"))) {
        //instancia Cartao = card
        Cartao card = new Cartao();
        //se a pessoa não possue dados de cartao, redireciona para a pagina de cadastro
        if(!card.verificaDados(email)){
            response.sendRedirect("dadoscartaocredito.jsp");
        }
        
        response.sendRedirect("index.html");
    } else {
        response.sendRedirect("cadastrocartao.jsp");
    }
%>