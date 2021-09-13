/* 
 * Página de Referência: Importar e Consultar Produtos (modal de cadastro de produto)
 * Dependencias: Biblioteca JQuery do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares e Jefferson Teixeira
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script para preview do produto antes do envio do formulário*/

//função para o onclick capturar o arquivo
$(document).on("click", ".browse", function() {
  var file = $(this).parents().find(".file");
  file.trigger("click");
});

//função para receber o input de arquivo
$('input[type="file"]').change(function(e) {
  //recebe o arquivo e armazena em uma variavel
  var fileName = e.target.files[0].name;
  $("#file").val(fileName);
  //variavel e função para ler a váriavel como arquvio
  var reader = new FileReader();
  reader.onload = function(e) {
    //transmitir o preview da imagem no HTML
    document.getElementById("preview").src = e.target.result;
  };
  //lê o url da imagem para armazenar no value do input
  reader.readAsDataURL(this.files[0]);
});