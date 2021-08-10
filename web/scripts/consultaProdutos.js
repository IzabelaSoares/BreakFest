const img = 'https://www.guarida.com.br/_assets/ckfinder/images/maria%20do%20a%C3%A7a%C3%AD.jpg';

const vh = $(document).height();

// $('.detalhes .conteudo').css('height', vh);

$('ul').on('click', 'li:not(.detalhes)', function() {
  // document.documentElement.webkitRequestFullScreen();
  $('body').css({'overflow':'hidden'});
  $(this).addClass('detalhes');
  $('.detalhes .conteudo').wrap('<div class="capsula"></div>');
  $('#detalhes, .mais').removeClass('ocultar');
  $('#qtd').text(1);
  $('#detalhes').animate({opacity: 1});
});

$('#fechar').click(function() {
  $('body').css({'overflow':'visible'});
  $('.detalhes .conteudo').unwrap();
  $('li.detalhes').removeClass('detalhes');
  $('#detalhes, .mais').addClass('ocultar');
  $('#detalhes').animate({opacity: 0});
});

$('#qtd-mais').click(function() {
  let qtd = parseInt($('#qtd').text());
  $('#qtd').text(qtd + 1);
  $('#qtd-menos').removeClass('disable');
});
$('#qtd-menos').click(function() {
  let qtd = parseInt($('#qtd').text());
  if (qtd>1) {
      $('#qtd').text(qtd - 1);
      if(qtd===2) $('#qtd-menos').addClass('disable');
  }
});
















var i=0;
while(i<20) {
  $('ul').append(`<li>
    <div class="foto">
      <img src="https://www.guarida.com.br/_assets/ckfinder/images/maria%20do%20a%C3%A7a%C3%AD.jpg">
    </div>
    <div class="conteudo">
      <span class="preco">R$9,00</span>
      <p class="titulo">Açaí</p>
      <p class="descricao">Açaí vários sabores... Açaí vários sabores... Açaí vários sabores... Açaí vários sabores... Açaí vários sabores...</p>
      <div class="mais ocultar">
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fuga itaque, et aliquam placeat dolor repudiandae est aspernatur nesciunt quibusdam neque vero ipsa pariatur perferendis. Fugiat ut voluptate in dolore cupiditate!</p>
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
  </li>`);
  i++;
}


