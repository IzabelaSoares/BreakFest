//@author Izabela

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImagemProduto {
     //variaveis
    private Integer id;
    private String nomeProduto;
    private String localizacao;
    private String fkCnpj;
    
    //inserir imagem produto
    public boolean incluirImagemProduto() {
        //comando de execução de banco de dados 
        String sql = "INSERT INTO public.imagemproduto (fkcnpj, localizacao) VALUES(?,?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.localizacao);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO: " + ex);
            return false;
        }
        return true;     
    }
    
    //consultar imagem produto
    public ImagemProduto ConsultarImagemProduto(String parametro) {
        this.fkCnpj = parametro;
        //comando de execução de banco de dados 
        String sql = "SELECT fkcnpj, localizacao FROM public.imagemproduto where fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();  
        //instanciar imagem
        ImagemProduto imagemProduto = null;
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                imagemProduto = new ImagemProduto();
                imagemProduto.setFkCnpj(rs.getString("fkcnpj"));
                imagemProduto.setLocalizacao(rs.getString("localizacao"));
            }
        } catch (SQLException ex) {
            System.out.println("ERRO: " + ex.getMessage());
        }
        return imagemProduto;
    }
    //consultar todas as imagem produto
    public List<ImagemProduto> consultarTodasImagemProduto() {
        
	String sql = "SELECT * FROM public.imagemproduto";
        
        Connection con = Conexao.conectar();
        List<ImagemProduto> lista = new ArrayList<>();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery(); 
            while (rs.next()){
               ImagemProduto produtos = new ImagemProduto();
               produtos.setId(rs.getInt("id"));
               produtos.setNomeProduto(rs.getString("nomeproduto"));
               produtos.setLocalizacao(rs.getString("localizacao"));
               produtos.setFkCnpj(rs.getString("fkcnpj"));
               lista.add(produtos);
            }
        }catch(SQLException ex){
           System.out.println("ERRO: " + ex.getMessage());
        }
        return lista;    
    }
    
    //alterar imagem produto
    public boolean alterarImagemProduto() {
        //comando de execução de banco de dados 
        String sql = "UPDATE INTO public.imagemproduto SET fkcnpj=?, "
                + "localizacao=? WHERE SET fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.localizacao);
            stm.setString(3, this.fkCnpj);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    //exclusão imagem produto
    public boolean excluirImagemProduto() {
        //comando de execução de banco de dados
        String sql = "DELETE FROM public.imagemproduto WHERE fkcnpj=?";

        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    
    
}
