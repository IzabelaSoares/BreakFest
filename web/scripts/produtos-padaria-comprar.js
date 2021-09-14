/* global idproduto, cardArray */
/* 
 * Página de Referência: Comprar Produtos
 * Dependencias: JSON e Biblioteca JQuery do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script de Carrinho de Compras da Padaria*/

function recorrenciaPedido() {
    var recorrencia = document.getElementById("recorrencia");
    var div = document.getElementById("dados-recorrencia");
    div.style.display = recorrencia.value == "true" ? "block" : "none";
}

var shoppingCart = (function () {
    //Array do carrinho
    cart = [];
    //Construtor (Nome, Preço e Quantidade)
    function Item(name, price, count) {
        this.name = name;
        this.price = price;
        this.count = count;
    }
    //Salvar carrinho de compras em formato JSON
    function saveCart() {
        sessionStorage.setItem('shoppingCart', JSON.stringify(cart));
    }
    //Carregar dados do carrinho de compras
    function loadCart() {
        cart = JSON.parse(sessionStorage.getItem('shoppingCart'));
    }
    if (sessionStorage.getItem("shoppingCart") != null) {
        loadCart();
    }
    //Lista
    var obj = {};

    //Adicionar produtos ao carrinho conforme nome, preço e quantidade
    obj.addItemToCart = function (name, price, count) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart[item].count++;
                saveCart();
                return;
            }
        }
        var item = new Item(name, price, count);
        cart.push(item);
        saveCart();
    }
    //Setar a quantidade conforme o nome do item
    obj.setCountForItem = function (name, count) {
        for (var i in cart) {
            if (cart[i].name === name) {
                cart[i].count = count;
                break;
            }
        }
    };
    //Remover o item do carrinho
    obj.removeItemFromCart = function (name) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart[item].count--;
                if (cart[item].count === 0) {
                    cart.splice(item, 1);
                }
                break;
            }
        }
        saveCart();
    }

    //Remover todos os itens do carrinho
    obj.removeItemFromCartAll = function (name) {
        for (var item in cart) {
            if (cart[item].name === name) {
                cart.splice(item, 1);
                break;
            }
        }
        saveCart();
    }

    //Limpar o carrinho
    obj.clearCart = function () {
        cart = [];
        saveCart();
    }

    //Contar quantidade de produtos do carrinho
    obj.totalCount = function () {
        var totalCount = 0;
        for (var item in cart) {
            totalCount += cart[item].count;
        }
        return totalCount;
    }

    //Valor total do produto com sua quantidade
    obj.totalCart = function () {
        var totalCart = 0;
        for (var item in cart) {
            totalCart += cart[item].price * cart[item].count;
        }
        return Number(totalCart.toFixed(2));
    }

    //Formar a lista do carrinho com preço total de tudo
    obj.listCart = function () {
        var cartCopy = [];
        for (i in cart) {
            item = cart[i];
            itemCopy = {};
            for (p in item) {
                itemCopy[p] = item[p];

            }
            itemCopy.total = Number(item.price * item.count).toFixed(2);
            cartCopy.push(itemCopy)
        }
        return cartCopy;
    }

    // cart : Array
    // Item : Object/Class
    // addItemToCart : Function
    // removeItemFromCart : Function
    // removeItemFromCartAll : Function
    // clearCart : Function
    // countCart : Function
    // totalCart : Function
    // listCart : Function
    // saveCart : Function
    // loadCart : Function
    return obj;
})();

/*Eventos */

// Adicionar item
$('.add-to-cart').click(function (event) {
    event.preventDefault();
    var name = $(this).data('name');
    var price = Number($(this).data('price'));
    shoppingCart.addItemToCart(name, price, 1);
    displayCart();
});

//Remover items
$('.clear-cart').click(function () {
    shoppingCart.clearCart();
    displayCart();
});

//mostrar no modal de compras
function displayCart() {
    //variaveis para o backend
    var produto = "";
    var quantidade = "";
    var precoUn = "";
    //variaveis para o frontend
    var cartArray = shoppingCart.listCart();
    var output = "";
    for (var i in cartArray) {
        //dados para o backend
        produto += cartArray[i].name + ",";
        quantidade += cartArray[i].count + ",";
        precoUn += cartArray[i].price + ",";
        //converter dados de ponto para virgula
        let preco = cartArray[i].price.toFixed(2);  
        preco = preco.toString().replace(".", ",");
        let ptotal = cartArray[i].total
        ptotal = ptotal.toString().replace(".", ",");
        //tablerow com todos os dados para o usuário
        output += "<div><tr style='margin-top: 0'>"
                + "<td style='width:200px'>" + cartArray[i].name + "</td>"
                + "<td style='width:150px'> R$ " + preco + "</td>"
                + "<td style='width:100px'> " + cartArray[i].count + " un </td>"
                + "<td style='width:150px'> R$ " + ptotal + "</td>"
                + "<td style='width:100px; height:50px'><button class='delete-item btn btn-danger btn-sm' data-name=" + cartArray[i].name + ">X</button></td>"
                + "</tr></div>";
    }
    //dados para o front end
    $('.show-cart').html(output); //aqui lança os dados na tabela html
    $('.total-cart').html(shoppingCart.totalCart().toFixed(2).toString().replace(".", ",")); //aqui marca total do preço
    $('.total-count').html(shoppingCart.totalCount().toString().replace(".", ","));//aqui marca a quantidade de produto
    
    //dados para o back end em formato JSON
    document.getElementById("produtos").value = JSON.stringify(produto);
    document.getElementById("quantidade").value = JSON.stringify(quantidade);
    document.getElementById("preco-unitario").value = JSON.stringify(precoUn);
}

//Botão de Deletar o Item
$('.show-cart').on("click", ".delete-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.removeItemFromCartAll(name);
    displayCart();
})


//Botão de remover -1 na quantidade do produto
$('.show-cart').on("click", ".minus-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.removeItemFromCart(name);
    displayCart();
})
//Botão de adicionar +1 na quantidade do produto
$('.show-cart').on("click", ".plus-item", function (event) {
    var name = $(this).data('name')
    shoppingCart.addItemToCart(name);
    displayCart();
})
//Input de contar o item do produto
$('.show-cart').on("change", ".item-count", function (event) {
    var name = $(this).data('name');
    var count = Number($(this).val());
    shoppingCart.setCountForItem(name, count);
    displayCart();
});

//Executar a função de mostrar os dados no modal de compras
displayCart();


/* OUTPUT ORIGINAL ANTIGO
 * output += "<tr>"
 + "<td>" + cartArray[i].name + "</td>"
 + "<td>" + cartArray[i].price + "</td>"
 + "<td><div class='input-group'><button class='minus-item input-group-addon btn btn-primary' data-name=" + cartArray[i].name + ">-</button>"
 + "<input type='number' class='item-count form-control' data-name='" + cartArray[i].name + "' value='" + cartArray[i].count + "'>"
 + "<button class='plus-item btn btn-primary input-group-addon' data-name=" + cartArray[i].name + ">+</button></div></td>"
 + "<td><button class='delete-item btn btn-danger' data-name=" + cartArray[i].name + ">X</button></td>"
 + " = "
 + "<td>" + cartArray[i].total + "</td>"
 + "</tr>";
 * 
 */
