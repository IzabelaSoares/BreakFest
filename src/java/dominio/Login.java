//@author Maria
package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Login {
    //declaração de variáveis
    private int    idUsuario;
    private String nickUsuario;
    private String Email;
    private String Senha;
    
    //métodos
    public static boolean podeLogar(String nickUsuario, String Senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where nickusuario = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nickUsuario);
            stm.setString(2, Senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  
    
    /* Verifica se login do usuário existe para validação do usuário */

    public boolean verificaExistencia(String nickUsuario){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where nickusuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nickUsuario);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  

    public boolean cadastarUsuario(){
        String sql = "insert into usuario(nickusuario,email,senha) values(?,?,?)";
        Connection con = Conexao.conectar();
       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nickUsuario);
            stm.setString(2, this.Email);
            stm.setString(3, this.Senha);
            stm.execute();           
        }    catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
            }        
        return true;
   }

    public boolean alterarUsuario(){
        Connection con = Conexao.conectar();
        String   sql = "update usuario set ";
                sql += "nickusuario = ?";
                sql +="email = ? ";
                sql +="senha = ?,";
                sql +=" where idusuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nickUsuario);
            stm.setString(2, this.Email);
            stm.setString(3, this.Senha);            
            stm.execute();           
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
            }        
       return true;
    }
   
    public boolean excluirUsuario(){
        Connection con = Conexao.conectar();
        String sql = "delete from usuario ";
              sql +=" where idusuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idUsuario);
            stm.execute();           
       } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
            }        
       return true;
    }
   
    public Login consultarUsuario(String pNickUsuario){
        Connection con = Conexao.conectar();
        String sql = "select nickusuario, email, senha ";
               sql+= " from usuario where nickusuario = ?";
        Login login = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pNickUsuario);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                login = new Login();
                login.setNickUsuario(rs.getString("nickusuario"));
                login.setEmail(rs.getString("email"));
                login.setSenha(rs.getString("senha"));
            }
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return login;  
    }
   
    public List<Login> consultar(){
        List<Login> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "select nickusuario,email ";
               sql += " from usuario order by idusuario";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Login login = new Login();
                login.setNickUsuario(rs.getString("nickusuario"));
                login.setEmail(rs.getString("email"));
                lista.add(login);
            }
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return lista;
    }
    
    //área de getters e setters  
    public String getNickUsuario() {
        return nickUsuario;
    }

    public void setNickUsuario(String pNickUsuario) {
        this.nickUsuario = pNickUsuario;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getSenha() {
        return Senha;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
