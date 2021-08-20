<%-- 
    Document   : recebecadastrodeproduto
    Created on : 19/08/2021, 13:56:42
    Author     : Maria
--%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.Cartao"%>
<%  //instancia o produto = prdt
    Produto prdt = new Produto();
    
    PessoaJuridica pj = new PessoaJuridica();

    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    
    //recebe os valores da tela HTML
    prdt.setTitulo(request.getParameter("titulo"));
    prdt.setCategoria(request.getParameter("categoria"));
    prdt.setFkCnpj(fkcnpj);
    prdt.setDescricao(request.getParameter("descricao"));
    prdt.setPreco(Float.parseFloat(request.getParameter("preco")));
    prdt.setTamanho(request.getParameter("tamanho"));
    prdt.setUnidadeDeMedida(request.getParameter("unidadedemedida"));

    //se cadastrar cartao
    if (prdt.cadastrarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect("perfil.jsp");
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect("cadastroproduto.jsp");
    }
%> 