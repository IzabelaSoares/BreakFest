/* global fetch, form */

let idproduto = [];
/*let descricao = [];*/

function importar() {
    document.querySelectorAll('.importar-produto').forEach(function (elemento) {
        if (elemento.checked === true) {
            idproduto.push(elemento.getAttribute("data-id"));
            /* descricao.push(elemento.getAttribute("data-descricao"));*/
        }
    });  
    document.getElementById("produtos-teste").value = idproduto;
     /*JSON.stringify(idproduto);*/
}
