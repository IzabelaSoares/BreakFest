<%-- 
    Document   : recebealterausuariojuridico
    Created on : 27/08/2021, 14:50:15
    Author     : Maria
--%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="dominio.PessoaJuridica"%>
<%  request.setCharacterEncoding("UTF-8");
    
    //instancia a pessoa física = PF
    PessoaJuridica pj = new PessoaJuridica();
    
    //instanciar o login da = PJ
    UsuarioJuridico login = new UsuarioJuridico();

    String oldCnpj = request.getParameter("cnpj");

    pj.setRazaoSocial(request.getParameter("razaosocial"));
    pj.setNomeFantasia(request.getParameter("nomefantasia"));
    pj.setEmail(request.getParameter("email"));
    pj.setTelefone(request.getParameter("telefone"));
    pj.setCep(request.getParameter("cep"));
    pj.setEstado(request.getParameter("estado"));
    pj.setCidade(request.getParameter("cidade"));
    pj.setBairro(request.getParameter("bairro"));
    pj.setRua(request.getParameter("rua"));
    pj.setNumero(Integer.parseInt(request.getParameter("numero")));
    pj.setComplemento(request.getParameter("complemento"));
    pj.setSobrepadaria(request.getParameter("sobre"));
    pj.setBairros(request.getParameter("bairros"));

    //Passar valores da tela e cadastrar o usuário
    login.setEmail(request.getParameter("email"));
    login.setSenha(request.getParameter("senha"));

    //se cadastrar pessoa e o login dela
    if (pj.alterarDados(oldCnpj) && login.alterarUsuario(oldCnpj)) {
        request.getSession().setAttribute("resultado", "CadastroAlterado");
        response.sendRedirect("perfil.jsp");     
    } else {
        //erro no cadastro
        request.getSession().setAttribute("resultado", "CadastroNaoAlterado");
        response.sendRedirect("alterarusuariojuridico.jsp");
    }
%>
