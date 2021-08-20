//@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Pix {
    //declaração de variáveis
    private int id;
    private String fkCnpj;
    private String email;
    private String tipoChave;
    private String chave;
    private String nome;
    
    //métodos
        
    //cadastro de pix
    public boolean cadastrarPix(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pix " 
                   +"(fkCnpj, tipochave, chave) " 
                   +"VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.tipoChave);
            stm.setString(3, this.chave);
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
                + "SET tipochave=?, chave=?, validade=? "
                + "WHERE fkCnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.tipoChave);
            stm.setString(3, this.chave);
            stm.setString(4, this.fkCnpj);
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
                + "WHERE fkCnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
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
    
    //método para verificar se pessoa juridica possui dados de pagamento
    public boolean verificaDados(String email){
        //comando de execução de banco de dados
        String sql = "select p.fkcnpj from usuariojuridico u, pix p where u.email = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
