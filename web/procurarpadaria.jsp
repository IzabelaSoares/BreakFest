<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Padarias</title>
        <link href="styles/inicial.css" rel="stylesheet">
        <link href="styles/util.css" rel="stylesheet">
    </head>
        <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <img src="imagens/cuppa-inicio.gif" alt="Cuppa">
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <!-- Fim da NavBar de cima -->
        <br>
        <div class="container">
            <img src="imagens/Padaria-Central.png" width="300px" height="250px">
            <center>
            <p>Padaria Central</p>
            <p> Localizada na rua Pedro de Queirós,</p>
            <p>especializada em pães,funcionando desde 1850,</p>
            <p>é a padaria mais velha de Mogi das Cruzes,</p>
            <p>com ótimos funcionários e extremamente qualificada para servir nossos clientes.</p>
            Confira já: </p>
            <a href="padariacentral.jsp"><button name="Checar">Checar</button></a>
            </center>
        </div>
        <br><br><br>
        <div class="container">
            <img src="imagens/pad2.jpg" width="300px" height="250px">
            <center>
            <p>Padaria do seu Zé</p>
            <p> Confeitaria extremamente refinada e os salgados mais frescos e deliciosos
                da cidade, entregamos com frete grátis para todo o estado do Rio de Janeiro,
                nota máxima em todos os delivery's, inclusive neste também. </p>
            <input type="submit" name="checa" value="Checar">
            </center>
        </div>
    </body>
</html>