//@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Pix {
    //declaração de variáveis
    private int id;
    private String fkCnpj;
    private String tipoChave;
    private String chave;
    private String nome;
    
    //métodos
        
    //cadastro de pix
    public boolean cadastrarPix(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pix " 
                   +"(fkcnpj, tipochave, chave, nome) " 
                   +"VALUES(?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.tipoChave);
            stm.setString(3, this.chave);
            stm.setString(4, this.nome);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //alteração de pix
    public boolean alterarpix(){
        //comando de execução de banco de dados 
        String sql = "UPDATE pix " 
                + "SET fkcnpj=?, tipochave=?, chave=?, nome=?, validade=? "
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.tipoChave);
            stm.setString(3, this.chave);
            stm.setString(4, this.nome);
            stm.setInt(5, this.id);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //exclusão de pix
    public boolean excluirPix(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM pix " 
                + "WHERE id=?";
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
    
    //método para verificar se pessoa juridica possui dados de pagamento
    public boolean verificaDados(String pCnpj){
        //comando de execução de banco de dados
        String sql = "select * from pix where cnpj = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCnpj);
            ResultSet rs = stm.executeQuery();
            return rs.next();         
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //área de getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getFkTipoChave() {
        return tipoChave;
    }

    public void setFkTipoChave(String fkTipoChave) {
        this.tipoChave = fkTipoChave;
    }

    public String getChave() {
        return chave;
    }

    public void setChave(String chave) {
        this.chave = chave;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }
    
}
