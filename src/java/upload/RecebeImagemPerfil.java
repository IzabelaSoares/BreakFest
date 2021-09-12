// @author Izabela
package upload;

import dominio.ImagemPerfil;
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
public class RecebeImagemPerfil extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //instancia o usuariojuridico = uj
            PessoaJuridica pj = new PessoaJuridica();

            //recebe os valores da tela HTML
            String instagram = request.getParameter("instagram");
            String facebook = request.getParameter("facebook");
            String email = String.valueOf(request.getSession().getAttribute("usuario"));
            String cnpj = pj.procuraCnpj(email);
            String fkcnpj = cnpj;
            cnpj = cnpj.replaceAll("[^0-9]+", "");
            
            //para salvar a imagem especificamente
            Part part = request.getPart("photo");

            //Pegar o nome do arquivo
            String nomeArquivo = part.getSubmittedFileName().toLowerCase();

            //Alterar o nome do arquivo (cnpj + tipo do arquivo) para salvar ele
            if (nomeArquivo.contains(".png")) {
                nomeArquivo = cnpj + ".png";
            } else if (nomeArquivo.contains(".jpg")) {
                nomeArquivo = cnpj + ".jpg";
            } else if (nomeArquivo.contains(".jpeg")) {
                nomeArquivo = cnpj + ".jpeg";
            }

            //Definir os parametros de path e Input do arquivo
            String path = getServletContext().getRealPath("imagens/imagem-perfil" + File.separator + nomeArquivo).replaceAll("\\\\build", "");
            InputStream esse = part.getInputStream(); //faz o input do arquivo

            //Instanciar classe Imagem para a Pasta
            ImagemPasta pasta = new ImagemPasta();

            //Se inserir na pasta do projeto, ai ele insere no sql a localizacao          
            if (pasta.inserirArquivo(esse, path)) {

                //Instanciar a classe Imagem para o SQL
                ImagemPerfil novo = new ImagemPerfil();

                //Mandar os Dados para o banco de 
                String localizacao = "imagens/imagem-perfil/" + nomeArquivo;
                novo.setLocalizacao(localizacao);
                novo.setFkCnpj(fkcnpj);

                //Inserir no database
                novo.incluirImagemPerfil();

                //Tudo certo ele vai mandar para o recebe midias
                request.getSession().setAttribute("instagram", instagram);
                request.getSession().setAttribute("facebook", facebook);
                request.getSession().setAttribute("localizacao", localizacao);
                response.sendRedirect("recebemidias.jsp");

            } else {

                //Colocar aqui link da página recarregada e mensagem de erro
                response.sendRedirect("midias.jsp");
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
