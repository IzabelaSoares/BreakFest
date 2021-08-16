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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>

        <!-- JS for bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

        <link href="styles/preferenciapagamento.css" rel="stylesheet">
        <script src="scripts/preferencia-de-pagamento.js"></script>

        <%
            Banco lista = new Banco();
            List<Banco> listabanco = lista.consultarGeral();
        %>

    </head>
    <body>
        <div class="center-div">
            <div class="row setup-content" id="step-5">
                <div class="col-xs-12">
                    <div class="col-md-12">
                        <h3>Como deseja receber seu pagamento?</h3>
                        <label>Escolha uma opção</label> <br/>
                        <form action="recebe-dados/recebepagamento.jsp" method="post" >
                            <select id="pagamento" name="pagamento" onchange="formaPagamento()">
                                <option value="NA" selected=""></option>
                                <option value="pix">Pix</option>
                                <option value="deposito">Depósito Bancário</option>
                            </select>
                            <br/> <br/><br/><br/>
                            <div id="pix-pagamento" class="payment" style="display:none">           
                                <div class="form-group owner">
                                    <label for="pix_metodo">Escolha sua Chave Pix</label><br>
                                    <select name="fktipochave" id="pix_metodo" onchange="chavePix()">
                                        <option value="NA" selected=""></option>
                                        <option value="cnpj">CNPJ</option>
                                        <option value="email">Email</option>
                                        <option value="telefone">Telefone</option>
                                    </select>
                                </div>
                                <div id="cnpj-pagamento" class="form-group"style="display:none">
                                    <label for="chave-cnpj">Informe seu CNPJ</label>
                                    <input type="text" name="chave-cnpj" class="form-control" id="chave-cnpj">
                                </div>
                                <div id="email-pagamento" class="form-group"style="display:none">
                                    <label for="chave-email">Informe seu Email</label>
                                    <input type="text" class="form-control" name="chave-email" id="chave-email">
                                </div>
                                <div id="telefone-pagamento" class="form-group"style="display:none">
                                    <label for="chave-telefone">Informe seu Telefone</label>
                                    <input type="text" class="form-control" name="chave-telefone" id="chave-telefone">
                                </div>
                            </div>  


                            <div id="deposito-pagamento" class ="payment" style="display:none">
                                <div class="form-group">
                                    <label for="conta-cnpj">Informe o CNPJ</label>
                                    <input type="text" class="form-control" id="conta-cnpj"> 
                                </div>
                                <div class="form-group" id="accttype">
                                    <label>Banco</label> <br/>
                                    <select name="tipo-banco" id="accounttype">
                                        <option value=""> </option>
                                        <% for (Banco bancos : listabanco) { %>  
                                        <option value="<% out.write(String.valueOf(bancos.getNumero()));%>">
                                            <% out.write(String.valueOf(bancos.getNumero() + " | " + bancos.getBanco())); %>
                                        </option>
                                        <%}%>
                                    </select><br/>
                                </div>
                                <div class="form-group">
                                    <label for="conta-bancaria">Conta Bancaria</label>
                                    <input type="text" class="form-control" id="conta-bancaria"> 
                                </div>
                                <div class="form-group" id="accttype">
                                    <label>Tipo da Conta</label> <br/>
                                    <select name="tipo-conta" id="accounttype">
                                        <option value=""> </option>
                                        <option value="poupanca">Poupança</option>
                                        <option value="corrente">Corrente</option>
                                    </select> <br/> </div>
                                <div class="form-group">
                                    <label for="agencia">Agência</label>
                                    <input type="text" class="form-control" id="agencia"> </div>
                                <div class="form-group">
                                    <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br/>
                                    <select name="dia" id="dia">
                                        <option value=""></option>
                                        <option value="10"> 05</option>
                                        <option value="10"> 10</option>
                                        <option value="25"> 25</option>
                                    </select> 
                                    </form>
                                </div>
                            </div>        
                            <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Salvar</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
