<%-- 
    Document   : produtospadariacomprar
    Created on : 04/09/2021, 09:18:51
    Author     : Izabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Padarias</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styles/produtos-padaria-comprar.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-inverse bg-inverse fixed-top bg-faded">
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cart">Cart (<span class="total-count"></span>)</button>
                    <button class="clear-cart btn btn-danger">Clear Cart</button>
                </div>
            </div>
        </nav>
        <!-- Fim Nav -->
        <!-- Container de Produto -->
        <div class="container">
            <div class="row">
                <!-- Inicio Tabela -->
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <!-- Produto -->
                                <div class="col">
                                    <div class="card" style="width: 20rem;">
                                        <img class="card-img-top" src="http://www.azspagirls.com/files/2010/09/orange.jpg" alt="Card image cap">
                                        <div class="card-block">
                                            <h4 class="card-title">Orange</h4>
                                            <p class="card-text" style="height: 130px;">
                                                Sonhos são pães feitos com massa fermentada e fritos em óleo,
                                                recheados com doce de leite, creme de confeiteiro, geleia de goiaba,
                                                entre outros
                                            </p>
                                            <p class="card-text">Price: $0.5</p>
                                            <a href="#" data-name="Orange" data-price="0.5" class="add-to-cart btn btn-primary">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Fim Produto -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Fim Container de Produto -->
        <!-- Inicio Modal de Compra -->
        <div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="show-cart table">

                        </table>
                        <div>Total price: $<span class="total-cart"></span></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Order now</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fim Modal de Compra -->
        <!-- JS Inicio -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script  src="scripts/produtos-padaria-comprar.js"></script>
        <!-- JS Fim -->
    </body>
</html>
