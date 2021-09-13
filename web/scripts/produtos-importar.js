/* global fetch, form */
/* 
 * Página de Referência: Importar Produtos
 * Dependencias: JSON opcional
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script para importar produtos selecionados para portifólio do cliente*/
function importar() {
    let idproduto = [];
    document.querySelectorAll('.importar-produto').forEach(function (elemento) {
        if (elemento.checked === true) {
            idproduto.push(elemento.getAttribute("data-id"));
        }
    });  
    document.getElementById("produtos-teste").value = idproduto;
     //Formato JSON.stringify(idproduto);
}
