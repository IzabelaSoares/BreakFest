//@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Cartao {
    //declaração de variáveis
    int id;
    String fkcpf;
    String nome;
    String numero;
    String validade;
    String codSeguranca;
    
    //métodos 
    
    //cadastro de cartão
    public boolean cadastrarCartao(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO cartao (fkcpf, nome, numero, validade, codseguranca) " 
                    +"VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkcpf);
            stm.setString(2, this.nome);
            stm.setString(3, this.numero);
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
                + "SET nome=?, numero=?, validade=?, codseguranca=? "
                + "WHERE fkcpf=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.numero);
            stm.setString(3, this.validade);
            stm.setString(4, this.codSeguranca);
            stm.setString(5, this.fkcpf);
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
        String sql = "DELETE FROM cartao WHERE fkcpf=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkcpf);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    //método para verificar se pessoa física possui dados de pagamento
    public boolean verificaDados(String pFkcpf){
        //comando de execução de banco de dados
        String sql = "select * from cartao where fkcpf = ?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pFkcpf);
            ResultSet rs = stm.executeQuery();
            return rs.next();         
        }catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }
    
    //método para consultar dados do cartao
    public Cartao consultarNumero(String fkCpf){
        String sql = "SELECT * FROM cartao where fkcpf = '"+fkCpf+"'";
        Connection con = Conexao.conectar();
        Cartao cartao = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   cartao = new Cartao();
                   cartao.setNome(rs.getString("nome"));
                   cartao.setFkcpf(rs.getString("fkcpf"));
                   cartao.setNumero(rs.getString("numero"));
                   cartao.setCodSeguranca(rs.getString("codseguranca"));
                   cartao.setValidade(rs.getString("validade"));
                   cartao.setId(rs.getInt("id"));
                } 
        } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
        return cartao;
    }
    
    //área de getters e setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFkcpf() {
        return fkcpf;
    }

    public void setFkcpf(String fkcpf) {
        this.fkcpf = fkcpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
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
