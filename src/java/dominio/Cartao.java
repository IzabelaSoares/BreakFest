//@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Cartao {
    //declaração de variáveis
    int id;
    String fkcpf;
    String nome;
    int numero;
    String validade;
    String codSeguranca;
    
    //métodos 
    
    //cadastro de cartão
    public boolean cadastrarCartao(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO cartao " 
                   +"(fkidcpf, nome, numero, validade, codseguranca) " 
                   +"VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkcpf);
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
                + "SET fkidcpf=?, nome=?, numero=?, validade=?, codseguranca=?, "
                + "WHERE id=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkcpf);
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
