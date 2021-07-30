<!-- Tela de cadastro físico, criada por: Ricardo
Feito os inputs de endereço e informações necessárias posto no mesmo lugar, separadaos
por dois lado pelo fato de ser mais simples.

Página sem Navbar e sem footer de dúvidas pois é uma simples tela de cadastro.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Título e imports -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pessoa</title>
        <script src="scripts/validacaoDados.js"></script>
        
        <link href="styles/cadastro.css" rel="stylesheet">
        <link href="styles/util.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="index.html>"<img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
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
    <body class="form-v10">
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="recebefisico.jsp" method="post" id="myform">
                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>
                        <!-- Dois inputs seguidos "Nome e Sobrenome"-->
                        <div class="form-group">
                            <!-- Input do nome -->
                            <div class="form-row form-row-1">
                                <input type="text" name="nome" id="first_name" class="input-text" placeholder="Nome" required>
                            </div>
                            <!-- Input do sobrenome -->
                            <div class="form-row form-row-2">
                                <input type="text" name="sobrenome" id="last_name" class="input-text" placeholder="Sobrenome" required>
                            </div>
                        </div>
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        <!-- Input da data de nascimento -->
                        <div class="form-row">
                            <input type="date" name="nascimento" class="company" id="company" placeholder="Data de nasciento"required>
                        </div>
                        <!-- Dois inputs seguidos "CPF e Telefone" -->
                        <div class="form-group">
                            <!-- Input do CPF -->
                            <div class="form-row form-row-3">
                                <input type="text" name="cpf" class="business" id="business" placeholder="CPF" required maxlength="14">
                            </div>
                            <!-- Input do telefone -->
                            <div class="form-row form-row-3">
                                <input type="text" name="telefone" id="telefone" placeholder="Telefone">
                            </div>
                        </div>
                        <!-- Input da senha -->
                        <div class="form-row">
                            <input type="text" name="senha" placeholder="Senha" >
                        </div>
                    </div>
                    <!-- Fim do lado esquerdo do form -->
                    <!-- Início do lado direito do form -->
                    <div class="form-right">
                        <h2>Endereço</h2>
                        <!-- Form group para o input do CEP não ficar gigante. -->
                        <div class="form-group">
                            <!-- input do CEP -->
                            <div class="form-row form-row-4">
                                <input type="text" name="cep" class="zip" id="zip" placeholder="CEP" required maxlength="9">
                            </div>
                        </div>
                        <!-- Select com os estados do Brasil -->
                        <div class="form-row form-row-2">
                            <select name="estado">
                                <option value="acre">Acre</option>
                                <option value="alagoas">Alagoas</option>
                                <option value="amapa">Amapá</option>
                                <option value="amazonas">Amazonas</option>
                                <option value="bahia">Bahia</option>
                                <option value="ceara">Ceará</option>
                                <option value="distritofederal">Distrito Federal</option>
                                <option value="espiritosanto">Espírito Santo</option>
                                <option value="goias">Goiás</option>
                                <option value="maranhao">Maranhão</option>
                                <option value="matogrosso">Mato Grosso</option>
                                <option value="matogrossodosul">Mato Grosso do Sul</option>
                                <option value="minasgerais">Minas Gerais</option>
                                <option value="para">Pará</option>
                                <option value="paraiba">Paraíba</option>
                                <option value="parana">Paraná</option>
                                <option value="pernambuco">Pernambuco</option>
                                <option value="piaui">Piauí</option>
                                <option value="riodejaneiro">Rio de Janeiro</option>
                                <option value="riograndedonorte">Rio Grande do Norte</option>
                                <option value="riograndedosul">Rio Grande do Sul</option>
                                <option value="rondonia">Rondônia</option>
                                <option value="roraima">Roraima</option>
                                <option value="santacatarina">Santa Catarina</option>
                                <option value="saopaulo">São Paulo</option>
                                <option value="sergipe">Sergipe</option>
                                <option value="tocantins">Tocantis</option>   
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        <!-- Input da cidade-->
                        <div class="form-row">
                            <input type="text" name="cidade" placeholder="Cidade" required>
                        </div>  
                        <!-- Form group para o número da casa e a rua ficarem um ao lado do outro -->
                        <div class="form-group">
                            <!-- Input do número da casa -->
                            <div class="form-row form-row-1">
                                <input type="text" name="nr"  placeholder="Nr." required>
                            </div>
                            <!-- Input da rua -->
                            <div class="form-row form-row-2">
                                <input type="text" name="rua" placeholder="Rua" required>
                            </div>
                        </div>
                        <!-- Input do complemento -->
                        <div class="form-row">
                            <input type="text" name="comp" placeholder="Complemento (opcional)">
                        </div>
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            <input type="submit" name="cadastrar" class="register" value="Cadastrar">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>