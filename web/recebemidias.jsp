<%-- 
    Document   : recebemidias
    Created on : 19/08/2021, 13:26:53
    Author     : Maria
--%>
<%@page import="upload.RecebeImagemPerfil"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="javax.servlet.http.Part"%>
<%  //instancia o usuariojuridico = uj
    PessoaJuridica pj = new PessoaJuridica();

    String email = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(email);
    Part part = request.getPart("photo");
    
    //recebe os valores da tela HTML
    pj.setInstagram(request.getParameter("instagram"));
    pj.setFacebook(request.getParameter("facebook"));
    pj.setCnpj(cnpj);

    //se cadastrar pessoa e o login dela
    if (pj.cadastrarMidias()) {
        request.getSession().setAttribute("usuario", cnpj);
        request.getSession().setAttribute("photo", part);
        response.sendRedirect("RecebeImagemPerfil");
    } else {
        //alert que não deu certo
        request.getSession().setAttribute("resultado", "MidiasNaoadicionadas");
        response.sendRedirect("login.jsp");
    }
%>