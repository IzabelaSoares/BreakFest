//@author Maria
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Deposito {
    //declaração de variáveis
    private int id;
    private String nome;
    private String fkCnpj;
    private String email;
    private int numeroBanco;
    private String banco;
    private int conta;
    
    //métodos
    
    //cadastro de conta para depósito
    public boolean cadastrarDeposito(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO deposito " 
                   +"(nome, fkcnpj, email, numerobanco, banco, conta) " 
                   +"VALUES(?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.fkCnpj);
            stm.setString(3, this.email);
            stm.setInt(4, this.numeroBanco);
            stm.setString(6, this.banco);
            stm.setInt(7, this.conta);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //alteração de conta para depósito
    public boolean alterarDeposito(){
        //comando de execução de banco de dados 
        String sql = "UPDATE deposito " 
                + "SET nome=?, cnpj=?, email=?, numerobanco=?, fkagencia=?, conta=? "
                + "WHERE fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.fkCnpj);
            stm.setString(3, this.email);
            stm.setInt(4, this.numeroBanco);
            stm.setString(5, this.banco);
            stm.setInt(6, this.conta);
            stm.setString(7, this.fkCnpj);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //exclusão de conta para deposito
    public boolean excluirDeposito(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM deposito " 
                + "WHERE fkcnpj=?";
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
        String sql = "select * from deposito where email = ?";
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

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnpj() {
        return fkCnpj;
    }

    public void setCnpj(String cnpj) {
        this.fkCnpj = cnpj;
    }

    public int getNumeroBanco() {
        return numeroBanco;
    }

    public void setNumeroBanco(int numerobanco) {
        this.numeroBanco = numerobanco;
    }

    public String getFkAgencia() {
        return banco;
    }

    public void setFkAgencia(String fkAgencia) {
        this.banco = fkAgencia;
    }

    public int getConta() {
        return conta;
    }

    public void setConta(int conta) {
        this.conta = conta;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }
    
    
    
    
}
