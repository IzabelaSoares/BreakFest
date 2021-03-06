//@author Izabela

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioFisico {
    //declaração de variáveis
    private Integer idUsuario;
    private String fkidCpf;
    private String email;
    private String senha;
    
    //métodos
    public static boolean podeLogar(String email, String senha){
        Connection con = Conexao.conectar();
        String sql = "select * from usuariofisico where email = ? and senha = ?";
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
        String sql = "select * from usuariofisico where email = ?";
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

    public boolean cadastrarUsuario(){
        String sql = "insert into usuariofisico(fkcpf, email,senha) values(?, ?, ?)";
        Connection con = Conexao.conectar();
       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkidCpf);
            stm.setString(2, this.email);
            stm.setString(3, this.senha);
            stm.execute();           
        }    catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
            }        
        return true;
   }

    public boolean alterarUsuario(){
        Connection con = Conexao.conectar();
        String   sql = "update usuariofisico set email = ?, senha = ? where fkcpf = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.senha);    
            stm.setString(3, this.fkidCpf);
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
        String sql = "delete from usuariofisico where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
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
        String sql = "select fkcpf, email from usuariofisico where email = ?";
        UsuarioJuridico login = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                login = new UsuarioJuridico();
                login.setEmail(rs.getString("fkcpf"));
                login.setEmail(rs.getString("email"));
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
        String sql  = "select fkcpf, email from usuariofisico order by idusuario";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                UsuarioJuridico login = new UsuarioJuridico();
                login.setEmail(rs.getString("fkcpf"));
                login.setEmail(rs.getString("email"));
                lista.add(login);
            }
        } 
            catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }      
        return lista;
    }
    
    //métodos para alterar senha
    public boolean alterarSenha(){
        //comando de execução de banco de dados 
        String sql = "UPDATE usuariofisico " 
                + "SET senha=? " 
                + "WHERE email=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.senha);
            stm.setString(2, this.email);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        return true;
    }
    
    //getters e setters  
    public String getFkidCpf() {
        return fkidCpf;
    }

    public void setFkidCpf(String fkidCpf) {
        this.fkidCpf = fkidCpf;
    }
    
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
