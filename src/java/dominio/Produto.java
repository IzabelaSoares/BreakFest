package dominio;

public class Produto {
    private int idproduto;
    private String titulo;
    private byte[] imagem;
    private int fkidcategoria;
    private String fkcnpj;
    private String descricao;
    private float preco;
    private String tamanho;
    private String unidadedemedida;
    private float peso;

    public int getIdproduto() {
        return idproduto;
    }

    public void setIdproduto(int idproduto) {
        this.idproduto = idproduto;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public int getFkidcategoria() {
        return fkidcategoria;
    }

    public void setFkidcategoria(int fkidcategoria) {
        this.fkidcategoria = fkidcategoria;
    }

    public String getFkcnpj() {
        return fkcnpj;
    }

    public void setFkcnpj(String fkcnpj) {
        this.fkcnpj = fkcnpj;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getUnidadedemedida() {
        return unidadedemedida;
    }

    public void setUnidadedemedida(String unidadedemedida) {
        this.unidadedemedida = unidadedemedida;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

}
