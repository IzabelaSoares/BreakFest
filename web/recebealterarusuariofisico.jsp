<%-- 
    Documento       : recebealterausuariofisico
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
--%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="dominio.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8");

    //instancia a pessoa física = PF
    PessoaFisica pf = new PessoaFisica();
    
    //instanciar o login da = PF
    UsuarioFisico login = new UsuarioFisico();
    
    //passa os valores do HMTL para a classe PessoaFisica
    pf.setNome(request.getParameter("nome"));
    pf.setSobrenome(request.getParameter("sobrenome"));
    pf.setDataNascimento(Date.valueOf(request.getParameter("nascimento")));
    pf.setCpf(request.getParameter("cpf"));
    pf.setEmail(request.getParameter("email"));
    pf.setCelular(request.getParameter("telefone"));
    pf.setCep(request.getParameter("cep"));
    pf.setEstado(request.getParameter("estado"));
    pf.setCidade(request.getParameter("cidade"));
    pf.setBairro(request.getParameter("bairro"));
    pf.setRua(request.getParameter("rua"));
    pf.setNumero(Integer.parseInt(request.getParameter("numero")));
    pf.setComplemento(request.getParameter("complemento"));

    //passa os valores do HMTL para a classe UsuarioFisico
    login.setEmail(request.getParameter("email"));
    login.setSenha(request.getParameter("senha"));
    login.setFkidCpf(request.getParameter("cpf"));
    
    //se o email já está sendo utilizado no cadastro fisico ou juridico não faz cadastro
    if(pf.alterarDados() && login.alterarUsuario()) {
        request.getSession().setAttribute("resultado", "CadastroAlterado");
        response.sendRedirect("procurarpadaria.jsp");     
    //se não der certo
    }else{
        request.getSession().setAttribute("resultado", "CadastroNaoAlterado");
        response.sendRedirect("alterarusuariofisico.jsp");
    }
%>  