<%-- 
    Author     : Ricardo e Izabela
--%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaFisica"%>
<%  //instancia a pessoa física = PF
    PessoaFisica pf = new PessoaFisica();

    //recebe os valores da tela HTML
    pf.setNome(request.getParameter("nome"));
    pf.setSobrenome(request.getParameter("sobrenome"));
    pf.setCpf(request.getParameter("cpf"));
    pf.setDataNascimento(Date.valueOf(request.getParameter("nascimento")));
    pf.setEmail(request.getParameter("email"));
    pf.setCelular(request.getParameter("telefone"));
    pf.setCep(request.getParameter("cep"));
    pf.setEstado(request.getParameter("UF"));
    pf.setCidade(request.getParameter("cidade"));
    pf.setBairro(request.getParameter("bairro"));
    pf.setRua(request.getParameter("rua"));
    pf.setNumero(Integer.parseInt(request.getParameter("numero")));
    pf.setComplemento(request.getParameter("complemento"));

    //instanciar o login da = PF
    UsuarioFisico login = new UsuarioFisico();

    //Passar valores da tela e cadastrar o usuário
    login.setEmail(request.getParameter("email"));
    login.setSenha(request.getParameter("senha"));

    //se cadastrar pessoa e o login dela
    if (pf.cadastrarConta() && login.cadastrarUsuario()) {
        response.sendRedirect("cadastrofisico.jsp?pmensagem=Cliente-salvo-com-sucesso");
    } else {
        response.sendRedirect("cadastrofisico.jsp?pmensagem=Problemas-ao-editar-cliente");
    }
%>        


