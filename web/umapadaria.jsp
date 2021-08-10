<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="styles/util.css" rel="stylesheet">
        <script src="scripts/consultaProdutos.js"></script>  
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@300;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        <link href="styles/padaria.css" rel="stylesheet">
        <title>Padarias</title>
    </head>
    <body>
        <!-- Barra de section -->
        <div class="pad-nome">
        <h2> Padaria das Graças </h2>
        </div>
        <ul class="lista">
            <li>
                <div class="foto">
                    <img src="imagens/Bolo-chocolate.png">
                </div>
                <div class="conteudo">
                    <span class="preco">R$45,00</span>
                    <p class="titulo">Bolo de chocolate</p>
                    <p class="descricao">Bolo de chocolate com morangos internamente.</p>
                    <div class="mais ocultar">
                        <p>Feito pela chefe Dayse Paparoto.</p>
                        <p>Peso: 1.9kg</p>
                        <p>Não recomendado para diabéticos por conter altos níveis de açucares.</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="foto">
                    <img src="http://www.mundoboaforma.com.br/wp-content/uploads/2017/03/sorvete-620x330.jpg">
                </div>
                <div class="conteudo">
                    <span class="preco">R$8,00</span>
                    <p class="titulo">Sorvete</p>
                    <p class="descricao">Sorvete vários sabores...</p>
                    <div class="mais ocultar">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga itaque, et aliquam placeat dolor repudiandae est aspernatur nesciunt quibusdam neque vero ipsa pariatur perferendis. Fugiat ut voluptate in dolore cupiditate!</p>
                    </div>
                </div>
            </li>
            <li>
                <div class="foto">
                    <img src="https://www.testapramim.com.br/wp-content/uploads/2018/02/novos-sabores-milk-shake-KFC.jpg">
                </div>
                <div class="conteudo">
                    <span class="preco">R$12,00</span>
                    <p class="titulo">Milk Shake</p>
                    <p class="descricao">Milk Shake vários sabores...</p>
                    <div class="mais ocultar">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga itaque, et aliquam placeat dolor repudiandae est aspernatur nesciunt quibusdam neque vero ipsa pariatur perferendis. Fugiat ut voluptate in dolore cupiditate!</p>
                    </div>
                </div>
            </li>
        </ul>
        <div class="ocultar" id="detalhes">
            <i class="material-icons" id="fechar">arrow_back_ios</i>
            <div class="adicionar">
                <button>ADICIONAR</button>
                <div class="quantidade">
                    <i class="material-icons disable" id="qtd-menos">remove</i>
                    <span id="qtd">1</span>
                    <i class="material-icons" id="qtd-mais">add</i>
                </div>
            </div>
        </div>
        <!-- Fim do Produto(Pastel) -->
    </body>
</html>
