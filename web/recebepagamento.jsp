<%-- 
    Document   : recebepagamento
    Created on : 16/08/2021, 04:40:57
    Author     : Izabela e Maria Clara
--%>
<%@page import="dominio.Pix"%>
<%@page import="dominio.Deposito"%>
<%
    //verificar a opção de recebimento de pagamento
    String tipoPagto = request.getParameter("pagamento");

    if (tipoPagto == "pix") {
        //verifica os valores da chave
        String cnpj = request.getParameter("chave-cnpj");
        String email = request.getParameter("chave-email");
        String telefone = request.getParameter("chave-telefone");

        //instancia o pix = pix
        Pix pix = new Pix();

        //recebe os valores da tela HTML
        pix.setFkTipoChave(request.getParameter("fktipochave"));

        //Passa a chave correta
        if (cnpj != "") {
            pix.setChave(cnpj);
        } else if (email != "") {
            pix.setChave(email);
        } else if (telefone != "") {
            pix.setChave(telefone);
        }

        pix.setNome(request.getParameter("nome"));

        //se cadastrar pessoa e o login dela
        if (pix.cadastrarPix()) {
            request.getSession().setAttribute("resultado", "PreferenciaSalva");
            response.sendRedirect("perfil.jsp");
        } else {
            request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
            response.sendRedirect("perfil.jsp");
        }
    } else {
        //instancia o depósito = dep  
        Deposito dep = new Deposito();

        //recebe os valores da tela HTML
        dep.setFkCnpj(request.getParameter("conta-cnpj"));
        dep.setConta(request.getParameter("tipo-banco"));
        dep.setBanco(request.getParameter("conta-bancaria"));
        dep.setAgencia(request.getParameter("agencia"));
        dep.setDataPagto(request.getParameter("dia"));

        //se cadastrar pessoa e o login dela
        if (dep.cadastrarDeposito()) {
            request.getSession().setAttribute("resultado", "PreferenciaSalva");
            response.sendRedirect("perfil.jsp");
        } else {
            request.getSession().setAttribute("resultado", "PreferenciaNaoSalva");
            response.sendRedirect("preferenciapagamento.jsp");
        }
    }
%>


