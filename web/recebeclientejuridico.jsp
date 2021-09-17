<%-- 
    Document   : recebeclientejuridico
    Created on : 06/08/2021, 14:11:58
    Author     : Maria
--%>
<%@page import="dominio.BairrosFrete"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dominio.UsuarioJuridico"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.PessoaJuridica"%>
<html>
<%  request.setCharacterEncoding("UTF-8");

    //instancia a pessoa física = PF
    PessoaJuridica pj = new PessoaJuridica();
    
    //instanciar o login da = PJ
    UsuarioJuridico login = new UsuarioJuridico();
    
    //variáveis mais utilizadas
    String email = request.getParameter("email");
    String cnpj = request.getParameter("cnpj").replaceAll("[^0-9]+", "");
        
    //se o email já existir no banco de dados
    if(login.verificaExistencia(email) || pj.verificaExistenciaFisica(email)){
        //email já está sendo utilizado
        request.getSession().setAttribute("resultado", "EmailJaRegistrado");
        response.sendRedirect("cadastrojuridico.jsp");
    //se o cnpj já for cadastrado
    }else if(pj.verificaExistenciaCnpj(cnpj)){
        //email já está sendo utilizado
        request.getSession().setAttribute("resultado", "CnpjJaRegistrado");
        response.sendRedirect("login.jsp");
    }else{
        //recebe os valores da tela HTML
        pj.setRazaoSocial(request.getParameter("razaosocial"));
        pj.setNomeFantasia(request.getParameter("nomefantasia"));
        pj.setCnpj(cnpj);
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
        login.setFkCnpj(cnpj);
        login.setSenha(request.getParameter("senha"));

        //se cadastrar pessoa e o login dela
        if (pj.cadastrarConta() && login.cadastrarUsuario()) {
            //instancia a classe bairros frete = bf
            BairrosFrete bf = new BairrosFrete();
            
            //transforma os bairros em um array
            String bairro = request.getParameter("bairros");
            List<String> bairros = new ArrayList<>(Arrays.asList(bairro.split(", ")));
            
            //cria um loop que percorre os bairros e os cadastra
            for(int i=0; i < bairros.size(); i++){
                //passa os parâmetros para a classe BairroFrete
                bf.setFkCnpj(cnpj);
                bf.setBairroAtendimento(bairros.get(i));
                bf.setFrete(0);
                
                //cadastra bairro e frete
                bf.cadastrarBairroFrete();
            }
            
            request.getSession().setAttribute("resultado", "UsuarioCadastrado");
            response.sendRedirect("login.jsp");
        } else {
            //erro no cadastro
            request.getSession().setAttribute("resultado", "UsuarioNaoCadastrado");
            response.sendRedirect("login.jsp");
        }
    }
%>