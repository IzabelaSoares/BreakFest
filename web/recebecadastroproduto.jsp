<%-- 
    Document   : recebecadastrodeproduto
    Created on : 19/08/2021, 13:56:42
    Author     : Maria
--%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.Cartao"%>
<%  //instancia o produto = prdt
    Produto prdt = new Produto();

    //recebe os valores da tela HTML
    prdt.setTitulo(request.getParameter("titulo"));
    prdt.setCategoria(request.getParameter("categoria"));
    prdt.setFkCnpj(request.getParameter("fkcpf"));
    prdt.setDescricao(request.getParameter("descricao"));
    prdt.setPreco(Float.parseFloat(request.getParameter("preco")));
    prdt.setTamanho(request.getParameter("tamanho"));
    prdt.setUnidadeDeMedida(request.getParameter("unidadedemedida"));
    prdt.setPeso(Float.parseFloat(request.getParameter("peso")));

    //se cadastrar cartao
    if (prdt.cadastrarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect("perfil.jsp");
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect("cadastrodeproduto.jsp");
    }
%> 