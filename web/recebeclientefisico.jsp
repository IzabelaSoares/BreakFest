<%-- 
    Documento       : recebeclientefisico
    Desenvolvido por: Maria Clara Peron, Ricardo Schvanbach e Izabela Soares
    Documentado por : Maria Clara Peron
--%>
<%@page import="dominio.Cartao"%>
<%@page import="dominio.UsuarioFisico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaFisica"%>
<%  request.setCharacterEncoding("UTF-8");

    //instancia a pessoa física = PF
    PessoaFisica pf = new PessoaFisica();
    
    //instanciar o login da = PF
    UsuarioFisico login = new UsuarioFisico();
    
    //variáveis mais utilizadas
    String email = request.getParameter("email");
    String cnpj = request.getParameter("cnpj");
    
    //se o email já está sendo utilizado no cadastro fisico ou juridico
    if(login.verificaExistencia(email) || pf.verificaExistenciaJuridica(email)){
        //email já está sendo utilizado
        request.getSession().setAttribute("resultado", "EmailJaRegistrado");
        response.sendRedirect("cadastrofisico.jsp");
    //se o cpf já está sendo utilizado
    }else if(pf.verificaExistenciaCpf(cnpj)){
        //cpf já está sendo utilizado
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
        
        //Passar valores da tela e cadastrar o usuário
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


