<%-- 
    Document   : recebecadastrodeproduto
    Created on : 19/08/2021, 13:56:42
    Author     : Maria
--%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.Produto"%>
<%@page import="dominio.Cartao"%>
<%  
    //instancia o produto = prdt
    Produto prdt = new Produto();
    
    PessoaJuridica pj = new PessoaJuridica();
    
    //pegar o cnpj do usuario
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    
    //pegar os valores dos produtos
    String titulo = String.valueOf(request.getSession().getAttribute("titulo"));
    String categoria = String.valueOf(request.getSession().getAttribute("categoria"));
    String tamanho = String.valueOf(request.getSession().getAttribute("tamanho"));
    String unidadeMedida = String.valueOf(request.getSession().getAttribute("unidadeMedida"));
    String descricao = String.valueOf(request.getSession().getAttribute("descricao"));
    Float preco = Float.parseFloat(String.valueOf(request.getSession().getAttribute("preco")));
    String imagem = String.valueOf(request.getSession().getAttribute("imagem"));
    
    //passar para a classe
    prdt.setTitulo(titulo);
    prdt.setCategoria(categoria);
    prdt.setFkCnpj(fkcnpj);
    prdt.setDescricao(descricao);
    prdt.setPreco(preco);
    prdt.setTamanho(tamanho);
    prdt.setUnidadeDeMedida(unidadeMedida);
    prdt.setImagem(imagem);
    
    //se cadastrar cartao
    if (prdt.cadastrarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect("perfil.jsp");
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect("cadastroproduto.jsp");
    }
%> 