//@author Maria

package dominio;

import bancodedados.Conexao;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cartao {
    //declaração de variáveis
    int id;
    String email;
    String nome;
    int numero;
    String validade;
    String codSeguranca;
    
    //métodos 
    
    //cadastro de cartão
    public boolean cadastrarCartao(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO cartao " 
                   +"(email, nome, numero, validade, codseguranca) " 
                   +"VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.nome);
            stm.setInt(3, this.numero);
            stm.setString(4, this.validade);
            stm.setString(5, this.codSeguranca);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //alteração de cartão
    public boolean alterarCartao(){
        //comando de execução de banco de dados 
        String sql = "UPDATE cartao " 
                + "SET email=?, nome=?, numero=?, validade=?, codseguranca=?, "
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            stm.setString(2, this.nome);
            stm.setInt(3, this.numero);
            stm.setString(4, this.validade);
            stm.setString(5, this.codSeguranca);
            stm.setInt(6, this.id);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //exclusão de cartão
    public boolean excluirCartao(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM cartao " 
                + "WHERE email=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.email);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    //método para verificar se pessoa física possui dados de pagamento
    public boolean verificaDados(String pEmail){
        //comando de execução de banco de dados
        String sql = "select * from cartao where email = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pEmail);
            ResultSet rs = stm.executeQuery();
            return rs.next();         
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //área de getters e setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFkEmail() {
        return email;
    }

    public void setFkcpf(String email) {
        this.email = email;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getValidade() {
        return validade;
    }

    public void setValidade(String validade) {
        this.validade = validade;
    }

    public String getCodSeguranca() {
        return codSeguranca;
    }

    public void setCodSeguranca(String codseguranca) {
        this.codSeguranca = codseguranca;
    }
    
}
