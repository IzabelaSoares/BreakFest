<%-- 
    Document   : preferenciapagamento
    Created on : 11 de ago. de 2021, 14:44:57
    Author     : Ricardo e Izabela
--%>

<%@page import="java.util.List"%>
<%@page import="dominio.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pagamento</title>
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>

        <!-- JS for bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

        <!-- JS for project -->
        <link href="styles/preferenciapagamento.css" rel="stylesheet">
        <script src="scripts/preferencia-de-pagamento.js"></script>
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null); %>

        <!-- Instanciar o banco-->
        <%
            Banco lista = new Banco();
            List<Banco> listabanco = lista.consultarGeral();
        %>

    </head>
    <body onload="javascript: alertar(resultado)">
        <h3>Como deseja receber seu pagamento?</h3>

        <div class="container">

            <!-- Selecionando método de recebimento -->

            <form action="recebepagamento.jsp" method="post" >
                <select id="pagamento" name="pagamento" onchange="formaPagamento()">
                    <option value="NA" selected disabled hidden>Selecione aqui a forma de pagamento</option>
                    <option value="pix">Pix</option>
                    <option value="deposito">Depósito Bancário</option>
                </select>
                <br><br>

                <!-- PIX -->

                <div id="pix-pagamento" style="display:none">           
                    <label for="pix_metodo">Escolha sua Chave Pix</label><br>
                    <select name="fktipochave" id="pix_metodo" onchange="chavePix()">
                        <option value="NA" selected disabled hidden>Selecione a chave PIX aqui</option>
                        <option value="cnpj">CNPJ</option>
                        <option value="email">E-mail</option>
                        <option value="telefone">Telefone</option>
                    </select>
                    <br><br>

                    <!-- Input de CPNJ -->
                    <div id="cnpj-pagamento" style="display:none">
                        <label for="chave-cnpj">Informe seu CNPJ</label>
                        <input type="text" name="chave-cnpj" class="form-control" id="chave-cnpj" placeholder="Informe o CNPJ">
                    </div>
                    <!-- Input do E-mail -->
                    <div id="email-pagamento" style="display:none">
                        <label for="chave-email">Informe seu Email</label>
                        <input type="text" class="form-control" name="chave-email" id="chave-email" placeholder="Informe o E-mail">
                    </div>
                    <!-- Input do Telefone -->
                    <div id="telefone-pagamento" style="display:none">
                        <label for="chave-telefone">Informe seu Telefone</label>
                        <input type="text" class="form-control" name="chave-telefone" id="chave-telefone" placeholder="Informe o telefone">
                    </div>
                </div>  

                <!-- Depósito Bancário -->

                <!-- Input do CNPJ -->
                <div id="deposito-pagamento" style="display:none">
                    <label for="conta-cnpj">Informe o CNPJ</label>
                    <input name="cnpj" type="text" class="form-control" id="conta-cnpj" placeholder="Informe o CNPJ"> 
                    <br>
                    <!-- Input do banco -->
                    <label>Banco</label> <br/>
                    <select name="banco" id="accounttype">
                        <option value="NA" selected disabled hidden>Selecione aqui seu banco</option>
                        <% for (Banco bancos : listabanco) { %>  
                        <option value="<% out.write(String.valueOf(bancos.getNumero()));%>">
                            <% out.write(String.valueOf(bancos.getNumero() + " | " + bancos.getBanco())); %>
                        </option>
                        <%}%>
                    </select>
                    <br><br>
                    <!-- Input do número da conta -->
                    <label for="conta-bancaria">Conta Bancaria</label>
                    <input name="conta" type="text" class="form-control" id="conta-bancaria" placeholder="Informe o número da conta"> 
                    <br>

                    <!-- Input do tipo da conta -->
                    <label>Tipo da Conta</label> <br>
                    <select name="tipo-conta" id="accounttype">
                        <option value="NA" selected disabled hidden>Selecione aqui o tipo da conta</option>
                        <option value="poupanca">Poupança</option>
                        <option value="corrente">Corrente</option>
                    </select> 
                    <br><br>
                    <!-- Input do número da agência -->
                    <label for="agencia">Agência</label>
                    <input name="agencia" type="text" class="form-control" id="agencia" placeholder="Informe a agência">
                    <br>

                    <!-- Input do dia de recebimento -->
                    <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                    <select name="dia" id="dia">
                        <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                        <option value="05">Dia 05</option>
                        <option value="10">Dia 10</option>
                        <option value="25">Dia 25</option>
                    </select>
                </div>
                <!-- Botão de Submit -->
                <div id="far" style="display:none">
                    <button id="botao" type="submit">
                        <p>Enviar</p>
                        <span></span>
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>
