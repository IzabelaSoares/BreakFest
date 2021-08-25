function recuperarSenha(){
  Swal.fire({
    title: 'Informe seu email',
    html:
      '<form name="theForm" action="recebeemail.jsp" method="post">' +
      '<input name="email" id="swal-input1" class="swal2-input">' +
      '</form>',
    showCloseButton: true,
    focusConfirm: false,
    confirmButtonText: 'Recuperar Senha!',
  }).then((result) => {
    if (result.isConfirmed) {
      document.theForm.submit();
    }
  })

}
