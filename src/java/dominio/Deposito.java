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
    private String fkCnpj;
    private String conta;
    private String banco;
    private String tipoConta;
    private String agencia;
    private String dataPagto;
    
    //métodos
    
    //cadastro de conta para depósito
    public boolean cadastrarDeposito(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO deposito " 
                   +"(fkcnpj, conta, banco, tipoconta, agencia, datapagto) " 
                   +"VALUES(?, ?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.conta);
            stm.setString(3, this.banco);
            stm.setString(4, this.tipoConta);
            stm.setString(5, this.agencia);
            stm.setString(6, this.dataPagto);
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
                + "SET fkcnpj=?, conta=?, banco=?, tipoconta=?, agencia=? , datapagto=? "
                + "WHERE fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.conta);
            stm.setString(3, this.banco);
            stm.setString(4, tipoConta);
            stm.setString(5, this.agencia);
            stm.setString(6, this.dataPagto);
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
        String sql = "select d.fkcnpj from usuariojuridico u, deposito d where u.email = ?";
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

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public String getConta() {
        return conta;
    }

    public void setConta(String conta) {
        this.conta = conta;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }

    public String getDataPagto() {
        return dataPagto;
    }

    public void setDataPagto(String dataPagto) {
        this.dataPagto = dataPagto;
    }

    public String getTipoConta() {
        return tipoConta;
    }

    public void setTipoConta(String tipoConta) {
        this.tipoConta = tipoConta;
    }
    
    
}
