/* global Swal */

//@Izabela e Maria

function alertar(parametro) {
    //Deu certo login
    if (parametro === "SucessoLogin") {
        Swal.fire({
            title: 'Bem vindo de volta!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Login deu certo
    else if (parametro === "ProblemaLogar") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'Email ou senha incorretos!'
        });
    }
    
    //Cadastro salvo
    else if (parametro === "UsuarioCadastrado") {
        Swal.fire({
            title: 'Usuário Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
   
   //Cadastro não cadastrado
    else if (parametro === "UsuarioNaoCadastrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'Problemas ao cadastrar!'
        });
    }
   
    //Cadastro não salvo CFP já existente
    else if (parametro === "CpfJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CPF já cadastrado.'
        });
    }
    
    //Cadastro não salvo CNPJ já existente
    else if (parametro === "CnpjJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CNPJ já cadastrado.'
        });
    }
    
    //Cadastro alterado
    else if (parametro === "CadastroAlterado") {
        Swal.fire({
            title: 'Cadastro alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
   
    //Cadastro não alterado
    else if (parametro === "CadastroNaoAlterado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi poossível alterar o cadastro.'
        });
    }
    
    //Email já está sendo utilizado
    else if (parametro === "EmailJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Email já está sendo utilizado.'
        });
    }

    
    //Produto salvo
    else if (parametro === "ProdutoSalvo") {
        Swal.fire({
            title: 'Produto Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Produto não salvo
    else if (parametro === "ProdutoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível salvar este produto.'
            });
    }
    
    //Produto alterado
    else if (parametro === "ProdutoAlterado") {
        Swal.fire({
            title: 'Produto alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Produto não alterado
    else if (parametro === "ProdutoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar este produto.'
            });
    }
    
    //Dados para receber pagamento PJ salvo
    else if (parametro === "DadosSalvos") {
        Swal.fire({
            title: 'Dados cadastrados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Dados para receber pagamento PJ  não salvo
    else if (parametro === "DadosNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar dados.'
            });
    }
    
    //Dados para receber pagamento PJ alterado
    else if (parametro === "DadosAlterados") {
        Swal.fire({
            title: 'Dados alterados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Dados para receber pagamento PJ não alterado
    else if (parametro === "DadosNaoAlterados") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar os dados.'
            });
    }
    
    //Cartao de Credito PF salvo
    else if (parametro === "CartaoSalvo") {
        Swal.fire({
            title: 'Cartão salvo!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Cartao de Credito PF não salvo
    else if (parametro === "CartaoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar cartão.'
            });
    }
    
    //Cartao de Credito PF alterado
    else if (parametro === "CartaoAlterado") {
        Swal.fire({
            title: 'Cartão alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Cartao de Credito PF não alterado
    else if (parametro === "CartaoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar seu cartão.'
            });
    }
    
    //Email recuperar senha enviado
    else if (parametro === "EmailEnviado") {
        Swal.fire({
            title: 'Cheque seu email. Enviamos um link para recuperação de senha!',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Email recuperar senha não existente
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
    
    //Senha alterado
    else if (parametro === "SenhaAlterada") {
        Swal.fire({
            title: 'Senha alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Senha não alterado
    else if (parametro === "SenhaNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi possível alterar sua senha.'
        });
    }
   
    //Imagem salva
    else if (parametro === "ImagemSalva") {
        Swal.fire({
            title: 'Imagem Salva!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }
    
    //Imagem não salva
    else if (parametro === "ImagemNaoSalva") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Salva',
            text: 'Por favor, verifique sua conexão!'
        });
    }

    //Imagem alterada
    else if (parametro === "ImagemAlterada") {
        Swal.fire({
            title: 'Imagem Alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        });
    }

    //Imagem não alterada
     else if (parametro === "ImagemNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Alterada',
            text: 'Por favor, verifique sua conexão!'
        });
    }

    
}