///@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Produto {
    //criação de variáveis
    private Integer idProduto;
    private String titulo;
    private String categoria;
    private String fkCnpj;
    private String descricao;
    private float preco;
    private String tamanho;
    private String unidadeDeMedida;
    private String imagem;
    private int codProduto;


    //métodos
    public boolean cadastrarProduto(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO produto " 
                   +"(titulo, categoria, fkcnpj, imagem, descricao, preco, tamanho, " 
                   + "unidadedemedida, codproduto) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo); 
            stm.setString(2, this.categoria);
            stm.setString(3, this.fkCnpj);
            stm.setString(4, this.imagem);
            stm.setString(5, this.descricao);
            stm.setFloat(6, this.preco);
            stm.setString(7, this.tamanho);
            stm.setString(8, this.unidadeDeMedida);
            stm.setInt(9, this.codProduto);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean alterarProduto(){
        //comando de execução de banco de dados 
        String sql = "UPDATE produto " 
                + "SET titulo=?, categoria=?, fkcnpj=?, imagem=?, descricao=?, preco=?, "
                + "tamanho=?, unidadedemedida=?, codproduto=? WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo); 
            stm.setString(2, this.categoria);
            stm.setString(3, this.fkCnpj);
            stm.setString(4, this.imagem);
            stm.setString(5, this.descricao);
            stm.setFloat(6, this.preco);
            stm.setString(7, this.tamanho);
            stm.setString(8, this.unidadeDeMedida);
            stm.setInt(9, this.codProduto);
            stm.setInt(10, this.idProduto);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean excluirProduto(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM produto WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idProduto);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    public Produto consultarProduto(String pTitulo){
        this.titulo = pTitulo;
        String sql = "SELECT titulo, categoria, fkcnpj, imagem, descricao, preco, tamanho, " 
                    + "unidadedemedida, codproduto FROM produto where titulo = ?";
        Connection con = Conexao.conectar();
        Produto produto = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   produto = new Produto();
                   produto.setTitulo(rs.getString("titulo"));
                   produto.setCategoria(rs.getString("categoria"));
                   produto.setFkCnpj(rs.getString("fkcnpj"));
                   produto.setDescricao(rs.getString("descricao"));
                   produto.setImagem(rs.getString("iamgem"));
                   produto.setPreco(rs.getFloat("preco"));
                   produto.setTamanho(rs.getString("tamanho"));
                   produto.setUnidadeDeMedida(rs.getString("unidadedemedida")); 
                   produto.setCodProduto(rs.getInt("codproduto"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
        
        return produto;
        
    }
    
    public List<Produto> consultarProdutosBreakFest(){
        List<Produto> lista = new ArrayList<>();
        String sql = "select * from public.produto where fkcnpj = 'XX.XXX.XXX/0001-XX'";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setTitulo(rs.getString("titulo"));
                produto.setImagem(rs.getString("imagem"));
                produto.setIdProduto(rs.getInt("id"));
                produto.setFkCnpj(rs.getString("fkcnpj"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setTamanho(rs.getString("tamanho"));
                produto.setUnidadeDeMedida(rs.getString("unidadedemedida"));
                lista.add(produto);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
    return lista;  
    }
    
    //consultar cada padaria o seu produto, passar cnpj como parametro
    public List<Produto> consultarProdutosPadaria(String cnpj){
        List<Produto> lista = new ArrayList<>();
        String sql = "select * from public.produto where fkcnpj= '"+ cnpj +"'";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setTitulo(rs.getString("titulo"));
                produto.setImagem(rs.getString("imagem"));
                produto.setIdProduto(rs.getInt("id"));
                produto.setFkCnpj(rs.getString("fkcnpj"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setCategoria(rs.getString("categoria"));
                produto.setPreco(rs.getFloat("preco"));
                produto.setTamanho(rs.getString("tamanho"));
                produto.setUnidadeDeMedida(rs.getString("unidadedemedida"));
                produto.setCodProduto(rs.getInt("codproduto"));
                lista.add(produto);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
    return lista;  
    }
    
    public boolean consultarId(int id, String cnpj){
        String sql = "SELECT titulo, categoria, fkcnpj, imagem, descricao, preco, tamanho, " 
                    + "unidadedemedida, codproduto FROM produto where id = ?";
        Connection con = Conexao.conectar();
        Produto produto = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   produto = new Produto();
                   produto.setTitulo(rs.getString("titulo"));
                   produto.setCategoria(rs.getString("categoria"));
                   produto.setFkCnpj(cnpj);
                   produto.setImagem(rs.getString("imagem"));
                   produto.setDescricao(rs.getString("descricao"));
                   produto.setPreco(rs.getFloat("preco"));
                   produto.setTamanho(rs.getString("tamanho"));
                   produto.setUnidadeDeMedida(rs.getString("unidadedemedida")); 
                   produto.setCodProduto(rs.getInt("codproduto"));
                   produto.cadastrarProduto();
                } 
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        
        return true;
        
    }
    
    //getters e setters
    public Integer getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(Integer idProduto) {
        this.idProduto = idProduto;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
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

    public String getUnidadeDeMedida() {
        return unidadeDeMedida;
    }
    public void setUnidadeDeMedida(String unidadedeMedida) {
        this.unidadeDeMedida = unidadedeMedida;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }
    

}
