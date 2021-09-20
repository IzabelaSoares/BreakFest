<%-- 
    Document   : recebepagamento
    Created on : 16/08/2021, 04:40:57
    Author     : Izabela e Maria Clara
--%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Pix"%>
<%@page import="dominio.Deposito"%>
<%
    //instanciar a pessoa juridica
    PessoaJuridica pj = new PessoaJuridica();
    
    //instancia o pix = pix
    Pix pix = new Pix();
    
    //instancia o depósito = dep  
    Deposito dep = new Deposito();
    
    //pega o email e procura o cnpj
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    
    //verificar a opção de recebimento de pagamento
    String tipoPagto = request.getParameter("pagamento");
    String at = null;
    
    //verifica se o usuário já possui algum tipo de pagamento cadastrado para saber 
    //se é necessário um insert ou update no banco
    if (pix.verificaDados(fkemail) == false && dep.verificaDados(fkemail) == false){
        at = "insert";
    }else{
        at = "update";
    }
    
    //se for pix
    if (tipoPagto.contains("pix")) {
        //verifica os valores da chave
        String cnpj = request.getParameter("chave-cnpj");
        String email = request.getParameter("chave-email");
        String telefone = request.getParameter("chave-telefone");

        //recebe os valores da tela HTML
        pix.setFkCnpj(fkcnpj);
        pix.setFkTipoChave(request.getParameter("fktipochave"));

        //Passa a chave correta
        if (cnpj != "") {
            pix.setChave(cnpj);
        } else if (email != "") {
            pix.setChave(email);
        } else if (telefone != "") {
            pix.setChave(telefone);
        }
        
        //se for insert
        if (at == "insert"){
            //verifica se já tem depósito cadastrado, se sim ele deleta
            if(dep.verificaDados(fkemail)){
                dep.setFkCnpj(fkcnpj);
                dep.excluirDeposito();
            }
            
            //se cadastrar pix
            if (pix.cadastrarPix()) {
                request.getSession().setAttribute("resultado", "PreferenciaSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            } else {
                request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        }else{
            //se alterar pix
            pix.setFkCnpj(fkcnpj);
            if (pix.alterarpix()) {
                request.getSession().setAttribute("resultado", "PreferenciaSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            } else {
                request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        }
    //se for depósito
    } else {
        //recebe os valores da tela HTML
        dep.setFkCnpj(request.getParameter("cnpj"));
        dep.setConta(request.getParameter("banco"));
        dep.setBanco(request.getParameter("conta"));
        dep.setTipoConta(request.getParameter("tipo-conta"));
        dep.setAgencia(request.getParameter("agencia"));
        dep.setDataPagto(request.getParameter("dia"));

        //se for insert
        if(at == "insert"){
            //verifica se já tem pix cadastrado, se sim ele deleta
            if(pix.verificaDados(fkemail)){
                pix.setFkCnpj(fkcnpj);
                pix.excluirPix();
            }
            
            //se cadastrar depósito
            if (dep.cadastrarDeposito()) {
                request.getSession().setAttribute("resultado", "PreferenciaSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            } else {
                //erro no cadastro
                request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        }else{
            //se alterar depósito
            dep.setFkCnpj(fkcnpj);
            if (dep.alterarDeposito()) {
                request.getSession().setAttribute("resultado", "PreferenciaSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            } else {
                //erro no cadastro
                request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        }
    }
%>


