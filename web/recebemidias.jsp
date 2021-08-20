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
    
    //recebe os valores do RecebeImagemPerfil
    pj.setInstagram(String.valueOf(request.getSession().getAttribute("instagram")));
    pj.setFacebook(String.valueOf(request.getSession().getAttribute("facebook")));
    pj.setCnpj(cnpj);

    //se cadastrar pessoa e o login dela
    if (pj.cadastrarMidias()) {
        //se deu certo
        response.sendRedirect("index.html");
    } else {
        //alert que não deu certo
        request.getSession().setAttribute("resultado", "MidiasNaoadicionadas");
        response.sendRedirect("login.jsp");
    }
%>