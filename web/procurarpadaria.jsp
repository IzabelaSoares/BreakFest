<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Padarias</title>
        <link href="styles/util.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        <link href="styles/procurarpadaria.css" rel="stylesheet">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
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
    <section>
        <div class="container">
            <div class="padarias-container">       
                <img src="imagens/Padaria-Central.png" alt="Padaria Central">      
                <h3>Padaria Central</h3>
                <p class="parag"></p>
                <p> Localizada na rua Pedro de Queirós,</p>
                <p>especializada em pães,funcionando desde 1850,</p>
                <p>é a padaria mais velha de Mogi das Cruzes,</p>
                <p>com ótimos funcionários e extremamente </p>
                <p>qualificada para servir nossos clientes.</p>
                <p> Confira já: </p>
                <br>
                <a href="padariacentral.jsp"><button name="Checar">Checar</button></a>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="padarias-container">    
                <img src="imagens/Padaria-Multipao.png" alt="Padaria Multipão">
                <h3>Padaria Multipão</h3>
                <p>Confeitaria extremamente refinada e os salgados mais frescos e deliciosos</p>
                <p>da cidade, entregamos com frete grátis para todo o estado do Rio de Janeiro,</p>
                <p>nota máxima em todos os delivery's, inclusive neste também. </p>
                <p>Confira já:</p>
                <br>
                <a href="padariacentral.jsp"><button name="checar">Checar</button></a>
            </div>
        </div>
    </section>
</body>
</html>