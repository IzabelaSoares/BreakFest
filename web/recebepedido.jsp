<%-- 
    Document   : recebepedido
    Created on : 05/09/2021, 14:17:20
    Author     : Izabela e Maria
--%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dominio.Cartao"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dominio.Pedido"%>
<%@page import="dominio.PessoaFisica"%>
<% request.setCharacterEncoding("UTF-8");
    //Dados de Padaria e Cliente
    String fkcnpj = request.getParameter("fkcnpj");
    String fkcpf = request.getParameter("fkcpf");

    //Recorrencia, Status e DiaSemana
    Boolean recorrencia = Boolean.parseBoolean(request.getParameter("recorrencia"));
    String status = "Pagamento Aprovado";
    String dias = request.getParameter("dias");

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
    Time horaEmissao = Time.valueOf(dtf.format(LocalTime.now()));

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

    if (produto != "") {
        //Produto para Array
        String s = produto.substring(0, produto.length() - 2) + "";
        String z = s.substring(1);
        String[] produtoArray = z.split(",");

        //Preco para Array
        String h = preco.substring(0, preco.length() - 2) + "";
        String j = h.substring(1);
        String[] precoArray = j.split(",");

        //Quantidade para Array
        String x = quantidade.substring(0, quantidade.length() - 2) + "";
        String r = x.substring(1);
        String[] quantidadeArray = r.split(",");

        //variáveis de auxílio para recorrência
        int diasemana = 0;
        String diaSemana = null;

        //Total da Compra
        Double totalCompra = 0.00;
        for (int i = 0; i < precoArray.length; i++) {
            int quant = Integer.valueOf(quantidadeArray[i]);
            double precoUn = Double.valueOf(precoArray[i]);
            totalCompra += (precoUn * quant);
        }

        //Instanciar Pedido
        Pedido novo = new Pedido();
        String obs = request.getParameter("observacao");
        if (obs == null) {
            obs = "";
        }

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
        novo.setTotalCompra(totalCompra);
        novo.setHoraEmissao(horaEmissao);
        novo.setObservacao(obs);

        //instancia cartão
        Cartao card = new Cartao();

        //se tem cartão cadastrado, continua o pedido
        if (card.verificaDados(fkcpf)) {
            //verifica se há recorrencia
            if (recorrencia) {
                //setar os dados para a tabela de diasemana
                String horaPedido = String.valueOf(request.getParameter("horario"));
                Time hora = Time.valueOf(horaPedido + ":00");
                novo.setHora(hora);

                //COMEÇA A EXECUTAR A REPETIÇÃO
                //separa os dias da semana em um array
                String semana = dias;
                List<String> dia = new ArrayList<>(Arrays.asList(semana.split(",")));
                for (int d = 0; d < dia.size(); d++) {
                    //verifica o dia da semana para gerar a nova data
                    if (dia.get(d).contains("Segunda")) {
                        diasemana = 1;
                        diaSemana = "Segunda";
                    } else if (dia.get(d).contains("Terça")) {
                        diasemana = 2;
                        diaSemana = "Terça";
                    } else if (dia.get(d).contains("Quarta")) {
                        diasemana = 3;
                        diaSemana = "Quarta";
                    } else if (dia.get(d).contains("Quinta")) {
                        diasemana = 4;
                        diaSemana = "Quinta";
                    } else if (dia.get(d).contains("Sexta")) {
                        diasemana = 5;
                        diaSemana = "Sexta";
                    } else if (dia.get(d).contains("Sábado")) {
                        diasemana = 6;
                        diaSemana = "Sábado";
                    }

                    Date novaData = novo.novaData(Date.valueOf(dataPedido), diasemana, hora);

                    //passa o parametro para cadastrar o pedido
                    novo.setDataPedido(novaData);
                    novo.setObservacao("Este pedido possui recorrência para " + dias.replace(",", ", ")
                            + ", com horário à ser emitido às: " + hora + ". OBS:\n" + obs);

                    if (novo.cadastrarPedido()) {
                        //Instanciar pedido
                        Pedido produtos = new Pedido();

                        //Dados para Coluna de produtospedidos
                        Integer fkPedido = produtos.consultarIdPedido();

                        //passa o parametro para cadastrar o dia da semana
                        novo.setDia(diaSemana);
                        novo.setFkPedido(fkPedido);

                        //cadastra o pedido e o dia da semana
                        novo.cadastrarDiaSemana();

                        //Total de Cada Item
                        Double precoTotal = 0.00;

                        //Inserir os Produtos na Tabela de Produto
                        for (int i = 0; i < produtoArray.length; i++) {
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
                    }
                }
                response.sendRedirect("consultarpedidofisico.jsp");
            } else {
                dias = null;
                if (dias == null) {
                    switch (novo.verificaDiaSemana()) {
                        case 1:
                            novo.setDia("Segunda");
                            break;
                        case 2:
                            novo.setDia("Terça");
                            break;
                        case 3:
                            novo.setDia("Quarta");
                            break;
                        case 4:
                            novo.setDia("Quinta");
                            break;
                        case 5:
                            novo.setDia("Sexta");
                            break;
                        case 6:
                            novo.setDia("Sábado");
                            break;
                    }

                    if (novo.cadastrarPedido()) {
                        //Instanciar pedido
                        Pedido produtos = new Pedido();

                        //Dados para Coluna de produtospedidos
                        Integer fkPedido = produtos.consultarIdPedido();

                        //passa o parametro para cadastrar o dia da semana
                        novo.setFkPedido(fkPedido);
                        novo.setHora(horaEmissao);

                        //cadastra o pedido e o dia da semana
                        novo.cadastrarDiaSemana();

                        //Total de Cada Item
                        Double precoTotal = 0.00;

                        //Inserir os Produtos na Tabela de Produto
                        for (int i = 0; i < produtoArray.length; i++) {
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

                        request.getSession().setAttribute("resultado", "PedidoCadastrado");
                        response.sendRedirect("consultarpedidofisico.jsp");
                    } else {
                        response.sendRedirect("consultarpedidofisico.jsp");
                    }
                }
            }
        } else {
            request.getSession().setAttribute("fkcnpj", fkcnpj);
            request.getSession().setAttribute("resultado", "NecessitaCartao");
            response.sendRedirect("produtospadariacomprar.jsp");
        }

    } else {
        request.getSession().setAttribute("fkcnpj", fkcnpj);
        request.getSession().setAttribute("resultado", "CarrinhoVazio");
        response.sendRedirect("produtospadariacomprar.jsp");
    }
%>
