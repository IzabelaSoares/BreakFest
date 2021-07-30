<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pessoa</title>
        <link href="styles/cadastro.css" rel="stylesheet">
        <link href="styles/util.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body class="form-v10">
        <div class="page-content">
            <div class="form-v10-content">
                <form class="form-detail" action="#" method="post" id="myform">
                    <div class="form-left">
                        <h2>General Infomation</h2>
                        <div class="form-row">
                            <select name="title">
                                <option class="option" value="title">Title</option>
                                <option class="option" value="businessman">Businessman</option>
                                <option class="option" value="reporter">Reporter</option>
                                <option class="option" value="secretary">Secretary</option>
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        <div class="form-group">
                            <div class="form-row form-row-1">
                                <input type="text" name="first_name" id="first_name" class="input-text" placeholder="First Name" required>
                            </div>
                            <div class="form-row form-row-2">
                                <input type="text" name="last_name" id="last_name" class="input-text" placeholder="Last Name" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <select name="position">
                                <option value="position">Position</option>
                                <option value="director">Director</option>
                                <option value="manager">Manager</option>
                                <option value="employee">Employee</option>
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        <div class="form-row">
                            <input type="text" name="company" class="company" id="company" placeholder="Company" required>
                        </div>
                        <div class="form-group">
                            <div class="form-row form-row-3">
                                <input type="text" name="business" class="business" id="business" placeholder="Business Arena" required>
                            </div>
                            <div class="form-row form-row-4">
                                <select name="employees">
                                    <option value="employees">Employees</option>
                                    <option value="trainee">Trainee</option>
                                    <option value="colleague">Colleague</option>
                                    <option value="associate">Associate</option>
                                </select>
                                <span class="select-btn">
                                    <i class="zmdi zmdi-chevron-down"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-right">
                        <h2>Contact Details</h2>
                        <div class="form-row">
                            <input type="text" name="street" class="street" id="street" placeholder="Street + Nr" required>
                        </div>
                        <div class="form-row">
                            <input type="text" name="additional" class="additional" id="additional" placeholder="Additional Information" required>
                        </div>
                        <div class="form-group">
                            <div class="form-row form-row-1">
                                <input type="text" name="zip" class="zip" id="zip" placeholder="Zip Code" required>
                            </div>
                            <div class="form-row form-row-2">
                                <select name="place">
                                    <option value="place">Place</option>
                                    <option value="Street">Street</option>
                                    <option value="District">District</option>
                                    <option value="City">City</option>
                                </select>
                                <span class="select-btn">
                                    <i class="zmdi zmdi-chevron-down"></i>
                                </span>
                            </div>
                        </div>
                        <div class="form-row">
                            <select name="country">
                                <option value="country">Country</option>
                                <option value="Vietnam">Vietnam</option>
                                <option value="Malaysia">Malaysia</option>
                                <option value="India">India</option>
                            </select>
                            <span class="select-btn">
                                <i class="zmdi zmdi-chevron-down"></i>
                            </span>
                        </div>
                        <div class="form-group">
                            <div class="form-row form-row-1">
                                <input type="text" name="code" class="code" id="code" placeholder="Code +" required>
                            </div>
                            <div class="form-row form-row-2">
                                <input type="text" name="phone" class="phone" id="phone" placeholder="Phone Number" required>
                            </div>
                        </div>
                        <div class="form-row">
                            <input type="text" name="your_email" id="your_email" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" placeholder="Your Email">
                        </div>
                        <div class="form-checkbox">
                            <label class="container"><p>I do accept the <a href="#" class="text">Terms and Conditions</a> of your site.</p>
                                <input type="checkbox" name="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="form-row-last">
                            <input type="submit" name="register" class="register" value="Register Badge">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <footer>
            <img src="imagens/cuppa-inicio.gif" alt="BreakFest">
            <h2>Mande-nos uma mensagem!</h2>
            <p>Caso tenha alguma sujestão de melhora, alguma reclamação ou um elogio. :)</p>
            <form action="" method="post">
                <input type="text" name="nome" placeholder="Informe seu nome:">
                <input type="email" name="email" placeholder="Informe seu e-mail:">
                <textarea name="mensagem" placeholder="Informe a mensagem aqui:"></textarea>
                <input type="submit" value="Enviar">
                <input type="reset" value="Limpar">
            </form>
            <p><span class="detail">Break Fest - Entra21</span></p>
        </footer>
    </body>
</html>