//@author Izabela

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioFisico {
    //declaração de variáveis
    private Integer idUsuario;
    private String email;
    private String senha;
    
    //métodos
    public static boolean podeLogar(String email, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuariofisico where fkemail = ? and senha = ?";
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
        String sql = "select * from usuariofisico where fkemail = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            ResultSet rs = stm.executeQuery();
            return rs.next();            
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            }
        return true;
    }  

    public boolean cadastrarUsuario(){
        String sql = "insert into usuariofisico(fkemail,senha) values(?,?)";
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
        String   sql = "update usuariofisico set fkemail = ?, senha = ? where idusuario = ?";
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
        String sql = "delete from usuariofisico where idusuario = ?";
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
   
    public UsuarioJuridico consultarUsuario(String email){
        Connection con = Conexao.conectar();
        String sql = "select fkemail, senha from usuariofisico where fkemail = ?";
        UsuarioJuridico login = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                login = new UsuarioJuridico();
                login.setEmail(rs.getString("fkemail"));
                login.setSenha(rs.getString("senha"));
            }
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return login;  
    }
   
    public List<UsuarioJuridico> consultar(){
        List<UsuarioJuridico> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "select idusuario, fkemail from usuariofisico order by idusuario";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                UsuarioJuridico login = new UsuarioJuridico();
                login.setIdUsuario(rs.getInt("idusuario"));
                login.setEmail(rs.getString("fkemail"));
                lista.add(login);
            }
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return lista;
    }
    
    //getters e setters  
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
