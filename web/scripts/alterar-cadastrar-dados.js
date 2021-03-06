/* 
 * Página de Referência: Consultar Pedidos Fisico e Juridico
 * Dependencias: --
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 15/09/2021 
 */

/*Scripts para interatividade entre alterar e cadastrar alguns dados em modais*/

function acionar(parametro) {
    document.getElementById('custId').value = parametro
    document.theForm.submit();
}
//Alterar ou Cadastrar Frete
function alterarFrete(bairro) {
    document.getElementById('bairros').value = bairro;
    var cadastro = document.getElementById("divfrete");
    cadastro.style.display = "block";    
}

//Resetar Cadastro e Alteração de Frete
function resetarFrete(){
    var cadastro = document.getElementById("divfrete");
    cadastro.style.display = "none";
}

//Alterar ou Cadastrar uma Preferencia de Pagamento
function preferenciaPagamento() {
    var dados = document.getElementById("dadospagamento");
    var cadastro = document.getElementById("divpagamento");
    cadastro.style.display = "block";
    dados.style.display = "none";
}

//Ocultar o Cadastramento de uma Nova Preferencia
function resetarPagamento() {
    var dados = document.getElementById("dadospagamento");
    var cadastro = document.getElementById("divpagamento");
    cadastro.style.display = "none";
    dados.style.display = "block";

    //além do reset ele verifica se há dados registrados
    var verificar = document.getElementById("verificarNumero").value;
    var numero = document.getElementById("dadoscard");
    var btnAlterar = document.getElementById("btnAlterar");
    var btnAdd = document.getElementById("btnAdicionar");

    //Verifica se tem dados cadastrados
    if (verificar == " Sem dados de Pagamento") {
        numero.style.color = "#f03e3d";
        btnAlterar.style.display = "none";
        btnAdd.style.display = "block";
    }
}

//Alterar ou Cadastrar um Novo Cartão de Crédito
function cartaoCredito() {
    var dados = document.getElementById("dadoscartao");
    var cadastro = document.getElementById("divcartao");
    cadastro.style.display = "block";
    dados.style.display = "none";
}

//Ocultar o Cadastramento de um Novo Cartão de Crédito
function resetar() {
    var dados = document.getElementById("dadoscartao");
    var cadastro = document.getElementById("divcartao");
    cadastro.style.display = "none";
    dados.style.display = "block";

    //além do reset ele verifica se há dados registrados
    var verificar = document.getElementById("verificarNumero").value;
    var numero = document.getElementById("dadoscard");
    var btnAlterar = document.getElementById("btnAlterar");
    var btnAdd = document.getElementById("btnAdicionar");

    //Verifica se tem dados cadastrados
    if (verificar == "Sem Dados Cadastrados") {
        numero.style.color = "#f03e3d";
        btnAlterar.style.display = "none";
        btnAdd.style.display = "block";
    }


}
