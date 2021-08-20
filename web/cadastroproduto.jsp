<%-- 
    Document   : cadastroproduto
    Created on : 18/08/2021, 03:18:21
    Author     : Izabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Break Fest</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css'>
  <link rel="stylesheet" href="styles/cadastro-produto.css">
  <link href="styles/util.css" rel="stylesheet">

</head>
<body>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="index.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
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
    
    <!-- Inicio divs de container -->
    <div class="container">
        <!--  <form> -->
        <form action="recebecadastrodeproduto.jsp" method="post">
        <div class="row">
            <div class="input-group mb-3">
                <!-- Inicio divs do produto -->
                <h2>Cadastrar Produto</h2>
                <!-- Titulo Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="first">Produto</label>
                        <input style="height:39px; width:216px;" type="text" class="form-control" id="first" placeholder="EX: Café">
                    </div>
                </div>
                <!-- Categoria   -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="categoria">Categoria do Produto</label>
                        <select class="form-control" id="categoria" name="categoria">
                            <option value="NA" selected disabled hidden>Doces, Salgados, Bebidas..</option>
                            <option value="codigojava">Puxar do Banco de Dados</option>
                        </select>
                    </div>
                </div>
                <!-- Tamanho  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="phone">Tamanho/Medida</label>
                        <input style="height:39px; width:216px;" type="tel" class="form-control" id="phone" placeholder="EX: Uma xícara de 60 ml">
                    </div>
                </div>
                <!-- Unidade de Medida  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="categoria">Unidade de Medida</label>
                        <select class="form-control" id="categoria" name="categoria">
                            <option value="NA" selected disabled hidden>Litros, Gramas, Quilos..</option>
                            <option value="codigojava">Puxar do Banco de Dados</option>
                        </select>
                    </div>
                </div>
                <!-- Preço do Produto  -->
                <label>Preço do Produto</label>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">R$</span>
                    </div>
                    <input style="height:39px; width:170px;" type="text" placeholder="2,99">
                </div>
                <!-- Descrição do Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="descricao">Descrição do Produto</label>
                        <textarea style="height:70px; width:212px;" id="descricao" class="form-control" aria-label="With textarea" placeholder="EX: Café Preto sem açúcar"></textarea>
                    </div>
                </div>
                <!-- Selecionar a Imagem  -->
                <label>Selecione uma imagem quadrada para o seu produto</label>
                <div class="input-group mb-3">
                    <div id="msg"></div>
                    <form method="post" id="image-form">
                        <input type="file" name="img[]" class="file" accept="image/*">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" disabled placeholder="Escolher Foto" id="file">
                            <div class="input-group-append">
                                <button type="button" class="browse btn btn-primary">Procurar</button>
                            </div>
                        </div>
                </div>
                <div class="ml-2 col-sm-6">
                    <div id="prod-pic"><img src="" id="preview" class="img-thumbnail"></div> 
                </div>
                <!-- Fim divs do produto -->
                 <button type="submit">Enviar</button>
            </div>
        </div>
        <!--  </form> -->
        </form>
    </div>
    <!-- Fim divs de container -->
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
    <script src="scripts/cadastro-produto.js"></script>
</body>
</html>
