<%-- 
    Document   : recebepedido
    Created on : 05/09/2021, 14:17:20
    Author     : Izabela
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.Pedido"%>
<%@page import="dominio.PessoaFisica"%>
<%
    //Dados de Padaria e Cliente
    String fkcnpj = request.getParameter("fkcnpj");
    String fkcpf = request.getParameter("fkcpf");
    
    //Recorrencia e Status
    Boolean recorrencia = false;
    String status = "PAGAMENTO APROVADO";
    
    //Data do Pedido
    Date dataAtual = new Date(System.currentTimeMillis()); 
    SimpleDateFormat formatarDate = new SimpleDateFormat("yyyy-MM-dd"); 
    String dataPedido = formatarDate.format(dataAtual);
    
    //Instanciar Pessoa Fisica 
    PessoaFisica pf = new PessoaFisica();
    pf = pf.consultarConta(fkcpf);
    
    //Pegar os Dados de Endereço
    String cep = pf.getCep();
    String uf = pf.getEstado();
    String cidade = pf.getCidade();
    String bairro = pf.getBairro();
    String rua = pf.getRua();
    Integer numero = pf.getNumero();
    String complemento = pf.getComplemento();
    
    //JSON 
    String produto = request.getParameter("produtos");
    String preco = request.getParameter("preco-unitario");
    String quantidade = request.getParameter("quantidade");
  
    //Produto para Array
    String s = produto.substring(0, produto.length()-2) + "";
    String z = s.substring(1);    
    String[] produtoArray = z.split(",");
    
    //Preco para Array
    String h = preco.substring(0, preco.length()-2) + "";
    String j = h.substring(1);    
    String[] precoArray = j.split(",");

       
    //Quantidade para Array
    String x = quantidade.substring(0, quantidade.length()-2) + "";
    String r = x.substring(1);    
    String[] quantidadeArray = r.split(",");

    
    //Total da Compra
    Double totalCompra = 0.00;
    for(int i = 0; i < precoArray.length; i++){
        int quant = Integer.valueOf(quantidadeArray[i]);
        double precoUn = Double.valueOf(precoArray[i]);
        totalCompra += (precoUn * quant);
    }
    
    //Instanciar Pedido
    Pedido novo =  new Pedido();
    
    //setar os dados para tabela pedido
    novo.setFkCpf(fkcpf);
    novo.setFkCnpj(fkcnpj);
    novo.setDataPedido(Date.valueOf(dataPedido));
    novo.setStatus(status);
    novo.setRecorrencia(recorrencia);
    novo.setCep(cep);
    novo.setEstado(uf);
    novo.setCidade(cidade);
    novo.setBairro(bairro);
    novo.setRua(rua);
    novo.setNumero(numero);
    novo.setComplemento(complemento);
    novo.setObservacao("testando");
    novo.setTotalCompra(totalCompra);
    
    
    if(novo.cadastrarPedido()){       
        //Instanciar pedido
        Pedido produtos = new Pedido();
        
        //Dados para Coluna de produtospedidos
        Integer fkPedido = produtos.consultarIdPedido();
        
        //Total de Cada Item
        Double precoTotal = 0.00;
        
        //Inserir os Produtos na Tabela de Produto
        for(int i = 0; i < produtoArray.length; i++){
            //Dados para tabela produtos pedido
            produtos.setIdPedido(fkPedido);
            produtos.setProduto(produtoArray[i]);
            produtos.setPrecoUn(Double.valueOf(precoArray[i]));
            produtos.setQuantidade(Integer.valueOf(quantidadeArray[i]));
            //calcular o preço total de cada item
            int quant = Integer.valueOf(quantidadeArray[i]);
            double precoUn = Double.valueOf(precoArray[i]);
            precoTotal = (quant * precoUn);
            produtos.setPrecoTotal(precoTotal);
            
            //inserir no database
            produtos.cadastrarProdutosPedido();
        }
        
        out.write("DEUS É MARAVILHOSO!!!!");
        
    }
    else{
        out.write("A VITÓRIA VAI CHEGAR!!");
    }
    
    
%>
