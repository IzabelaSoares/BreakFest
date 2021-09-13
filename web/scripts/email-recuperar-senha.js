/* 
 * Página de Referência: login.jsp
 * Dependencias: Biblioteca Sweet Alert do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/* Script para enviar ao usuário email com a recuperação de senha */
function recuperarSenha() {
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
