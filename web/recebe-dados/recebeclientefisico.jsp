<%-- 
    Author     : Ricardo, Izabela e Maria
--%>
<%@page import="dominio.Cartao"%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaFisica"%>
<%  //instancia a pessoa f�sica = PF
    PessoaFisica pf = new PessoaFisica();
    
    //instanciar o login da = PF
    UsuarioFisico login = new UsuarioFisico();
    
    //se o email j� est� sendo utilizado no cadastro fisico ou juridico n�o faz cadastro
    if(login.verificaExistencia(request.getParameter("email")) && pf.verificaExistenciaJuridica(request.getParameter("email"))){
        //email j� est� sendo utilizado
        request.getSession().setAttribute("resultado", "EmailJaRegistrado");
        response.sendRedirect("cadastrofisico.jsp");
    //se o cpf j� est� sendo utilizado n�o faz cadastro
    }else if(pf.verificaExistenciaCpf(request.getParameter("cpf"))){
        //cpf j� est� sendo utilizado
        request.getSession().setAttribute("resultado", "CpfJaRegistrado");
        response.sendRedirect("cadastrofisico.jsp");
    }else{
        //recebe os valores da tela HTML
        pf.setNome(request.getParameter("nome"));
        pf.setSobrenome(request.getParameter("sobrenome"));
        pf.setCpf(request.getParameter("cpf"));
        pf.setDataNascimento(Date.valueOf(request.getParameter("nascimento")));
        pf.setEmail(request.getParameter("email"));
        pf.setCelular(request.getParameter("telefone"));
        pf.setCep(request.getParameter("cep"));
        pf.setEstado(request.getParameter("estado"));
        pf.setCidade(request.getParameter("cidade"));
        pf.setBairro(request.getParameter("bairro"));
        pf.setRua(request.getParameter("rua"));
        pf.setNumero(Integer.parseInt(request.getParameter("numero")));
        pf.setComplemento(request.getParameter("complemento"));

        //Passar valores da tela e cadastrar o usu�rio
        login.setFkidCpf(request.getParameter("cpf"));
        login.setEmail(request.getParameter("email"));
        login.setSenha(request.getParameter("senha"));

        //se cadastrar pessoa e o login dela
        if (pf.cadastrarConta() && login.cadastrarUsuario()) { 
            //cadastro efetuado com sucesso
            request.getSession().setAttribute("resultado", "UsuarioCadastrado");
            response.sendRedirect("login.jsp");     
        } else {
            //erro no cadastro
            request.getSession().setAttribute("resultado", "UsuarioNaoCadastrado");
            response.sendRedirect("cadastrofisico.jsp");
        }
    }
%>        


