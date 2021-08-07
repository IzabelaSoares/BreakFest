//@author Maria
package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Deposito {
    //declaração de variáveis
    private int id;
    private String nome;
    private String cnpj;
    private int numeroBanco;
    private String fkAgencia;
    private int conta;
    
    //métodos
    
    //cadastro de conta para depósito
    public boolean cadastrarDeposito(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO deposito " 
                   +"(nome, cnpj, numerobanco, fkagencia, conta) " 
                   +"VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cnpj);
            stm.setInt(3, this.numeroBanco);
            stm.setString(4, this.fkAgencia);
            stm.setInt(5, this.conta);
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
                + "SET nome=?, cnpj=?, numerobanco=?, fkagencia=?, conta=? "
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cnpj);
            stm.setInt(3, this.numeroBanco);
            stm.setString(4, this.fkAgencia);
            stm.setInt(5, this.conta);
            stm.setInt(6, this.id);
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

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public int getNumeroBanco() {
        return numeroBanco;
    }

    public void setNumeroBanco(int numerobanco) {
        this.numeroBanco = numerobanco;
    }

    public String getFkAgencia() {
        return fkAgencia;
    }

    public void setFkAgencia(String fkAgencia) {
        this.fkAgencia = fkAgencia;
    }

    public int getConta() {
        return conta;
    }

    public void setConta(int conta) {
        this.conta = conta;
    }
    
}
