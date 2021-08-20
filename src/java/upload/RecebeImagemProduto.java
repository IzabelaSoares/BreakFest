// @author Izabela
package upload;

import dominio.ImagemProduto;
import dominio.PessoaJuridica;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class RecebeImagemProduto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            PessoaJuridica pj = new PessoaJuridica();

            //Pegar os itens no formulário para salvar imagem
            Part part = request.getPart("file");
            String email = String.valueOf(request.getSession().getAttribute("usuario"));
            String cnpj = pj.procuraCnpj(email);
            String fkcnpj = cnpj;
            cnpj = cnpj.replaceAll("[^0-9]+", "");
            String nomeProduto = request.getParameter("titulo");

            //Pegar o nome do arquivo
            String nomeArquivo = part.getSubmittedFileName().toLowerCase();

            //Alterar o nome do arquivo (cnpj + produto + tipo do arquivo) para salvar ele
            if (nomeArquivo.contains(".png")) {
                nomeArquivo = cnpj + "-" + nomeProduto + ".png";
            } else if (nomeArquivo.contains(".jpg")) {
                nomeArquivo = cnpj + "-" + nomeProduto + ".jpg";
            } else if (nomeArquivo.contains(".jpeg")) {
                nomeArquivo = cnpj + "-" + nomeProduto + ".jpeg";
            }

            //Definir os parametros de path e Input do arquivo
            String path = getServletContext().getRealPath("imagens/cliente-produto/" + File.separator + nomeArquivo);
            InputStream esse = part.getInputStream(); //faz o input do arquivo

            //Instanciar classe Imagem para a Pasta
            ImagemPasta pasta = new ImagemPasta();

            //Se inserir na pasta do projeto, ai ele insere no sql a localizacao          
            if (pasta.inserirArquivo(esse, path)) {

                //Instanciar a classe Imagem para o SQL
                ImagemProduto novo = new ImagemProduto();

                //Mandar os Dados para o database
                String localizacao = "imagens/cliente-produto/" + nomeArquivo;
                novo.setLocalizacao(localizacao);
                novo.setFkCnpj(fkcnpj);

                //Inserir no database
                novo.incluirImagemProduto();

                //Itens do formulario para salvar os produtos
                String titulo = request.getParameter("titulo");
                String categoria = request.getParameter("categoria");
                String tamanho = request.getParameter("tamanho");
                String unidadeMedida = request.getParameter("unidadedemedida");
                String descricao = request.getParameter("descricao");
                Float preco = Float.parseFloat(request.getParameter("preco"));

                //Passar os dados para recebe cadastro do produto
                request.getSession().setAttribute("titulo", titulo);
                request.getSession().setAttribute("categoria", categoria);
                request.getSession().setAttribute("preco", preco);
                request.getSession().setAttribute("descricao", descricao);
                request.getSession().setAttribute("unidadeMedida", unidadeMedida);
                request.getSession().setAttribute("localizacao", localizacao);
                request.getSession().setAttribute("tamanho", tamanho);

                response.sendRedirect("recebecadastroproduto.jsp");

            } else {
                request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
                response.sendRedirect("cadastroproduto.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
