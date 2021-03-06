<%-- 
    Documento       : recebealterarproduto
    Desenvolvido por: Maria Clara Peron
    Documentado por : Maria Clara Peron
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
    Integer id = Integer.parseInt(String.valueOf(request.getSession().getAttribute("id")));
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
    prdt.setIdProduto(id);
    
    //se a imagem foi alterada
    if (imagem == null){
        prdt.setImagem(imagem);
        //se alterara o produto e a imagem
        if(prdt.alterarProdutoEImagem()){
            request.getSession().setAttribute("resultado", "ProdutoSalvo");
            response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
        }else{
            request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
            response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
        }
    //se alterar produto
    }else if (prdt.alterarProduto()) {
        request.getSession().setAttribute("resultado", "ProdutoSalvo");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    } else {
        request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
        response.sendRedirect(String.valueOf(request.getSession().getAttribute("pagina")));
    }
%>