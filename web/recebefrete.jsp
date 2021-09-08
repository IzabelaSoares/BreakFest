<%-- 
    Document   : recebefrete
    Created on : 08/09/2021, 15:40:09
    Author     : Maria
--%>
<%@page import="java.util.*"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  //instancia a pessoa física = PF
    PessoaJuridica pj = new PessoaJuridica();
    
    //transforma os bairros em um array
    String bairro = request.getParameter("bairros");
    List<String> bairros = new ArrayList<>(Arrays.asList(bairro.split(",")));
    
    //cria um loop para adicionar os bairros de atendimento da padaria e o valor do frete
    for(int i=0; i < bairros.size(); i++){
        pj.setCnpj(request.getParameter("cnpj"));
        pj.setBairroAtendimento(bairros.get(i));
        pj.setFrete(Float.parseFloat("0"));

        pj.cadastrarBairroFrete();
    }  
%>
