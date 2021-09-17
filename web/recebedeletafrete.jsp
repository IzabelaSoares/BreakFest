<%-- 
    Document   : recebedeletafrete
    Created on : 17/09/2021, 14:36:48
    Author     : Maria
--%>
<%@page import="java.util.*"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page import="dominio.BairrosFrete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//instancia Produto = pdrt
    BairrosFrete bf = new BairrosFrete();
    
    int id = Integer.parseInt(request.getParameter("id"));
    bf.setId(id);
    String bairroDeletar = bf.consultaBairroID(id);
    
    if(bf.deletarBairroFrete()){
        //transforma os bairros em um array
        PessoaJuridica pj = new PessoaJuridica();
        
        //pega o email e procura o cnpj
        String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
        String cnpj = pj.procuraCnpj(fkemail);
        
        //consulta a lista de bairros e coloca em um Arraylist
        String bairros = pj.consultaListaBairros(cnpj);
        List<String> bairro = new ArrayList<>(Arrays.asList(bairros.split(", ")));

        //loop para percorer a lista de bairros e deletar quando encontrar o que acabou de ser deletado
        for(int i=0; i < bairro.size(); i++){
            if(bairro.get(i).contains(bairroDeletar)){
                bairro.remove(i);
            }
        }
        
        String novaLista = "";
        //loop para criar uma nova lista de bairros
        for(int i=0; i < bairro.size(); i++){
            novaLista += bairro.get(i);
            if(i < bairro.size()){
                novaLista += ", ";
            }
        }
        
        novaLista = novaLista.substring(0, novaLista.length() - 2) + "";
        
        
        //passa a novaLista e o cnpj para a classe PessoaJuridica
        pj.setBairros(novaLista);
        pj.setCnpj(cnpj);
        
        //cadastra nova lista de bairros
        if(pj.cadastrarBairros()){
            response.sendRedirect("consultarpedidojuridico.jsp");
        }else{
            response.sendRedirect("consultarpedidojuridico.jsp");
        }
    }else{
        response.sendRedirect("consultarpedidojuridico.jsp");
    }
    
%>
