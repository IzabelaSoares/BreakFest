<%-- 
    Document   : cadastroproduto
    Created on : 18/08/2021, 03:18:21
    Author     : Izabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <!-- Bootstrap -->
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css'>
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
        
        <!-- Script do jquery -->
        <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
        
        <!-- Script do cloudflare -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
        
        <!-- Script do cadastro-produto -->
        <script src="scripts/cadastro-produto.js"></script>
        
        <!-- Link da página 'cadastro-produto' em css -->
        <link rel="stylesheet" href="styles/cadastro-produto.css">
  
        <!-- Link da página 'util' em css -->
        <link href="styles/util.css" rel="stylesheet">
      
        <!-- Título -->
        <meta charset="UTF-8">
        <title>Break Fest</title>
    
    </head>
    <body>
    
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="index.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2 style="color:white;"> Break Fest </h2>
        <nav>
            
            <!-- Painel padrão com as opções de Sobre nós, cadastro e login -->
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
        <form action="RecebeImagemProduto" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="input-group mb-3">
                
                <!-- Inicio divs do produto -->
                <h2>Cadastrar Produto</h2>
                <br><br>
                
                <!-- Titulo Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="first">Produto</label>
                        <input style="height:40px; width:215px; box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" type="text" class="form-control" name = "titulo" id="first" placeholder="EX: Café">
                    </div>
                </div>
                
                <!-- Categoria   -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="categoria">Categoria do Produto</label>
                        <select style="height:40px; width:215px; box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" class="form-control" id="categoria" name="categoria">
                            <option value="NA" selected disabled hidden>Doces, Salgados, Bebidas..</option>
                            <option value="doce">Doce</option>
                        </select>
                    </div>
                </div>
                
                <!-- Tamanho  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="phone">Tamanho/Medida</label>
                        <input style="height:40px; width:215px; box-shadow:none;  border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" type="tel" class="form-control" name = "tamanho" id="phone" placeholder="EX: Uma xícara de 60 ml">
                    </div>
                </div>
                
                <!-- Unidade de Medida  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="categoria">Unidade de Medida</label>
                        <select style="height:40px; width:215px; box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" class="form-control" id="categoria" name="unidadedemedida">
                            <option value="NA" selected disabled hidden>Litros, Gramas, Quilos..</option>
                            <option value="quilo">Quilo</option>
                        </select>
                    </div>
                </div>
                
                <!-- Preço do Produto  -->
                <label>Preço do Produto</label>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span style="border-style:none;" class="input-group-text">R$</span>
                    </div>
                    <input style="height:40px; width:177px; box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px; outline:none;" type="text" id="preco" name="preco" placeholder="2,99">
                </div>
                
                <!-- Descrição do Produto  -->
                <div class="input-group mb-3">
                    <div class="form-group">
                        <label for="descricao">Descrição do Produto</label>
                        <textarea style="height:80px; width:215px; box-shadow:none; border-bottom: 2px solid #995a1a; border-left: 0; border-top: 0; border-right: 0; border-radius: 2px;" name="descricao" id="descricao" class="form-control" aria-label="With textarea" placeholder="EX: Café Preto sem açúcar"></textarea>
                    </div>
                </div>
                
                <!-- Selecionar a Imagem  -->
                <label>Selecione uma imagem quadrada para o seu produto</label>
                <div class="input-group mb-3">
                    <div id="msg"></div>
                    <form method="post" id="image-form">
                        <input type="file" name="file" class="file" accept="image/*">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" disabled placeholder="Escolher Foto" id="file">
                            
                            <!-- Parte de procurar a imagem -->
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
</body>
</html>