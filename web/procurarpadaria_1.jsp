<%@page import="java.util.List"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Título -->
        <meta charset="UTF-8">
        <title>Padarias</title>
        
        <!-- Navbar Usuário -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js'></script>
        <script src="scripts/navbar-usuario.js"></script>
        <link rel="stylesheet" href="styles/navbar-usuario.css"/>
        
        <!-- Imagem -->
        <meta property="og:image" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:secure_url" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        
        <!-- Link da página "util" em css -->
        <link href="styles/util.css" rel="stylesheet">
        
        <!-- Imagem do Cuppa -->
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        
        <!-- Bootstrap -->
        <meta property="og:image:height" content="300" /><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
        
        <!-- Link do Cloud Flare -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="styles/procurarpadaria.css">

        <!-- Instanciamento de classes e método em Java  -->
        <%
            PessoaJuridica pj = new PessoaJuridica();
            List<PessoaJuridica> listageral = pj.consultarGeral();

        %>
    </head>
    <body>
        <!-- Inicio da NavBar de cima -->
        <header id="navbar">
            <a href="index_1.html"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <div class="drop-down">
                    <div id="dropDown" class="drop-down__button">
                        <a>Meu Painel</a>
                    </div>

                    <!-- Painel da navbar com as opção de cadastro, pedidos e pagamentos. -->
                    <div class="drop-down__menu-box">
                        <ul class="drop-down__menu">
                            <a href="alterarusuariofisico.jsp"><li data-name="profile" class="drop-down__item">Cadastro</li></a>
                            <a href="consultarpedidofisico.jsp"><li data-name="dashboard" class="drop-down__item">Pedidos</li></a>
                            <a href="#" data-toggle="modal" data-target="#modalPagamento"><li class="drop-down__item">Pagamentos</li></a>
                        </ul>
                    </div>
                </div>

                <!-- Essa opção será para sair da página, será levado para a página de login -->
                <li><a href="login.jsp">Sair</a></li>
            </ul>
        </nav>
        </header>
        <!-- Fim da NavBar de cima -->
        
        <!-- inicio camadas de divs -->
        <div class="for-title">
            <div class="container text-center">
                <h1>Abaixo você encontrará todas</h1>
                <h1>as nossas padarias cadastradas</h1>
                <br><br>
            </div>
        </div>
        <div class="shell">
            <div class="container">
                <div class="row">

                    <!-- inicio tabela -->
                    <table>
                        <tbody>
                            <tr>
                                
                                <!-- inicio padaria -->
                                <% for (PessoaJuridica tudo : listageral) { %>
                                <td>
                                    <form action="produtospadariacomprar.jsp" method="post"
                                          id="<%out.write(String.valueOf(tudo.getCnpj()));%>" <% request.getSession().setAttribute("fkcnpj", tudo.getCnpj()); %>>
                                        <div class="wsk-cp-product">
                                            <div>
                                                <div class="wsk-cp-img" onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');">
                                                    <img src="imagens/pad1.jpg" alt="Padaria" class="" style="max-height: 100%; max-width: 100%"/>
                                                </div>
                                                <div class="wsk-cp-text">
                                                    <div class="midias">
                                                        <div class="title-product" style="height: 50px;"
                                                             onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');">
                                                            <h3> <%out.write(String.valueOf(tudo.getNomeFantasia()));%> </h3>
                                                            <input type="hidden" id="padaria" name="padaria" 
                                                                   value="<%out.write(String.valueOf(tudo.getCnpj()));%>">
                                                        </div>
                                                    </div>
                                                    <div class="description-prod" style="height: 70px;"
                                                         onclick="redirecionar('<%out.write(String.valueOf(tudo.getCnpj()));%>');">
                                                        <p><%out.write(String.valueOf(tudo.getSobrepadaria()));%></p>
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
</body>
</html>
