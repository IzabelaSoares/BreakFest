<%-- 
    Document   : recebeimagemperfil
    Created on : 19/08/2021, 15:08:33
    Author     : Maria
--%>
<%@page import="upload.RecebeImagemPerfil"%>
<%  //instancia o usuariojuridico = uj
    RecebeImagemPerfil img = new RecebeImagemPerfil();

    String cnpj = "${sessionScope.usuario}";

    //se cadastrar pessoa e o login dela
    /*if (img.) {
        request.getSession().setAttribute("resultado", "MidiasAdicionadas");
        response.sendRedirect("index.html");
    } else {
        //alert que não deu certo
        request.getSession().setAttribute("resultado", "ImagemNaoAdicionada");
        response.sendRedirect("midias.jsp");
    }*/
%>