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
  <title>CodePen - Browse button in bootstrap 4 with select image preview</title>
  <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css'>
  <link rel="stylesheet" href="styles/cadastro-produto.css">

</head>
<body>
    <!-- Inicio divs de container -->
    <div class="container">
        <!--  <form> -->
        <div class="row">
            <div class="input-group mb-3">

                <!-- Inicio divs do produto -->
                <h2>Cadastrar Produto</h2>
                <!-- Titulo Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="first">Titulo do Produto</label>
                        <input type="text" class="form-control" id="first" placeholder="Café Preto sem açúcar">
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
                        <label for="phone">Tamanho (ou medida)</label>
                        <input type="tel" class="form-control" id="phone" placeholder="500">
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
                    <input type="text" class="form-control" placeholder="5,99">
                </div>
                <!-- Descrição do Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="descricao">Descrição do Produto</label>
                        <textarea id="descricao" class="form-control" aria-label="With textarea"></textarea>
                    </div>
                </div>
                <!-- Selecionar a Imagem  -->
                <label>Selecione uma imagem quadrada para o seu produto</label>
                <div class="input-group mb-3">
                    <div id="msg"></div>
                    <form method="post" id="image-form">
                        <input type="file" name="img[]" class="file" accept="image/*">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" disabled placeholder="Upload File" id="file">
                            <div class="input-group-append">
                                <button type="button" class="browse btn btn-primary">Browse...</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="ml-2 col-sm-6">
                    <img src="https://placehold.it/80x80" id="preview" class="img-thumbnail">
                </div>
                <!-- Fim divs do produto -->
            </div>
        </div>
        <!--  </form> -->
    </div>
    <!-- Fim divs de container -->
 
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
    <script src="scripts/cadastro-produto.js"></script>

</body>
</html>
