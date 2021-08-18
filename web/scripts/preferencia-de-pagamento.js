//Ler a pagina e aplica as funcoes automaticamente

function formaPagamento() {
    var pay_method = document.getElementById("pagamento");
    var divc = document.getElementById("pix-pagamento");
    var divb = document.getElementById("deposito-pagamento");
    var botao = document.getElementById("far");
    divc.style.display = pay_method.value == "pix" ? "block" : "none";
    divb.style.display = pay_method.value == "deposito" ? "block" : "none";
    botao.style.display = pay_method.value == "deposito" ? "block" : "none";


}

function chavePix() {
    var pay_method = document.getElementById("pix_metodo");
    var diva = document.getElementById("cnpj-pagamento");
    var divb = document.getElementById("email-pagamento");
    var divc = document.getElementById("telefone-pagamento");
    var botao = document.getElementById("far");
    diva.style.display = pay_method.value == "cnpj" ? "block" : "none";
    divb.style.display = pay_method.value == "email" ? "block" : "none";
    divc.style.display = pay_method.value == "telefone" ? "block" : "none";

    if (diva.style.display = pay_method.value == "cnpj") {
        botao.style.display = pay_method.value == "cnpj" ? "block" : "none";
    } else if (diva.style.display = pay_method.value == "email") {
        botao.style.display = pay_method.value == "email" ? "block" : "none";
    } else if (diva.style.display = pay_method.value == "telefone") {
        botao.style.display = pay_method.value == "telefone" ? "block" : "none";
    }

}
