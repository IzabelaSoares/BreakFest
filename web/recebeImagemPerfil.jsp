<%-- 
    Document   : recebeImagemPerfil
    Created on : 10/08/2021, 00:21:25
    Author     : Izabela
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="dominio.Imagem"%>
<%@page import="upload.ImagemPasta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Pegar os itens no formulário
    Part part = request.getPart("file");

    //Pegar o nome do arquivo
    String nomeArquivo = part.getSubmittedFileName().toLowerCase(); //pega o nome do arquivo

    //Definir os parametros de path e Input do arquivo
    String path = getServletContext().getRealPath("/" + "imagens-perfil" + File.separator + nomeArquivo);
    InputStream esse = part.getInputStream(); //faz o input do arquivo

    //Instanciar classe Imagem para a Pasta
    ImagemPasta pasta = new ImagemPasta();

    //Inserir na pasta do projeto           
    if (pasta.inserirArquivo(esse, path)) {
        //Se inserir a imagem na pasta, ele insere a localizacao no database
        String cnpj = request.getParameter("cnpj");

        //Alterar o nome do arquivo para salvar ele
        if (nomeArquivo.contains(".png")) {
            nomeArquivo = cnpj + ".png";
        } else if (nomeArquivo.contains(".jpeg")) {
            nomeArquivo = cnpj + ".jpeg";
        }

        //Instanciar a classe Imagem para o SQL
        Imagem novo = new Imagem();

        //Mandar os Dados para o banco de 
        String localizacao = "imagens-perfil/" + nomeArquivo;
        novo.setLocalizacao(localizacao);
        novo.setFkCnpj(cnpj);

        //Inserir no database
        novo.incluirImagemPerfil();
        
        //Colocar aqui link da página recarregada
        
    } else {
        
        //Colocar aqui link da página recarregada e mensagem de erro
    }

%>