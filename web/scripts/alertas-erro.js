/* 
 * Página de Referência: todas as páginas jsp e html
 * Dependencias: Biblioteca Sweet Alert do Javascript
 * Desenvolvido por: Izabela Maria Alves Soares e Maria Clara Peron
 * Documentado por: Izabela Maria Alves Soares e Maria Clara Peron
 * Data da ultima Revisão: 12/09/2021 
 */

/* Script para alertar o usuário sobre alguma situação positiva negativa ou informativa */

function alertar(parametro) {
    //Sucesso ao logar
    if (parametro === "SucessoLogin") {
        Swal.fire({
            title: 'Bem vindo de volta!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao logar
    else if (parametro === "ProblemaLogar") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'Email ou senha incorretos!'
        });
    }    
    //Sucesso ao cadastrar
    else if (parametro === "UsuarioCadastrado") {
        Swal.fire({
            title: 'Usuário Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
   //Erro ao cadastrar
    else if (parametro === "UsuarioNaoCadastrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'Problemas ao cadastrar!'
        });
    }  
    //Erro ao cadastrar -> CPF já existente
    else if (parametro === "CpfJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CPF já cadastrado.'
        });
    }    
    //Erro ao cadastrar -> CNPJ já existente
    else if (parametro === "CnpjJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CNPJ já cadastrado.'
        });
    }    
    //Sucesso ao alterar cadastro
    else if (parametro === "CadastroAlterado") {
        Swal.fire({
            title: 'Cadastro alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao alterar cadastro
    else if (parametro === "CadastroNaoAlterado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi poossível alterar o cadastro.'
        });
    }   
    //Erro ao cadastrar -> Email já registrado
    else if (parametro === "EmailJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Email já está sendo utilizado.'
        });
    }
    //Sucesso ao cadastrar produto
    else if (parametro === "ProdutoSalvo") {
        Swal.fire({
            title: 'Produto Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao cadastrar produto
    else if (parametro === "ProdutoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível salvar este produto.'
            });
    }    
    //Sucesso ao alterar produto
    else if (parametro === "ProdutoAlterado") {
        Swal.fire({
            title: 'Produto alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao alterar produto
    else if (parametro === "ProdutoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar este produto.'
            });
    }   
    //Sucesso ao receber dados de pagamento Pessoa Juridica
    else if (parametro === "DadosSalvos") {
        Swal.fire({
            title: 'Dados Cadastrados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao receber dados de pagamento Pessoa Juridica
    else if (parametro === "DadosNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar dados.'
            });
    }   
    //Sucesso ao alterar dados de pagamento Pessoa Juridica
    else if (parametro === "DadosAlterados") {
        Swal.fire({
            title: 'Dados alterados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao alterar dados de pagamento Pessoa Juridica
    else if (parametro === "DadosNaoAlterados") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar os dados.'
            });
    }    
    //Sucesso ao receber dados de pagamento Pessoa Fisica
    else if (parametro === "CartaoSalvo") {
        Swal.fire({
            title: 'Cartão salvo!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao receber dados de pagamento Pessoa Fisica
    else if (parametro === "CartaoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar cartão.'
            });
    }    
    //Sucesso ao alterar dados de pagamento Pessoa Fisica
    else if (parametro === "CartaoAlterado") {
        Swal.fire({
            title: 'Cartão alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao alterar dados de pagamento Pessoa Fisica
    else if (parametro === "CartaoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar seu cartão.'
            });
    }    
    //Erro ao cadastrar pedido -> Dados de pagamento não cadastrados
    else if (parametro === "NecessitaCartao") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Você precisa ter cartão de crédito cadatrado para fazer um pedido.'
            });
    }    
    //Sucesso ao solicitar recuperação de email
    else if (parametro === "EmailEnviado") {
        Swal.fire({
            icon: 'success',
            title: 'Cheque seu email!',
            text: 'Enviamos um link para recuperação de senha!'
        });
    }    
    //Erro ao solicitar recuperação de email -> Email não cadastrado
    else if (parametro === "EmailNaoExistente") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Seu email não existe no nosso sistema'
        });
    }   
    //Email recuperar senha não enviado
    else if (parametro === "EmailNaoEnviado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi possível enviar o email.'
        });
    }    
    //Sucesso ao alterar senha
    else if (parametro === "SenhaAlterada") {
        Swal.fire({
            title: 'Senha alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao alterar senha
    else if (parametro === "SenhaNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi possível alterar sua senha.'
        });
    }  
    //Sucesso ao salvar imagem
    else if (parametro === "ImagemSalva") {
        Swal.fire({
            title: 'Imagem Salva!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao salvar imagem 
    else if (parametro === "ImagemNaoSalva") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Salva',
            text: 'Por favor, verifique sua conexão!'
        });
    }
    //Sucesso ao alterar imagem
    else if (parametro === "ImagemAlterada") {
        Swal.fire({
            title: 'Imagem Alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    //Erro ao alterar imagem
     else if (parametro === "ImagemNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Alterada',
            text: 'Por favor, verifique sua conexão!'
        });
    }
    //Sucesso ao cadastrar midias
    else if (parametro === "MidiasSalva") {
        Swal.fire({
            title: 'Mídias Salvas!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }   
    //Erro ao cadastrar midias
    else if (parametro === "MidiasNaoSalva") {
        Swal.fire({
            icon: 'error',
            title: 'Mídias não Salvas',
            text: 'Por favor, verifique sua conexão!'
        });
    }    
    //Sucesso ao cadastrar pedido
    else if (parametro === "PedidoCadastrado") {
        Swal.fire({
            title: 'Pedido cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }    
    //Erro ao cadastrar pedido
    else if (parametro === "PedidoNaoCadastrado") {
        Swal.fire({
            icon: 'error',
            title: 'Pedido não salvo',
            text: 'Algo deu errado no cadastro do seu pedido.'
        });
    }
}