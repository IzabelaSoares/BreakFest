//@author Izabela
package upload;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class ImagemPasta {

    //Inserir a imagem em uma pasta do projeto
    public boolean inserirArquivo(InputStream is, String path) {
        try {
            byte[] imagem = new byte[is.available()];
            is.read(imagem);
            try (FileOutputStream fileos = new FileOutputStream(path)) {
                fileos.write(imagem);
                fileos.flush();
            }
        } catch (IOException ex) {
            ex.getMessage();
            return false;
        }
        return true;
    }
    
    //Alterar a imagem na pasta do projeto
    
    
    //Excluir a imagem na pasta do projeto
    
}



