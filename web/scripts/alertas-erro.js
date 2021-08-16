//@Izabela

function alertar(parametro) {
    //Cadastro salvo
   
    //Cadastro não salvo
    
    //Cadastro alterado
   
    //Cadastro não alterado
    
    //Produto salvo
    
    //Produto não salvo
    
    //Produto alterado
    
    //Produto não alterado
    
    //Dados para receber pagamento PJ salvo
    
    //Dados para receber pagamento PJ  não salvo
    
    //Dados para receber pagamento PJ alterado
    
    //Dados para receber pagamento PJ não alterado
    
    //Cartao de Credito PF salvo
    
    //Cartao de Credito PF não salvo
    
    //Cartao de Credito PF alterado
    
    //Cartao de Credito PF não alterado
    
    //Email recuperar senha enviado
    
    //Email recuperar senha não enviado
    
    //Senha alterado
    
    //Senha não alterado
   
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