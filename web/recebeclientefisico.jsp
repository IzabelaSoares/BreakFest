<%-- 
    Document   : recebeclientefisico
    Created on : 03/08/2021, 08:25:16
    Author     : Ricardo
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Login"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaFisica"%>
        <%  //instancia a pessoa física = PF
            PessoaFisica pf = new PessoaFisica();
            
            //transformar a data para entrar no banco de dados
            SimpleDateFormat formatarDate = new SimpleDateFormat("yyyy-MM-dd");
            
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
            
            //se cadastrar a pessoa fisica
            if(pf.cadastrarConta()){
                //instanciar o login da = PF
                Login login = new Login();
                
                //Passar valores da tela e cadastrar o usuário
                login.setEmail(request.getParameter("email"));
                login.setSenha(request.getParameter("senha"));
                login.cadastarUsuario();
                
                response.sendRedirect("cadastrofisico.jsp?pmensagem=Cliente-salvo-com-sucesso");
            } else {
                response.sendRedirect("cadastrofisico.jsp?pmensagem=Problemas-ao-editar-cliente");
            }                  
        %>        


