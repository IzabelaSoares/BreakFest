/* 
 * Página de Referência: Recuperar Senha
 * Dependencias: --
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 15/09/2021 
 */

function recuperarSenha() {
    if (document.getElementById('senha').value === document.getElementById('checksenha').value) {
       document.theForm.submit();
    } else {
        Swal.fire({
        icon: 'error',
        title: 'Ops...',
        text: 'Você digitou duas senhas diferentes!'
    });
    }
}
