/* 
 * Páginas de Referência: Consultar Pedido
 * Dependencias: AJAX e JSON 
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script para barra de pesquisa nos pedidos*/
window.onload = function () {
    //chamar modal de pedido
    $('#modalPedido').modal('show');
    //barra de pesquisa
    $("#search").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#table tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
};
function acionar(parametro) {
    document.getElementById('custId').value = parametro
    document.theForm.submit();
}


                