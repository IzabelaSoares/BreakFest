<%-- 
    Document   : recebelogin
    Created on : 09/08/2021, 14:47:04
    Author     : Maria
--%>

<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.UsuarioFisico"%>
<%  //instancia o usuariofisico = uf  
    UsuarioFisico uf = new UsuarioFisico();
    
    //instancia o usuariojuridico = uj
    UsuarioJuridico uj = new UsuarioJuridico();
    
    //se login for válido no UsuarioJuridico ou UsuarioFisico
    if (uj.podeLogar(request.getParameter("fkemail"), request.getParameter("senha")) || uf.podeLogar(request.getParameter("fkemail"), request.getParameter("senha"))) {
        response.sendRedirect("index.html");
    } else {
        response.sendRedirect("cadastrocartao.jsp");
    }
%>