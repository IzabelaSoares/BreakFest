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
    if(verificar == "Sem Dados Cadastrados"){
        numero.style.color = "#f03e3d";
        btnAlterar.style.display = "none";
        btnAdd.style.display = "block";
    }
    
    
}
