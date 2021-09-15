<%-- 
    Document   : recebealterarproduto
    Created on : 15/09/2021, 13:54:50
    Author     : Maria
--%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.Cartao"%>
<%  //Instancia o Produto = prdt
    Produto prdt = new Produto();
    
    //Instancia o PessoaJuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    //Pega o cnpj do usuario
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    
    //Pegar os valores dos produtos
    Integer id = 0;
    String titulo = String.valueOf(request.getSession().getAttribute("titulo"));
    Integer codProduto = Integer.parseInt(String.valueOf(request.getSession().getAttribute("codigoproduto")));
    String categoria = String.valueOf(request.getSession().getAttribute("categoria"));
    String tamanho = String.valueOf(request.getSession().getAttribute("tamanho"));
    String unidadeMedida = String.valueOf(request.getSession().getAttribute("unidadeMedida"));
    String descricao = String.valueOf(request.getSession().getAttribute("descricao"));
    Float preco = Float.parseFloat(String.valueOf(request.getSession().getAttribute("preco")));
    String imagem = String.valueOf(request.getSession().getAttribute("imagem"));

    //passar os valores para a classe
    prdt.setTitulo(titulo);
    prdt.setCodProduto(codProduto);
    prdt.setCategoria(categoria);
    prdt.setFkCnpj(fkcnpj);
    prdt.setDescricao(descricao);
    prdt.setPreco(preco);
    prdt.setTamanho(tamanho);
    prdt.setUnidadeDeMedida(unidadeMedida);
    prdt.setImagem(imagem);
    prdt.setIdProduto(id);
    
    //se cadastrar produto
    if (prdt.alterarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect("consultarmeusprodutos.jsp");
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect("consultarmeusprodutos.jsp");
    }
%>