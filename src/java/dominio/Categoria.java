///@author Maria

package dominio;

public class Categoria {
    //criação de variáveis
    private Integer idCategoria;
    private String tituloCategoria;

    //getters e setters
    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idcategoria) {
        this.idCategoria = idcategoria;
    }

    public String getTituloCategoria() {
        return tituloCategoria;
    }

    public void setTituloCategoria(String titulocategoria) {
        this.tituloCategoria = titulocategoria;
    }

}
