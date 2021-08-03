<%-- 
    Document   : recebeclientefisico
    Created on : 03/08/2021, 08:25:16
    Author     : Ricardo
--%>

<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
        //recebe os valores da tela HTML  
            
            String nomesobrenome = request.getParameter("nome" + "sobrenome");
            String cpf = request.getParameter("cpf");
            String login = request.getParameter("email");
            String senha = request.getParameter("senha");
            String dataNascimento = request.getParameter("nascimento");
            String email  = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String cep = request.getParameter("cep");
            String estado = request.getParameter("estado");
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String rua = request.getParameter("rua");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
          
            //instancia a pessoa física = PF
            PessoaFisica pf = new PessoaFisica();

            pf.setNome(nomesobrenome);
            pf.setCpf(cpf);
            pf.setLogin(login);
            pf.setSenha(senha);
            pf.setDataNascimento(Date.valueOf(dataNascimento));
            pf.setEmail(email);
            pf.setCelular(telefone);
            pf.setCep(cep);
            pf.setEstado(estado);
            pf.setCidade(cidade);
            pf.setBairro(bairro);
            pf.setRua(rua);
            pf.setNumero(Integer.parseInt(numero));
            pf.setComplemento(complemento);
          
            if(pf.cadastrarConta()){
                response.sendRedirect("cadastrofisico.jsp?pmensagem=Cliente-salvo-com-sucesso");
            } else {
                response.sendRedirect("cadastrofisico.jsp?pmensagem=Problemas-ao-editar-cliente");
            }          
        %>        
    </body>
</html>

