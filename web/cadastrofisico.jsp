<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Pessoa</title>
        <link href="styles/start.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <div class="topnav">
            <a href="index.html"> BreakFest </a>
            <a href="https://projetobreakfest.carrd.co/"> Sobre Nós </a>
            <a href="tipopessoa.jsp"> Criar cadastro </a>
            <a href="login.jsp"> Logar </a>
        </div>
        <form action="cadastroendereco.jsp" method="POST">
            <center>
            <label>Nome</label>
            <input type="text" name="nome" maxlength="40">
            
            <label>E-mail:</label>
            <input type="text" name="email">
            
            <label>Data de nscimento: </label>
            <input type="date" name="idade">   
            
            <label>Senha: </label>
            <input type="password" name="senha">
            
            <label>CPF: </label>
            <input type="text" name="cpf">
            
            <label>Telefone: </label>
            <input type="text" name="telefone">
            
            <input type="submit" value="Salvar">
            <input type="reset" value="Limpar">
            </center>
        </form>
        <script>
            if(empresa & pessoa == true) {
                alert(Informe apenas um tipo de pessoa!);
            }
            </script>
    </body>
</html>