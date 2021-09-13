/* 
 * Página de Referência: Importar Produtos
 * Dependencias: Biblioteca JQuery do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Scripts para apresentação dos produtos à serem importados pela pessoa juridica*/

//Função para o checkbox do tableheader selecionar todos os checkbox do tabledata
function checkAll(o) {
  var boxes = document.getElementsByTagName("input");
  for (var x = 0; x < boxes.length; x++) {
    var obj = boxes[x];
    if (obj.type === "checkbox") {
      if (obj.name !== "check")
        obj.checked = o.checked;
    }
  }
}
//Função para o search (barra de pesquisa) da pagina procurar os produtos
window.onload = function() {
    $("#search").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $("#table tr").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
}

//Função para importar produtos selecionados para portifólio do cliente
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
