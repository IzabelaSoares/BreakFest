/* 
 * Página de Referência: Todas as que possuem navbar do usuário
 * Dependencias: Biblioteca JQuery do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares e Ricardo Natal Schvambach
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/* Script para o menu de opções para usuário fisico e usuário juridico*/

$(document).ready(function(){
  $('#dropDown').click(function(event){
    $('.drop-down').toggleClass('drop-down--active');
    event.stopPropagation();
  });

  $(document).click(function(event) {
    	if (!$(event.target).hasClass('drop-down--active')) {
      		$(".drop-down").removeClass("drop-down--active");
    	}
  	});
});
