<%-- 
    Document   : recebemidias
    Created on : 19/08/2021, 13:26:53
    Author     : Maria
--%>
<%@page import="upload.RecebeImagemPerfil"%>
<%@page import="dominio.PessoaJuridica"%>
<%  //instancia o usuariojuridico = uj
    PessoaJuridica pj = new PessoaJuridica();

    String email = "${sessionScope.usuario}";
    
    //recebe os valores da tela HTML
    pj.setInstagram(request.getParameter("instagram"));
    pj.setFacebook(request.getParameter("facebook"));
    pj.setCnpj(pj.procuraCnpj(email));

    //se cadastrar pessoa e o login dela
    if (pj.cadastrarMidias()) {
        response.sendRedirect("index.html");
        /*
        request.getSession().setAttribute("usuario", pj.procuraCnpj(email));
        response.sendRedirect("recebeimagem.jsp"); */
    } else {
        //alert que não deu certo
        request.getSession().setAttribute("resultado", "MidiasNaoadicionadas");
        response.sendRedirect("login.jsp");
    }
%>