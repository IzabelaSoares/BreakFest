<%-- 
    Document   : cadastrodeproduto
    Created on : 17/08/2021, 16:03:03
    Author     : jefferson.teixeira
--%>
<!DOCTYPE HTML>
<html lang="br" class="cada">

<head>
<meta charset="utf-8">
<title>Break Fest</title>
<link href="styles/cadastro.css" rel="stylesheet">
<link href="styles/cadastropro.css" rel="stylesheet">
<link href="styles/util.css" rel="stylesheet">
<link href="styles/inicial.css" rel="stylesheet">
<script src="scripts/escolherfoto.js"></script>

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
    
    <div id="cada">
  <form>
    <h1>Cadastro de produto</h1>
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="first">Nome do produto:</label>
          <input type="text" class="form-control" placeholder="" id="first">
        </div>
      </div>
        
      <!-- Categoria do produto -->
      <label name="categoria">Categoria do produto:</label>
      <select name="categoria">
          <option value="categoria">Categoria</option>
          <option value="bebida">Bebida</option>
          <option value="alimentoinfantl">Alimento Infantil</option>
          <option value="carne">Carne</option>
      </select>      
    </div>
    
    <!-- Descrição do produto -->
    <div class="form-row">
      <label name="descricao">Descrição do produto:</label>
      <textarea name="descricao" id="descricao" placeholder="Descrição do produto..."></textarea>
    </div>
    </div>
    
    <!-- Preço -->
      <div class="col-md-6">
        <div class="form-group">
          <label for="phone">Preço:</label>
          <input type="preco" class="form-control" id="preco" placeholder="Preço">
        </div>
      </div>
     </div>

     <!-- Medida -->
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label for="medida">Medida</label>
          <input class="form-control" id="medida" placeholder="Medida/Tamanho">
        </div>
      </div>

      <!-- Unidade de medida do produto -->
      <label name="unimedida">Unidade de medida do produto:</label>
      <select name="unimedida">
          <option value="unimedida">Unidade de medida</option>
          <option value="ml">ML</option>
          <option value="kg">KG</option>
          <option value="un">UN</option>
      </select>   
      </div>
     
   <!-- Escolher a foto -->
   <label>Arquivo</label>
   <input type="file" id="myimg" name="file"/><br><br>

    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
</body>
</html>