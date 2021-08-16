<%-- 
    Document   : preferenciapagamento
    Created on : 11 de ago. de 2021, 14:44:57
    Author     : Ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pagamento</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link href="styles/preferenciapagamento.css" rel="stylesheet">
        <script src="preferencia-de-pagamento.js"></script>
    </head>
    <body>
        <br> 
        <form id="msform">
            <!-- Barra de progressão -->
            <ul id="progressbar">
                <li class="active">Preferência</li>
                <li>Pix</li>
                <li>Depósito</li>
            </ul>
            <!-- Selecionar forma -->
            <fieldset>
                <h2 class="fs-title">Selecione a forma de pagamento</h2>
                <br>
                <select>
                    <option value="nada" selected disabled hidden>Escolha uma opção</option>
                    <option value="pix">Pix</option>
                    <option value="deposito">Depósito Bancário</option>
                </select>
                <input type="button" name="proximo" class="next action-button" value="Próximo" />
            </fieldset>
            <fieldset>
                <!-- Pix -->
                <h2 class="fs-title">Chave Pix</h2>
                <h3 class="fs-subtitle">Escolha o seu tipo de chave pix</h3>
                <br>
                <select>
                    <option value="nada" selected disabled hidden>Escolha uma opção</option>
                    <option value="cpfoucnpj">CPJ/CNPJ</option>
                    <option value="email">E-mail</option>
                    <option value="telefone">Telefone</option>
                    <option value="aleatorio">Aleatório</option>
                </select>       
                    <input type="text" name="chave" placeholder="Insira a chave aqui">                                                          
                <input type="button" name="previous" class="previous action-button" value="Anterior" />
                <input type="button" name="next" class="next action-button" value="Próximo" />
            </fieldset>
            <!-- Depósito bancário -->
            <fieldset>
                <h2 class="fs-title">Depósito Bancário</h2>
                <h3 class="fs-subtitle">Coloque suas informações abaixo</h3>
                <input type="text" name="nome" placeholder="Nome do titular" />
                <input type="text" name="cpfoucnpj2" placeholder="CPF/CNPJ" />
                <input type="text" name="banco" placeholder="Número do banco" />
                <input type="text" name="agencia" placeholder="Agência" />
                <input type="text" name="conta" placeholder="Conta" />
                <input type="button" name="previous" class="previous action-button" value="Anterior" />
                <input type="submit" name="submit" class="submit action-button" value="Enviar" />
            </fieldset>
        </form>
        <!-- Úteis -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script><script  src="scripts/preferenciapagamento.js"></script>
    </body>
</html>
