<%@page import="java.util.List"%>
<%@page import="dominio.PessoaJuridica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Padarias</title>
        <meta property="og:image" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:secure_url" content="//image.prntscr.com/image/93970e70e1f045e1aff76e05469008d8.png" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="400" />
        <link href="styles/util.css" rel="stylesheet">
        <link rel="shortcut icon" href="imagens/cuppa.ico" type="image/x-icon">
        <meta property="og:image:height" content="300" /><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="styles/procurarpadaria.css">

        <%
            PessoaJuridica pj = new PessoaJuridica();
            List<PessoaJuridica> listageral = pj.consultarGeral();

        %>
    </head>
    <body>
        <!-- Inicio da NavBar de cima -->
    <header id="navbar">
        <a href="dadoscartaocredito.jsp"><img src="imagens/cuppa-inicio.gif" alt="Cuppa"></a>
        <h2> Break Fest </h2>
        <nav>
            <ul id="navbar-list">
                <li><a href="https://projetobreakfest.carrd.co/">Sobre Nós</a></li>
                <li><a href="tipopessoa.jsp">Cadastro</a></li>
                <li><a id="login" href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>
    <!-- Fim da NavBar de cima -->
        <!-- inicio camadas de divs -->
        <div id="for-title">
        <div class="container text-center">
            <h1>Abaixo você encontrará todas</h1>
            <h1>as nossas cadastradas</h1>
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
                                    <div class="wsk-cp-product">
                                        <a href="umapadaria.jsp">
                                        <div class="wsk-cp-img"><img src="imagens/pad1.jpg" alt="Padaria" class="" style="max-height: 100%; max-width: 100%"/></div>
                                        <div class="wsk-cp-text">
                                            <div class="midias"><div class="title-product"><h3> <%out.write(String.valueOf(tudo.getNomeFantasia()));%> </h3></div></div>
                                            <div class="description-prod">
                                                <p><%out.write(String.valueOf(tudo.getSobrepadaria()));%></p>
                                            </div>
                                            <div class="card-footer">
                                                <div class="wcf-left"> <span class="price"><%out.write(String.valueOf(tudo.getBairro()));%></span> </div>
                                                <div class="midias"><img src="imagens/pngwing.com.png" alt="alt"><div class="wcf-right"><p><%out.write(String.valueOf(tudo.getFacebook()));%></p></div></div>
                                            </div>
                                        </div>
                                        </a>
                                    </div>
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
        <!-- fim camadas de divs -->
    </body>
</html>
