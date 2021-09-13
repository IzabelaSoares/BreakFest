/* 
 * Página de Referência: Cadastrar, Consultar e Alterar Cadastro Pessoa Fisica
 * Dependencias: JSON
 * Desenvolvido por: Izabela Maria Alves Soares
 * Documentado por: Izabela Maria Alves Soares
 * Data da ultima Revisão: 13/09/2021 
 */

/*Script com Regex e JSON para validação de dados digitados pelo usuário */

//Preparar os parametros para receberem mascaras
function mascara(objeto, mascara) {
    obj = objeto;
    masc = mascara;
    setTimeout("mascaraEx()", 1);
}
function mascaraEx() {
    obj.value = masc(obj.value);
}

//Ler a pagina e aplica as mascaras automaticamente
window.onload = function () {
    id('nome').onkeyup = function () {
        mascara(this, mNOME);
    };
    id('sobrenome').onkeyup = function () {
        mascara(this, mNOME);
    };
    id('telefone').onkeyup = function () {
        mascara(this, mContato);
    };
    id('cpf').onkeyup = function () {
        mascara(this, mCPF);
    };
    id('cep').onkeyup = function () {
        mascara(this, mCEP);
    };
    id('numero').onkeyup = function () {
        mascara(this, mNumero);
    };
    id('senha').onkeyup = function () {
        check();
    };
    id('checksenha').onkeyup = function () {
        check();
    };   
    id ('nascimento').onkeyup = verificarData();    
};
//Função para receber a id dos campos
function id(nomeId) {
    return document.getElementById(nomeId);
}

/*Aplicar as Mascaras*/

//Nome e Sobrenome
function mNOME(nome) {
    nome = nome.replace(/[^a-zÀ-ú\s]/gi,""); //Remove caracteres especiais
    nome = nome.replace(/^(.)|\s+(.)/g, c => c.toUpperCase()); //Garante que a primeira letra de cada palavra será maiuscula
    return nome;
}
//Cpf
function mCPF(cpf) {
    cpf = cpf.replace(/\D/g, ""); //remove tudo o que não é digito
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); //Coloca ponto após os três primeiros digitos
    cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2"); //Coloca ponto após os seis primeiros digitos
    cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2"); //Coloca traço antes dos dois ultimos digitos
    return cpf;
}
//Senha
var check = function () {
    if (document.getElementById('senha').value === document.getElementById('checksenha').value) {
        document.getElementById('alertPassword').style.color = '#8CC63E';
        document.getElementById('alertPassword').innerHTML = 'Senhas Iguais!</span>';
    } else {
        document.getElementById('alertPassword').style.color = '#EE2B39';
        document.getElementById('alertPassword').innerHTML = 'Senhas Diferentes!</span>';
    }
};
//Telefone
function mContato(contato) {
    contato = contato.replace(/\D/g, ""); //Remove tudo o que não é dígito
    contato = contato.replace(/^(\d{2})(\d)/g, "($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
    contato = contato.replace(/(\d)(\d{4})$/, "$1-$2"); //Coloca hífen entre o quarto e o quinto dígitos
    return contato;
}
//Cep
function mCEP(cep) {
    cep = cep.replace(/\D/g, ""); //Remove tudo o que não é dígito
    cep = cep.replace(/^(\d{2})(\d)/, "$1.$2"); //Coloca ponto após os dois primeiros digitos
    cep = cep.replace(/\.(\d{3})(\d)/, ".$1-$2"); //Coloca o traço antes dos dois ultimos caracteres
    return cep;
}
//Numero
function mNumero(num) {
    num = num.replace(/\D/g, ""); //Remove tudo o que não é dígito
    return num;
}

/*Verifica o cep e Retorna os Valores*/

//Limpa valores do formulário de cep.
function clearCep() {
    document.getElementById('rua').value = ("");
    document.getElementById('bairro').value = ("");
    document.getElementById('cidade').value = ("");
    document.getElementById('estado').value = ("");
}

//Verifica se o cep existe
function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('rua').value = (conteudo.logradouro);
        document.getElementById('bairro').value = (conteudo.bairro);
        document.getElementById('cidade').value = (conteudo.localidade);
        document.getElementById('estado').value = (conteudo.uf);
    } else { //CEP não Encontrado.            
        clearCep();
        alert("CEP não encontrado!");
    }
}

//Pesquisar o cep
function pesquisacep(valor) {
    //Remove tudo o que não for numero
    var cep = valor.replace(/\D/g, '');
    //Verifica se há dado informado
    if (cep !== "") {
        //Preenche os campos com "..." enquanto consulta webservice.
        document.getElementById('rua').value = "...";
        document.getElementById('bairro').value = "...";
        document.getElementById('cidade').value = "...";
        document.getElementById('estado').value = "...";

        //Cria um elemento javascript.
        var script = document.createElement('script');
        //Sincroniza com o callback e passa os dados para no documento
        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
        document.body.appendChild(script);
    } else {
        clearCep(); //cep sem valor, limpa formulário.
    }
};

//Impedir o usuário de digitar uma data futura de nascimento
function verificarData(){
    
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1; //Janeiro é 0 então precisamos só adicionar 1 para janeiro ser mês 1!
  var yyyy = today.getFullYear();
  if(dd<10){
    dd='0'+dd;
  } 
  if(mm<10){
    mm='0'+mm;
  } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("nascimento").setAttribute("max", today);
}
