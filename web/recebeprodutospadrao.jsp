<%-- 
    Document   : recebeprodutospardra
    Created on : 23/08/2021, 13:44:57
    Author     : Maria
--%>
<%@page import="java.sql.Array"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="java.util.*"%>
<%@page import="dominio.Produto"%>
<%@page import="java.util.Arrays" %>
<%  //instancia o produto = prdt
    Produto prdt = new Produto();
    
    //instancia o produto = prdt
    PessoaJuridica pj = new PessoaJuridica();
    
    List<Produto> consulta = prdt.consultarProdutosBreakFest();
    
    /*teste do array*/
    String produtosteste = request.getParameter("produtosteste");
    String[] recebeIds = produtosteste.split(",");
    
    String[] pTeste = recebeIds;
   /*fim teste array*/
    
    
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String fkcnpj = pj.procuraCnpj(fkemail);
    String titulo = request.getParameter("titulo");
    String categoria = request.getParameter("categoria");
    String imagem = request.getParameter("imagem");
    String descricao = request.getParameter("descricao");
    String[] num1 = request.getParameterValues("descricao");
    String preco = request.getParameter("preco");
    String tamanho = request.getParameter("tamanho");
    String unidadedemedida = request.getParameter("unidadedemedida");
    
    for(Produto prod : consulta) {
        if (request.getParameter("box") != null){
            prdt.setTitulo(titulo);
            prdt.setCategoria(categoria);
            prdt.setFkCnpj(fkcnpj);
            prdt.setImagem(imagem);
            prdt.setDescricao(descricao);
            prdt.setPreco(Float.parseFloat(preco));
            prdt.setTamanho(tamanho);
            prdt.setUnidadeDeMedida(unidadedemedida);

            //se cadastrar pessoa e o login dela
            if (prdt.cadastrarProduto()){
                request.getSession().setAttribute("resultado", "ProdutoCadastrado");
                response.sendRedirect("perfil.jsp");
            }else {
                //alert que não deu certo
                request.getSession().setAttribute("resultado", "ProdutoNaoCadastrado");
                response.sendRedirect("produtospadrao.jsp");

            }
        }
    }
%>
