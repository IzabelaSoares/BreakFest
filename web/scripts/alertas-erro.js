//@Izabela

function alertar(parametro) {
    //Cadastro salvo
    if (parametro === "UsuarioCadastrado") {
        Swal.fire({
            title: 'Usuário Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
   
    //Cadastro não salvo CFP já existente
    if (parametro === "CpfJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CPF já cadastrado.',
        })
    }
    
    //Cadastro não salvo CNPJ já existente
    if (parametro === "CnpjJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'CNPJ já cadastrado.',
        })
    }
    
    //Não foi possível efetuar cadastro
    if (parametro === "CnpjJaRegistrado") {
        Swal.fire({
            icon: 'error',
            title: 'Ops...',
            text: 'Não foi possível efetuar cadastro.',
        })
    }
    
    //Cadastro alterado
    if (parametro === "CadastroAlterado") {
        Swal.fire({
            title: 'Cadastro alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
   
    //Cadastro não alterado
    if (parametro === "CadastroNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi poossível alterar o cadastro.',
            })
    }
    
    //Email já está sendo utilizado
    if (parametro === "EmailJaRegistrado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Email já está sendo utilizado.',
            })
    }

    
    //Produto salvo
    if (parametro === "ProdutoSalvo") {
        Swal.fire({
            title: 'Produto Cadastrado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Produto não salvo
    if (parametro === "ProdutoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível salvar este produto.',
            })
    }
    
    //Produto alterado
    if (parametro === "ProdutoAlterado") {
        Swal.fire({
            title: 'Produto alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Produto não alterado
    if (parametro === "ProdutoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar este produto.',
            })
    }
    
    //Dados para receber pagamento PJ salvo
    if (parametro === "DadosSalvos") {
        Swal.fire({
            title: 'Dados cadastrados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Dados para receber pagamento PJ  não salvo
    if (parametro === "DadosNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar dados.',
            })
    }
    
    //Dados para receber pagamento PJ alterado
    if (parametro === "DadosAlterados") {
        Swal.fire({
            title: 'Dados alterados!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Dados para receber pagamento PJ não alterado
    if (parametro === "DadosNaoAlterados") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar os dados.',
            })
    }
    
    //Cartao de Credito PF salvo
    if (parametro === "CartaoSalvo") {
        Swal.fire({
            title: 'Cartão salvo!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Cartao de Credito PF não salvo
    if (parametro === "CartaoNaoSalvo") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível cadastrar cartão.',
            })
    }
    
    //Cartao de Credito PF alterado
    if (parametro === "CartaoAlterado") {
        Swal.fire({
            title: 'Cartão alterado!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Cartao de Credito PF não alterado
    if (parametro === "CartaoNaoAlterado") {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Não foi possível alterar seu cartão.',
            })
    }
    
    //Email recuperar senha enviado
    if (parametro === "EmailEnviado") {
        Swal.fire({
            title: 'Cheque seu email. Enviamos um link para recuperação de senha!',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Email recuperar senha não existente
    if (parametro === "EmailNaoExistente") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Seu email não existe no nosso sistema',
        })
    }
    
    //Email recuperar senha não enviado
    if (parametro === "EmailNaoEnviado") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi possível enviar o email.',
        })
    }
    
    //Senha alterado
    if (parametro === "SenhaAlterada") {
        Swal.fire({
            title: 'Senha alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Senha não alterado
    if (parametro === "SenhaNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Não foi possível alterar sua senha.',
        })
    }
   
    //Imagem salva
    if (parametro === "ImagemSalva") {
        Swal.fire({
            title: 'Imagem Salva!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }
    
    //Imagem não salva
    else if (parametro === "ImagemNaoSalva") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Salva',
            text: 'Por favor, verifique sua conexão!',
        })
    }

    //Imagem alterada
    if (parametro === "ImagemAlterada") {
        Swal.fire({
            title: 'Imagem Alterada!',
            icon: 'success',
            showConfirmButton: false,
            timer: 1500
        })
    }

    //Imagem não alterada
     else if (parametro === "ImagemNaoAlterada") {
        Swal.fire({
            icon: 'error',
            title: 'Imagem não Alterada',
            text: 'Por favor, verifique sua conexão!',
        })
    }

    
}