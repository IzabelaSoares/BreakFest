<%-- 
    Documento       : procurarpadaria
    Desenvolvido por: Izabela Maria Soares e Ricardo Natal
    Documentado por : Jefferson Teixeira
--%>

<%@page import="dominio.PessoaFisica"%>
<%@page import="java.util.List"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <!-- Título -->
        <meta charset="UTF-8">
        <title>Break Fest</title>

        <!-- CSS, JS e BootStrap do cartão de crédito -->
        <link rel="stylesheet" href="styles/cartaoestilo.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <script src="scripts/cartao-de-credito.js"></script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>

        <!-- Navbar Usuário -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>

        <!-- Search/Barra de Pesquisa -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'> 
        <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        <script src="scripts/galeria-de-produtos.js"></script>

        <!-- Imagem -->
        <meta property="og:image" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:secure_url" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />

        <!-- Link da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">

        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">

        <!-- Link do Cloud Flare -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="styles/procurarpadaria.css">

        <!-- Instanciamento de classes e método em Java  -->
        <%  
            PessoaJuridica pj = new PessoaJuridica();
            List<PessoaJuridica> listageral = pj.consultarGeral();

        %>
    </head>
    <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="index.html"><img src="imagens/Break Fest Animated Logo in.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <!-- Painel padrão com as opções de Sobre nós, cadastro e login -->
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a id="login" href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <!-- Fim da NavBar de cima -->


    <body>
        <!-- Barra de Pesquisa -->
        <div style="padding-top: 40px; text-align: center;">
            <input id="search" type="text" class="col-sm-8" style="height: 50px" placeholder="Procure por um produto ou estabelecimento"><br>
        </div>
        <!-- inicio camadas de divs -->
        <div class="shell" style="margin-top: 0;">
            <div class="container">
                <div class="row">
                    <br>
                    <!-- inicio tabela -->
                    <table style="margin-top: 30px;">
                        <tbody>
                            <tr>
                                <!-- inicio padaria -->
                                <% for (PessoaJuridica tudo : listageral) {
                                        String imagem = tudo.getImagem();
                                        if (imagem == "" || imagem == null || imagem == " ") {
                                            imagem = "imagens\\imagem-perfil\\default.jpg";
                                        }
                                %>
                                <td>
                                    <form action="login.jsp" method="post"
                                          id="<%out.write(String.valueOf(tudo.getCnpj()));%>">
                                        <div class="wsk-cp-product">
                                            <div>
                                                <div class="wsk-cp-img" onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');">
                                                    <img src="<%out.write(String.valueOf(imagem));%>" alt="Padaria" class="" style="height: 220px; width: 220px;"/>
                                                </div>
                                                <div class="wsk-cp-text">
                                                    <div class="midias">
                                                        <div class="title-product" style="height: 50px;"
                                                             onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');">
                                                            <h3 style="padding-top: 10px;"> <%out.write(String.valueOf(tudo.getNomeFantasia()));%> </h3>
                                                            <input type="hidden" id="padaria" name="padaria" 
                                                                   value="<%out.write(String.valueOf(tudo.getCnpj()));%>">
                                                        </div>
                                                    </div>
                                                    <div class="card-footer">
                                                        <div class="wcf-left" onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');"> 
                                                            <%out.write(String.valueOf(tudo.getBairro()));%>
                                                        </div>
                                                        <div>
                                                            <p>
                                                                <a id="referencia-facebook" target="_blank" href="<%out.write(String.valueOf(tudo.getFacebook())); %>">
                                                                    <img src="https://img.icons8.com/bubbles/50/000000/facebook.png"/>
                                                                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <a id="referencia-instagram" target="_blank" href="<%out.write(String.valueOf(tudo.getInstagram())); %>">
                                                                    <img src="https://img.icons8.com/bubbles/50/000000/instagram.png"/>
                                                                </a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                                <%}%>  
                                <!-- fim padaria -->
                            </tr>
                        </tbody>
                    </table>
                    <!-- fim tabela -->
                </div>
            </div>
        </div>
        <!-- Script para redirecionar para pagina da padaria -->
        <script>
            function redirecionar(id) {
                document.getElementById(id).submit();
            }
        </script>
        <!-- JS para Menu -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='https://unpkg.com/popper.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
    </body>
</html>
