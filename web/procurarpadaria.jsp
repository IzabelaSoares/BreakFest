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
        <meta property="og:image:height" content="300" /><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="./style.css">

        <%
            PessoaJuridica pj = new PessoaJuridica();
            List<PessoaJuridica> listageral = pj.consultarGeral();

        %>
    </head>
    <body>
        <!-- inicio camadas de divs -->
        <div class="container text-center">
            <h1>Abaixo você encontrará todas as nossas cadastradas</h1>
            <br>
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
                                        <div class="wsk-cp-img"><img src="imagens/pad1.jpg" alt="Padaria" class="img-responsive" /></div>
                                        <div class="wsk-cp-text">
                                            <div class="title-product"><h3> <%out.write(String.valueOf(tudo.getNomeFantasia()));%> </h3></div>
                                            <div class="description-prod">
                                                <p><%out.write(String.valueOf(tudo.getSobrepadaria()));%></p>
                                            </div>
                                            <div class="card-footer">
                                                <div class="wcf-left"> <span class="price">Rp500.000</span> </div>
                                                <div class="wcf-right"> <a href="#" class="buy-btn"><i class="zmdi zmdi-shopping-basket"></i></a> </div>
                                            </div>
                                        </div>
                                    </div>

                                </td>
                                <!-- fim padaria -->
                            </tr>
                            <%}%>  
                        </tbody>
                    </table>
                    <!-- fim tabela -->
                </div>
            </div>
        </div>
        <!-- fim camadas de divs -->
    </body>
</html>
