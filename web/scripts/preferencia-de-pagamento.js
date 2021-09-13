/* 
 * Página de Referência: Cadastrar, Consultar e Alterar Pagamento Pessoa Juridica
 * Dependencias: --
 * Desenvolvido por: Izabela Maria Alves Soares e Ricardo Natal Schvambach
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/* Script simples de opção de forma de pagamento para usuário juridico */

//Função para escolher pix ou deposito
function formaPagamento() {
    var pay_method = document.getElementById("pagamento");
    var divc = document.getElementById("pix-pagamento");
    var divb = document.getElementById("deposito-pagamento");
    var botao = document.getElementById("far");
    divc.style.display = pay_method.value == "pix" ? "block" : "none";
    divb.style.display = pay_method.value == "deposito" ? "block" : "none";
    botao.style.display = pay_method.value == "deposito" ? "block" : "none";
}
//Função para selecionar a chave pix (cnpj, email ou telefone)
function chavePix() {
    var pay_method = document.getElementById("pix_metodo");
    var diva = document.getElementById("cnpj-pagamento");
    var divb = document.getElementById("email-pagamento");
    var divc = document.getElementById("telefone-pagamento");
    var botao = document.getElementById("far");
    diva.style.display = pay_method.value == "cnpj" ? "block" : "none";
    divb.style.display = pay_method.value == "email" ? "block" : "none";
    divc.style.display = pay_method.value == "telefone" ? "block" : "none";

    //Aparece o input conforme a opção selecionada de chave pix
    if (diva.style.display = pay_method.value == "cnpj") {
        botao.style.display = pay_method.value == "cnpj" ? "block" : "none";
    } else if (diva.style.display = pay_method.value == "email") {
        botao.style.display = pay_method.value == "email" ? "block" : "none";
    } else if (diva.style.display = pay_method.value == "telefone") {
        botao.style.display = pay_method.value == "telefone" ? "block" : "none";
    }

}
