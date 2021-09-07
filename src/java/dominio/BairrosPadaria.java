//@author Izabela

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BairrosPadaria {
    //variaveis
    private Integer id;
    private String bairro;
    private String fkCnpj;
    private Float taxaEntrega;

    //metodos
    
    //cadastrar bairros aceitos
    public boolean cadastrarBairros(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO bairrospadaria (fkcnpj, bairro, taxaentrega) "
                    + "VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.bairro);
            stm.setFloat(3, this.taxaEntrega);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }    
        return true;
    }
    
    //consultar bairros aceitos
     public List<BairrosPadaria> consultarGeral(){
        List<BairrosPadaria> lista = new ArrayList<>();
        String sql = "SELECT * FROM bairrospadaria";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                BairrosPadaria b = new BairrosPadaria();
                b.setId(rs.getInt("id"));
                b.setBairro(rs.getString("bairro"));
                b.setFkCnpj(rs.getString("fkcnpj"));
                b.setTaxaEntrega(rs.getFloat("taxaentrega"));
                lista.add(b);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }        
        return lista;       
    }
     
    //alterar bairros aceitos
    public boolean alterarBairrosPadaria(){
        //comando de execução de banco de dados 
        String sql = "UPDATE bairrospadaria SET id=?, fkcnpj=?, bairro=?, "
                   + "taxaentrega=? WHERE fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setString(2, this.fkCnpj);
            stm.setString(3, this.bairro);
            stm.setFloat(4, this.taxaEntrega);
            stm.setString(5, this.fkCnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
     
    //exclusão de bairro
    public boolean excluirBairro(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM bairros padaria WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }   
        return true;
    } 
    
    //getters e setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public Float getTaxaEntrega() {
        return taxaEntrega;
    }

    public void setTaxaEntrega(Float taxaEntrega) {
        this.taxaEntrega = taxaEntrega;
    }  
    
}
