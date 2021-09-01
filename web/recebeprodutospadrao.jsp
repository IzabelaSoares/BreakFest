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
    
    String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
    String cnpj = pj.procuraCnpj(fkemail);
    
    /*teste do array*/
    String produtosteste = request.getParameter("produtosteste");
    String[] recebeIds = produtosteste.split(",");
    
    String[] pTeste = recebeIds;
   /*fim teste array*/
    
    for(int i = 0; i < recebeIds.length; i++) {
        int id = Integer.parseInt(recebeIds[i]);
        if (prdt.consultarId(id, cnpj)){
            
        }else {
            //alert que não deu certo
            request.getSession().setAttribute("resultado", "ProdutoNaoCadastrado");
            response.sendRedirect("produtospadrao.jsp");

        }
    }
    
%>
