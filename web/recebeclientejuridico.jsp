<%-- 
    Document   : recebeclientejuridico
    Created on : 06/08/2021, 14:11:58
    Author     : Maria
--%>

<%@page import="dominio.UsuarioJuridico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaJuridica"%>
<%  //instancia a pessoa f�sica = PF
    PessoaJuridica pj = new PessoaJuridica();
    
    //instanciar o login da = PJ
    UsuarioJuridico login = new UsuarioJuridico();
    
    if(login.verificaExistencia(request.getParameter("email")) && pj.verificaExistenciaCnpj(request.getParameter("cnpj")) && pj.verificaExistenciaFisica(request.getParameter("email"))){
        //adicionar aqui
        response.sendRedirect("index.html");
    }else{
        //recebe os valores da tela HTML
        pj.setRazaoSocial(request.getParameter("razaosocial"));
        pj.setNomeFantasia(request.getParameter("nomefantasia"));
        pj.setCnpj(request.getParameter("cnpj"));
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

        //Passar valores da tela e cadastrar o usu�rio
        login.setEmail(request.getParameter("email"));
        login.setSenha(request.getParameter("senha"));

        //se cadastrar pessoa e o login dela
        if (pj.cadastrarConta() && login.cadastrarUsuario()) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("index.html");
        }
    }
%>        