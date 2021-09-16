<%@page import="java.util.List"%>
<%@page import="dominio.Banco"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Scripts do bootstrap e Cloud Flare -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        
        <!-- Navbar Usuário -->
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>

        <!-- Imports de escolhas de bairro -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="styles/bairros.css">

        <!-- Título -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Break Fest</title>
        
        <!-- Script da pessoa jurídica -->
        <script src="scripts/pessoa-juridica.js"></script>
        
        <!-- Link da página "cadastro" em css -->
        <link href="styles/cadastro.css" rel="stylesheet">
        
        <!-- Link da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">
        
        <!-- Link do Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <!-- Script do Alerta -->
        <script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script><script src="./script.js"></script>
        <script src="scripts/alertas-erro.js"></script>
        <script> var resultado = "${sessionScope.resultado}"</script><%request.getSession().setAttribute("resultado", null);%>

        <!-- CSS, JS e BootStrap de Preferencia de pagamento -->
        <!-- Link da página "midias" em css -->
        <link rel="stylesheet" href="styles/midias.css">
        <!-- Link da página "preferenciapagamento" em css -->
        <link rel="stylesheet" href="styles/preferenciapagamento.css">
        <!-- Script da Mídia -->
        <script src="scripts/midias.js"></script>
        <!-- Script da Preferencia de pagamento -->
        <script src="scripts/preferencia-de-pagamento.js"></script>
        <!-- Script do Cloud Flare para Bootstrap -->
        <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <!-- Link do Cloud Flare -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
        <!-- Script do Cloud Flare -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    </head>
    
    <!-- Inicio da NavBar de cima -->
    <!--  -->
    <header id="navbar" onload="javascript: alertar(resultado)">
         <a href="index.html"><img src="imagens/Break Fest Animated Logo in.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <div class="drop-down">
                    <div id="dropDown" class="drop-down__button">
                        <a>Meu Painel</a>
                    </div>
                    
                    <!-- Painel da navbar com as opção de cadastro, pedidos, pagamentos, mídias e produtos. -->
                    <div class="drop-down__menu-box">
                        <ul class="drop-down__menu">
                            <a href="alterarusuariojuridico.jsp"><li class="drop-down__item">Cadastro</li></a>
                            <a href="consultarpedidofisico.jsp"><li class="drop-down__item">Pedidos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalMidias"><li class="drop-down__item">Midias</li></a>
                            <a href="produtospadrao.jsp"><li class="drop-down__item">Produtos</li></a>
                        </ul>
                    </div>
                </div>
                
                <!-- Opção de sair da página -->
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
    </header>

    <!-- Instanciamento de classes e método em Java  -->
    <%
        //Instanciar a Pessoa Juridica
        PessoaJuridica pj = new PessoaJuridica();

        //Pegar o cnpj dela
        String fkemail = String.valueOf(request.getSession().getAttribute("usuario"));
        String cnpj = pj.procuraCnpj(fkemail);

        //Instanciar uma nova pessoa juridica e consultar os dados através do cnpj
        PessoaJuridica consulta = new PessoaJuridica();
        consulta = consulta.consultarConta(cnpj);

        //Instanciar uma nova pessoa juridica e consultar os dados através do cnpj
        PessoaJuridica pix = new PessoaJuridica();
        pix = consulta.consultarDados(cnpj);

        //Instanciar banco para escolher o pagamento.
        Banco lista = new Banco();
        List<Banco> listabanco = lista.consultarGeral();

    %>
    <!-- Fim da NavBar de cima -->
    <!-- modal de pagamento -->
    <div class="modal fade" id="modalMidias" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <section class="container max-w-xl mx-auto flex flex-col py-8">
                        <h1 class="text-xl font-black">Informações Adicionais</h1>
                        
                        <!-- Form com as informações -->
                        <form action="RecebeImagemPerfil" method="post" enctype="multipart/form-data" class="form-midias">
                            <label for="instagram">Link para o Instagram</label>
                            <br>
                            <input type="text" name="instagram" placeholder="Instagram">
                            <br><br>
                            <label for="facebook">Link para o Facebook</label>
                            <br>
                            <input type="text" name="facebook" placeholder="Facebook" height="300px">
                            <br><br><hr>
                            <label>Foto da padaria</label>
                            <br>
                            <div id="center">
                                <div x-data="imageData()" class="file-input flex items-center">

                                    <!--          //////////                      Preview da Imagem                      ////////                -->
                                    <div class="h-12 w-12 rounded-full overflow-hidden bg-gray-100">
                                        
                                        <!-- Placeholder da Imagem -->
                                        <div class="flex items-center">
                                            
                                            <!-- Input de foto -->
                                            <div class="ml-5 rounded-md shadow-sm">
                                                <input @change="updatePreview($refs)" x-ref="input"
                                                        type="file" maxlength="50px" 
                                                        accept="image/*,capture=camera" 
                                                        name="photo" id="photo" 
                                                        class="custom">
                                                <label for="photo" style="position: relative; right: 48px; border-left: none; border-bottom: 2px solid #995a1a; border-top: none; border-right: none; padding-left: 8px; padding-right: 8px;">
                                                    Adicionar
                                                </label>
                                            </div>
                                            <div class="flex items-center text-sm text-gray-500 mx-2">
                                                <span x-text="fileName || emptyText"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                
                                <!-- Botão de enviar -->
                                <div class="botaoLegal">
                                    <input type="submit" value="Enviar"/>
                                </div>
                            </div>
                        </form>
                    </section>
                    
                    <!-- Scripts do Cloud Flare e Mídias -->
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/alpinejs/2.6.0/alpine.js'></script><script  src="scripts/midias.js"></script>
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js'></script><script src="./script.js"></script>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalPagamento" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h3>Como deseja receber seu pagamento?</h3>
                    <div id="inputbonito">
                        <div class="pagamento">

                            <!-- Selecionando método de recebimento -->
                            <form action="recebepagamento.jsp" method="post" >
                                <select id="pagamento" name="pagamento" onchange="formaPagamento()">
                                    <option value="NA" selected disabled hidden>Selecione aqui a forma de pagamento</option>
                                    <option value="pix">Pix</option>
                                    <option value="deposito">Depósito Bancário</option>
                                </select>
                                <br><br>

                                <!-- PIX -->
                                <div id="pix-pagamento" style="display:none">           
                                    <label for="pix_metodo">Escolha sua Chave Pix</label><br>
                                    <select name="fktipochave" id="pix_metodo" onchange="chavePix()">
                                        <option value="NA" selected disabled hidden>Selecione a chave PIX aqui</option>
                                        <option value="cnpj">CNPJ</option>
                                        <option value="email">E-mail</option>
                                        <option value="telefone">Telefone</option>
                                    </select>
                                    <br>

                                    <!-- Input de CPNJ -->
                                    <div id="cnpj-pagamento" style="display:none">
                                        <label for="chave-cnpj">Informe seu CNPJ</label>
                                        <input type="text" name="chave-cnpj" id="chave-cnpj" placeholder="XX.XXX.XXX/XXXX-XX"
                                               value="<% out.print(String.valueOf(pix.getCnpj())); %>">
                                    </div>
                                    
                                    <!-- Input do E-mail -->
                                    <div id="email-pagamento" style="display:none">
                                        <label for="chave-telefone">Informe seu E-mail</label>
                                        <input type="text" name="chave-email" id="chave-email" placeholder="exemplo@email.com"
                                               value="<% out.print(String.valueOf(pix.getEmail())); %>">
                                    </div>
                                    
                                    <!-- Input do Telefone -->
                                    <div id="telefone-pagamento" style="display:none">
                                        <label for="chave-telefone">Informe seu Telefone</label>
                                        <input type="text" name="chave-telefone" id="chave-telefone" placeholder="(XX)XXXXX-XXXX"
                                               value="<% out.print(String.valueOf(pix.getTelefone())); %>">
                                    </div><br>
                                    
                                    <!-- Input do dia de recebimento -->
                                    <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                    <select name="dia" id="dia">
                                        <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                        <option value="05">Dia 05</option>
                                        <option value="10">Dia 10</option>
                                        <option value="25">Dia 25</option>
                                    </select>
                                </div>  

                                <!-- Depósito Bancário -->

                                <!-- Input do CNPJ -->
                                <div id="deposito-pagamento" style="display:none">
                                    <label for="conta-cnpj">Informe o CNPJ</label>
                                    <input name="cnpj" type="text" id="conta-cnpj" placeholder="Informe o CNPJ"> 
                                    <br><br>
                                    
                                    <!-- Input do banco -->
                                    <label>Banco</label> <br/>
                                    <select name="banco" id="bankaccount">
                                        <option value="NA" selected disabled hidden>Selecione aqui seu banco</option>
                                        <% for (Banco bancos : listabanco) { %>  
                                        <option value="<% out.write(String.valueOf(bancos.getNumero()));%>">
                                            <% out.write(String.valueOf(bancos.getNumero() + " | " + bancos.getBanco())); %>
                                        </option>
                                        <%}%> 
                                    </select>

                                    <br><br>
                                    
                                    <!-- Input do número da conta -->
                                    <label for="conta-bancaria">Conta Bancaria</label>
                                    <input name="conta" type="text" id="conta-bancaria" placeholder="Informe o número da conta"> 
                                    <br><br>

                                    <!-- Input do tipo da conta -->
                                    <label>Tipo da Conta</label> <br>
                                    <select name="tipo-conta" id="accounttype">
                                        <option value="NA" selected disabled hidden>Selecione aqui o tipo da conta</option>
                                        <option value="poupanca">Poupança</option>
                                        <option value="corrente">Corrente</option>
                                    </select> 
                                    <br><br>
                                    
                                    <!-- Input do número da agência -->
                                    <label for="agencia">Agência</label>
                                    <input name="agencia" type="text" id="agencia" placeholder="Informe a agência">
                                    <br><br>

                                    <!-- Input do dia de recebimento -->
                                    <label for="dia">Selecione o dia que deseja receber o pagamento</label> <br>
                                    <select name="dia" id="dia">
                                        <option value="NA" selected disabled hidden>Selecione aqui o dia para receber</option>
                                        <option value="05">Dia 05</option>
                                        <option value="10">Dia 10</option>
                                        <option value="25">Dia 25</option>
                                    </select>
                                </div>
                                
                                <!-- Botão de Submit -->
                                <div class="botaoLegal">
                                    <button type="submit">
                                        <p>Enviar</p>
                                        <span></span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <body class="form-v10">
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="recebealterarusuariojuridico.jsp" method="post" id="myform">
                    
                    <!-- Início do lado esquerdo do form -->
                    <div class="form-left">
                        <h2>Informações Gerais</h2>
                       
                        <!-- Input da razão social -->
                        <div class="form-row form-row-1">
                            <input type="text" maxlength="80" name="razaosocial" id="razaosocial" value="<% out.write(String.valueOf(consulta.getRazaoSocial())); %>"
                                   class="input-text" placeholder="Razão Social" required>
                        </div>
                        
                        <!-- Input do e-mail -->
                        <div class="form-row">
                            <input type="text" name="email" id="email" value="<% out.write(String.valueOf(consulta.getEmail())); %>"
                                   class="input-text" placeholder="E-mail" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" required>
                        </div>            
                        
                        <!-- Input do nome da padaria -->
                        <div class="form-row">
                            <input type="text" maxlength="80" value="<% out.write(String.valueOf(consulta.getNomeFantasia())); %>"
                                   name="nomefantasia" id="nomefantasia" placeholder="Nome da padaria"required>
                        </div>
                        
                        <!-- Dois inputs seguidos "CNPJ e Telefone" -->
                        <div class="form-group">
                           
                            <!-- Input do CNPJ -->
                            <div class="form-row form-row-3">
                                <input type="text" name="cnpj" value="<% out.write(String.valueOf(consulta.getCnpj())); %>"
                                       id="cnpj" placeholder="CNPJ" required maxlength="18" readonly >
                            </div>
                            
                            <!-- Input do telefone -->
                            <div class="form-row form-row-2">
                                <input type="text" name="telefone" value="<% out.write(String.valueOf(consulta.getTelefone())); %>"
                                       id="telefone" placeholder="Telefone" maxlength="15">
                            </div>
                        </div>
                        
                        <!-- Input do "sobre" da padaria -->
                        <div class="form-row">
                            <textarea style="height:135px; width:443px; box-shadow:0 0 0 0; outline: 0;" 
                                      type="text" maxlength="120" name="sobre" id="sobre">
                                <% out.write(String.valueOf(consulta.getSobrepadaria())); %>
                            </textarea>
                        </div>
                        
                        <!-- Input da senha -->
                        <div class="form-row">
                            <input type="password" name="senha" id="senha" placeholder="Senha" >
                        </div>
                        <div class="form-row">
                            <input type="password" name="checksenha" id="checksenha" placeholder="Confirmar senha" >
                            <p id="alertPassword"></p><br>
                        </div>
                    </div>
                    <!-- Fim do lado esquerdo do form -->
                    <!-- Início do lado direito do form -->
                    <div class="form-right">
                        <h2>Endereço</h2>
                        <!-- Form group para o input do CEP não ficar gigante. -->

                        <!-- input do CEP -->
                        <div class="form-row form-row-3">
                            <input type="text" maxlength="10" name="cep" id="cep" value="<% out.write(String.valueOf(consulta.getCep())); %>"
                                   placeholder="CEP" onblur="pesquisacep(this.value);" required maxlength="15">
                        </div>
                        
                        <!-- Form group para o estado e da cidade ficarem um ao lado do outro -->
                        <div class="form-group">
                            
                            <!-- Input do estado  -->
                            <div class="form-row form-row-1">
                                <input type="text" name="estado" id="estado" value="<% out.write(String.valueOf(consulta.getEstado())); %>"
                                       placeholder="Estado" required readonly>
                            </div>
                            
                            <!-- Input da cidade -->
                            <div class="form-row form-row-2">
                                <input type="text" name="cidade" id="cidade" value="<% out.write(String.valueOf(consulta.getCidade())); %>"
                                       placeholder="Cidade" required readonly>
                            </div>
                        </div>
              
                        <!-- Input do bairro  -->
                        <div class="form-row form-row-2">
                            <input type="text" name="bairro" id="bairro" value="<% out.write(String.valueOf(consulta.getBairro())); %>"
                                   placeholder="Bairro" required readonly>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
           
                        <!-- Form group para o número da casa e a rua ficarem um ao lado do outro -->
                        <div class="form-group">
               
                            <!-- Input do número da casa -->
                            <div class="form-row form-row-1">
                                <input type="text" maxlength="5" name="numero" value="<% out.write(String.valueOf(consulta.getNumero())); %>"
                                       id="numero" placeholder="Nr." required>
                            </div>
                           
                            <!-- Input da rua -->
                            <div class="form-row form-row-2">
                                <input type="text" name="rua" id="rua" value="<% out.write(String.valueOf(consulta.getRua())); %>"
                                       placeholder="Rua" required readonly>
                            </div>
                        </div>
                        
                        <!-- Input do complemento -->
                        <div class="form-row">
                            <input type="text" maxlength="80" name="complemento" id="complemento" value="<% out.write(String.valueOf(consulta.getComplemento())); %>"
                                   placeholder="Complemento (opcional)">
                        </div>
                        
                        <!-- Input dos bairros que ela deseja atender -->
                        <div class="form-row">
                            <div class="combo js-csv">
                                <div role="combobox" aria-haspopup="listbox" aria-expanded="false" aria-owns="listbox1" class="input-wrapper">
                                    <input
                                        size="50"
                                        value="<% out.write(String.valueOf(consulta.getBairros()));%>"
                                        placeholder="Selecione os bairros de interesse em fornecer"
                                        aria-activedescendant=""
                                        aria-autocomplete="list"
                                        id="combo1"
                                        class="combo-input"
                                        type="text">
                                        
                                </div>
                                <div class="combo-menu" role="listbox" aria-multiselectable="true" id="listbox1"></div>
                            </div>
                        </div>
                        
                        <!-- Botão submit para lançar os dados do form -->
                        <div class="form-row-last">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cadastrar" class="register" value="Salvar alteração">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cadastrar" class="register" value="Cancelar alteração">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- JS para bairros -->
        <script src="scripts/bairros.js"></script>
        <!-- JS para Menu -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='https://unpkg.com/popper.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
    </body>
</html>
