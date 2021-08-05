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
    private String email;
    private String senha;
    
    //métodos
    public static boolean podeLogar(String email, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  
    
    /* Verifica se login do usuário existe para validação do usuário */

    public boolean verificaExistencia(String email){
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  

    public boolean cadastarUsuario(){
        String sql = "insert into usuario(email,senha) values(?,?)";
        Connection con = Conexao.conectar();
       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.senha);
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
                sql +="email = ? ";
                sql +="senha = ?,";
                sql +=" where idusuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.senha);    
            stm.setInt(3, this.idUsuario);
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
   
    public Login consultarUsuario(String email){
        Connection con = Conexao.conectar();
        String sql = "select email, senha ";
               sql+= " from usuario where email = ?";
        Login login = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                login = new Login();
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
        String sql  = "select idusuario, email ";
               sql += " from usuario order by idusuario";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Login login = new Login();
                login.setIdUsuario(rs.getInt("idusuario"));
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
    public String getEmail() {
        return email;
    }

    public void setEmail(String Email) {
        this.email = Email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String Senha) {
        this.senha = Senha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
