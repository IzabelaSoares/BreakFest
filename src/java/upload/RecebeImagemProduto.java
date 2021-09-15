// @author Izabela
package upload;

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
        request.setCharacterEncoding("UTF-8"); 
        response.setContentType("text/html;charset=UTF-8"); 
        if(request.getParameter("idProduto") == null){
            try (PrintWriter out = response.getWriter()) {

                PessoaJuridica pj = new PessoaJuridica();

                //Pegar os itens no formulário para salvar imagem
                Part part = request.getPart("produto");
                Part arquivo = request.getPart("produto");
                String email = String.valueOf(request.getSession().getAttribute("usuario"));
                String cnpj = pj.procuraCnpj(email);
                String fkcnpj = cnpj;
                cnpj = cnpj.replaceAll("[^0-9]+", "");
                String nomeProduto = request.getParameter("titulo");

                //Pegar o nome do arquivo
                String nomeArquivo = arquivo.getSubmittedFileName();

                //Alterar o nome do arquivo (cnpj + produto + tipo do arquivo) para salvar ele
                if (nomeArquivo.contains(".png")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".png";
                } else if (nomeArquivo.contains(".jpg")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".jpg";
                } else if (nomeArquivo.contains(".jpeg")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".jpeg";
                }

                //Definir os parametros de path e Input do arquivo
                String path = getServletContext().getRealPath("imagens/cliente-produto/" + File.separator + nomeArquivo).replaceAll("\\\\build", "");
                InputStream esse = part.getInputStream(); //faz o input do arquivo

                //Instanciar classe Imagem para a Pasta
                ImagemPasta pasta = new ImagemPasta();

                //Se inserir na pasta do projeto, ai ele insere no sql a localizacao          
                if (pasta.inserirArquivo(esse, path)) {

                    //Itens do formulario para salvar os produtos
                    String titulo = request.getParameter("titulo");
                    Integer codigo = Integer.valueOf(request.getParameter("codigoproduto"));
                    String categoria = request.getParameter("categoria");
                    String tamanho = request.getParameter("tamanho");
                    String unidadeMedida = request.getParameter("unidadedemedida");
                    String descricao = request.getParameter("descricao");
                    String valor = request.getParameter("preco").replace(",", ".");
                    Float preco = Float.parseFloat(valor);
                    int codProduto = Integer.valueOf(request.getParameter("codigoproduto"));
                    String imagem = "imagens/cliente-produto/" + nomeArquivo;

                    //Passar os dados para recebe cadastro do produto
                    request.getSession().setAttribute("titulo", titulo);
                    request.getSession().setAttribute("codigoproduto", codigo);
                    request.getSession().setAttribute("categoria", categoria);
                    request.getSession().setAttribute("preco", preco);
                    request.getSession().setAttribute("descricao", descricao);
                    request.getSession().setAttribute("unidadeMedida", unidadeMedida);
                    request.getSession().setAttribute("tamanho", tamanho);
                    request.getSession().setAttribute("codproduto", codProduto);
                    request.getSession().setAttribute("imagem", imagem);

                    response.sendRedirect("recebecadastroprodutos.jsp");

                } else {
                    request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
                    response.sendRedirect("consultarmeusprodutos.jsp");
                }

            }
        }else if(request.getParameter("nomeArquivo") != null){
            try (PrintWriter out = response.getWriter()) {

                PessoaJuridica pj = new PessoaJuridica();

                //Pegar os itens no formulário para salvar imagem
                Part part = request.getPart("produto");
                Part arquivo = request.getPart("produto");
                String email = String.valueOf(request.getSession().getAttribute("usuario"));
                String cnpj = pj.procuraCnpj(email);
                String fkcnpj = cnpj;
                cnpj = cnpj.replaceAll("[^0-9]+", "");
                String nomeProduto = request.getParameter("titulo");

                //Pegar o nome do arquivo
                String nomeArquivo = arquivo.getSubmittedFileName();

                //Alterar o nome do arquivo (cnpj + produto + tipo do arquivo) para salvar ele
                if (nomeArquivo.contains(".png")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".png";
                } else if (nomeArquivo.contains(".jpg")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".jpg";
                } else if (nomeArquivo.contains(".jpeg")) {
                    nomeArquivo = cnpj + "-" + nomeProduto + ".jpeg";
                }

                //Definir os parametros de path e Input do arquivo
                String path = getServletContext().getRealPath("imagens/cliente-produto/" + File.separator + nomeArquivo).replaceAll("\\\\build", "");
                InputStream esse = part.getInputStream(); //faz o input do arquivo

                //Instanciar classe Imagem para a Pasta
                ImagemPasta pasta = new ImagemPasta();

                //Se inserir na pasta do projeto, ai ele insere no sql a localizacao          
                if (pasta.inserirArquivo(esse, path)) {

                    //Itens do formulario para salvar os produtos
                    String titulo = request.getParameter("titulo");
                    Integer codigo = Integer.valueOf(request.getParameter("codigoproduto"));
                    String categoria = request.getParameter("categoria");
                    String tamanho = request.getParameter("tamanho");
                    String unidadeMedida = request.getParameter("unidadedemedida");
                    String descricao = request.getParameter("descricao");
                    String valor = request.getParameter("preco").replace(",", ".");
                    Float preco = Float.parseFloat(valor);
                    int codProduto = Integer.valueOf(request.getParameter("codigoproduto"));
                    String imagem = "imagens/cliente-produto/" + nomeArquivo;
                    int idProduto = Integer.valueOf(request.getParameter("id"));

                    //Passar os dados para recebe cadastro do produto
                    request.getSession().setAttribute("titulo", titulo);
                    request.getSession().setAttribute("codigoproduto", codigo);
                    request.getSession().setAttribute("categoria", categoria);
                    request.getSession().setAttribute("preco", preco);
                    request.getSession().setAttribute("descricao", descricao);
                    request.getSession().setAttribute("unidadeMedida", unidadeMedida);
                    request.getSession().setAttribute("tamanho", tamanho);
                    request.getSession().setAttribute("codproduto", codProduto);
                    request.getSession().setAttribute("imagem", imagem);
                    request.getSession().setAttribute("id", idProduto);

                    response.sendRedirect("recebealterarproduto.jsp");

                } else {
                    request.getSession().setAttribute("resultado", "ProdutoNaoSalvo");
                    response.sendRedirect("consultarmeusprodutos.jsp");
                }

            }
        }else{
            
            //Itens do formulario para salvar os produtos
            String titulo = request.getParameter("titulo");
            Integer codigo = Integer.valueOf(request.getParameter("codigoproduto"));
            String categoria = request.getParameter("categoria");
            String tamanho = request.getParameter("tamanho");
            String unidadeMedida = request.getParameter("unidadedemedida");
            String descricao = request.getParameter("descricao");
            String valor = request.getParameter("preco").replace(",", ".");
            Float preco = Float.parseFloat(valor);
            int codProduto = Integer.valueOf(request.getParameter("codigoproduto"));
            int idProduto = Integer.valueOf(request.getParameter("idProduto"));

            //Passar os dados para recebe cadastro do produto
            request.getSession().setAttribute("titulo", titulo);
            request.getSession().setAttribute("codigoproduto", codigo);
            request.getSession().setAttribute("categoria", categoria);
            request.getSession().setAttribute("preco", preco);
            request.getSession().setAttribute("descricao", descricao);
            request.getSession().setAttribute("unidadeMedida", unidadeMedida);
            request.getSession().setAttribute("tamanho", tamanho);
            request.getSession().setAttribute("codproduto", codProduto);
            request.getSession().setAttribute("id", idProduto);

            response.sendRedirect("recebealterarproduto.jsp");
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
