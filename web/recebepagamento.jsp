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
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    //verificar a opção de recebimento de pagamento
    String tipoPagto = request.getParameter("pagamento");

    if (tipoPagto.contains("pix")) {
        //verifica os valores da chave
        String cnpj = request.getParameter("chave-cnpj");
        String email = request.getParameter("chave-email");
        String telefone = request.getParameter("chave-telefone");

        //instancia o pix = pix
        Pix pix = new Pix();

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

        //se cadastrar pessoa e o login dela
        if (pix.cadastrarPix()) {
            request.getSession().setAttribute("resultado", "PreferenciaSalva");
            //verificar se já possui midias cadastradas
            if (pj.verificaSociais(fkemail)) {
                response.sendRedirect("alterarusuariojuridico.jsp");
                //se não, redireciona para o index
            } else {
                request.getSession().setAttribute("resultado", "SucessoLogin");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        } else {
            request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
            response.sendRedirect("alterarusuariojuridico.jsp");
        }
    } else {
        //instancia o depósito = dep  
        Deposito dep = new Deposito();

        //recebe os valores da tela HTML
        dep.setFkCnpj(request.getParameter("cnpj"));
        dep.setConta(request.getParameter("banco"));
        dep.setBanco(request.getParameter("conta"));
        dep.setTipoConta(request.getParameter("tipo-conta"));
        dep.setAgencia(request.getParameter("agencia"));
        dep.setDataPagto(request.getParameter("dia"));

        //se cadastrar pessoa e o login dela
        if (dep.cadastrarDeposito()) {
            request.getSession().setAttribute("resultado", "PreferenciaSalva");
            //verificar se já possui midias cadastradas
            if (pj.verificaSociais(fkemail)) {
                response.sendRedirect("alterarusuariojuridico.jsp");
                //se não, redireciona para o index
            } else {
                request.getSession().setAttribute("resultado", "SucessoLogin");
                response.sendRedirect("alterarusuariojuridico.jsp");
            }
        } else {
            request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
            response.sendRedirect("alterarusuariojuridico.jsp");
        }
    }
%>


