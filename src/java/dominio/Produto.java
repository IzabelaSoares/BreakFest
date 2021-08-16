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
    private String imagem;
    private Integer fkIdCategoria;
    private String fkCnpj;
    private String descricao;
    private float preco;
    private String medida;
    private String unidadeDeMedida;

    //métodos
    public boolean cadastrarProduto(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO produto " 
                   +"(titulo, imagem, fkidcategoria, fkcnpj, descricao, preco, medida, " 
                   + "unidadedemedida) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo); 
            stm.setString(2, this.imagem);
            stm.setInt(3, this.fkIdCategoria);
            stm.setString(4, this.fkCnpj);
            stm.setString(5, this.descricao);
            stm.setFloat(6, this.preco);
            stm.setString(7, this.medida);
            stm.setString(8, this.unidadeDeMedida);
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
                + "SET titulo=?, imagem=?, fkidcategoria=?, fkcnpj=?, descricao=?, preco=?, "
                + "medida=?, unidadedemedida=? WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo); 
            stm.setString(2, this.imagem);
            stm.setInt(3, this.fkIdCategoria);
            stm.setString(4, this.fkCnpj);
            stm.setString(5, this.descricao);
            stm.setFloat(6, this.preco);
            stm.setString(7, this.medida);
            stm.setString(8, this.unidadeDeMedida);
            stm.setInt(9, this.idProduto);
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
        String sql = "SELECT titulo, imagem, fkidcategoria, fkcnpj, descricao, preco, medida, " 
                    + "unidadedemedida FROM produto where titulo = ?";
        Connection con = Conexao.conectar();
        Produto produto = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   produto = new Produto();
                   produto.setTitulo(rs.getString("titulo"));
                   produto.setImagem(rs.getString("imagem"));
                   produto.setFkIdCategoria(rs.getInt("fkidcategoria"));
                   produto.setFkCnpj(rs.getString("fkcnpj"));
                   produto.setDescricao(rs.getString("descricao"));
                   produto.setPreco(rs.getInt("preco"));
                   produto.setMedida(rs.getString("medida"));
                   produto.setUnidadeDeMedida(rs.getString("unidadedemedida")); 
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
        
        return produto;
        
    }
    
    public List<Produto> consultarGeral(){
        List<Produto> lista = new ArrayList<>();
        String sql = "SELECT titulo, imagem, fkidcategoria, fkcnpj, descricao, preco, medida, " 
                + "unidadedemedida FROM produto order by titulo";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setTitulo(rs.getString("titulo"));
                produto.setImagem(rs.getString("imagem"));
                produto.setFkIdCategoria(rs.getInt("fkidcategoria"));
                produto.setFkCnpj(rs.getString("fkcnpj"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPreco(rs.getInt("preco"));
                produto.setMedida(rs.getString("medida"));
                produto.setUnidadeDeMedida(rs.getString("unidadedemedida")); 
                lista.add(produto);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
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

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public Integer getFkIdCategoria() {
        return fkIdCategoria;
    }

    public void setFkIdCategoria(Integer fkIdCategoria) {
        this.fkIdCategoria = fkIdCategoria;
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

    public String getMedida() {
        return medida;
    }

    public void setMedida(String medida) {
        this.medida = medida;
    }
    
    
}
