<%-- 
    Documento       : recebeprodutospardra
    Desenvolvido por: Maria Clara Peron e Izabela Soares
    Documentado por : Maria Clara Peron
--%> 
<%@page import="java.sql.Array"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="java.util.*"%>
<%@page import="dominio.Produto"%>
<%@page import="java.util.Arrays" %>
<%  //instancia o produto = prdt
    Produto prdt = new Produto();
    
    //instancia o pessoajuridica = pj
    PessoaJuridica pj = new PessoaJuridica();
    
    //pega o email e procura o cnpj
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(fkemail);
    
    boolean result = false;
    
    //se a lista de produtos para importar estiver vazia
    if(request.getParameter("produtosteste") != ""){
        /*Array*/
        String produtosteste = request.getParameter("produtosteste");
        String[] recebeIds = produtosteste.split(",");

        //loop com os IDs dos produtos selecionados
        for(int i = 0; i < recebeIds.length; i++) {
            int id = Integer.parseInt(recebeIds[i]);
            result = prdt.consultarId(id, cnpj);
        }

        //se o último insert de produto padrão der certo
        if (result){
            response.sendRedirect("consultarmeusprodutos.jsp");
        }else{
            response.sendRedirect("produtospadrao.jsp");
        }
    }else{
        request.getSession().setAttribute("resultado", "SemProdutos");
        response.sendRedirect("produtospadrao.jsp");
    }
%>
