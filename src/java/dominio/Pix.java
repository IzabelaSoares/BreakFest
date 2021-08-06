//@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pix {
    //declaração de variáveis
    int id;
    String fkTipoChave;
    String chave;
    String nome;
    
    //métodos
        
    //cadastro de pix
    public boolean cadastrarPix(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pix " 
                   +"(fktipochave, chave, nome) " 
                   +"VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkTipoChave);
            stm.setString(2, this.chave);
            stm.setString(3, this.nome);
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
                + "SET fktipochave=?, chave=?, nome=?, validade=? "
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkTipoChave);
            stm.setString(2, this.chave);
            stm.setString(3, this.nome);
            stm.setInt(4, this.id);
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
    
    //área de getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFkTipoChave() {
        return fkTipoChave;
    }

    public void setFkTipoChave(String fkTipoChave) {
        this.fkTipoChave = fkTipoChave;
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
    
}
