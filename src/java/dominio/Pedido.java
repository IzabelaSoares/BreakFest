//@author Izabela
package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Pedido {
    //criação de variaveis
    private Integer idPedido;
    private String fkCpf;
    private String fkCnpj;
    private Integer fkIdProduto;
    private String observacao;
    private Date dataPedido;
    private String nome;
    private String razaoSocial;
    private String nomeFantasia;
    
    //metodos
    public boolean cadastrarPedido(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO pedido " +
                     "(fkcpf, fkcnpj, fkidproduto, observacao, datapedido) " +
                     "VALUES(?, ?, ?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCpf);
            stm.setString(2, this.fkCnpj);
            stm.setInt(3, this.fkIdProduto);
            stm.setString(4, this.observacao);
            stm.setDate(5, this.dataPedido);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean alterarPedido(){
        //comando de execução de banco de dados 
        String sql = "UPDATE pessoafisica " 
                + "SET fkcpf=?, fkcnpj=?, fkidproduto=?, observacao=?, datapedido=? " 
                + "WHERE idpedido=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCpf);
            stm.setString(2, this.fkCnpj);
            stm.setInt(3, this.fkIdProduto);
            stm.setString(4, this.observacao);
            stm.setDate(5, this.dataPedido);
            stm.setInt(19, this.idPedido);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    public boolean excluirPedido(){
        //comando de execução de banco de dados
        String sql = "DELETE FROM pedido " 
                + "WHERE idpedido=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPedido);
            //executando comando
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        
        return true;
    }
    
    public List<Pedido> consultarPedidoCliente(String pNomeFantasia){
        List<Pedido> lista = new ArrayList<>();
        if(pNomeFantasia == null){
            String sql = "select  p.idpedido, " +
                    "		p.fkcpf, " +
                    "		f.nome, " +
                    "		p.fkcnpj, " +
                    "		j.nomefantasia, " +
                    "		p.fkidproduto, " +
                    "		p.observacao, " +
                    "		p.datapedido, " +
                    "		j.telefone " +
                    "from pedido p, " +
                    "	 pessoafisica f, " +
                    "	 pessoajuridica j " +
                    "where p.fkcpf = f.cpf and  " +
                    "	  p.fkcnpj = j.cnpj";
            Connection con = Conexao.conectar();
            try{
                PreparedStatement stm = con.prepareStatement(sql);     
                ResultSet rs = stm.executeQuery();
                while(rs.next()){
                    Pedido pedido = new Pedido();
                    pedido.setIdPedido(rs.getInt("idpedido"));
                    pedido.setFkCpf(rs.getString("fkcpf"));
                    pedido.setNome(rs.getString("nome"));
                    pedido.setFkCnpj(rs.getString("fkcnpj"));
                    pedido.setNomeFantasia(rs.getString("nomefantasia"));
                    pedido.setFkIdProduto(rs.getInt("fkidproduto"));
                    pedido.setObservacao(rs.getString("observacao"));
                    lista.add(pedido);
               }
            } catch (SQLException ex) {
              System.out.println("Erro:" + ex.getMessage());
            }
        }else{
            String sql = "select  p.idpedido, " +
                    "		p.fkcpf, " +
                    "		f.nome, " +
                    "		p.fkcnpj, " +
                    "		j.razaosocial, " +
                    "		p.fkidproduto, " +
                    "		p.observacao, " +
                    "		p.datapedido, " +
                    "		j.telefone " +
                    "from pedido p, " +
                    "	 pessoafisica f, " +
                    "	 pessoajuridica j " +
                    "where p.fkcpf = f.cpf and  " +
                    "	  p.fkcnpj = j.cnpj";
            Connection con = Conexao.conectar();
            try{
                PreparedStatement stm = con.prepareStatement(sql);     
                ResultSet rs = stm.executeQuery();
                while(rs.next()){
                    Pedido pedido = new Pedido();
                    pedido.setIdPedido(rs.getInt("idpedido"));
                    pedido.setFkCpf(rs.getString("fkcpf"));
                    pedido.setNome(rs.getString("nome"));
                    pedido.setFkCnpj(rs.getString("fkcnpj"));
                    pedido.setRazaoSocial(rs.getString("razaosocial"));
                    pedido.setFkIdProduto(rs.getInt("fkidproduto"));
                    pedido.setObservacao(rs.getString("observacao"));
                    lista.add(pedido);
               }
            } catch (SQLException ex) {
              System.out.println("Erro:" + ex.getMessage());
            }
        }
        
        return lista;
        
    }
    
    
    //getters and setters
    public Integer getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }

    public String getFkCpf() {
        return fkCpf;
    }

    public void setFkCpf(String fkCpf) {
        this.fkCpf = fkCpf;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public Integer getFkIdProduto() {
        return fkIdProduto;
    }

    public void setFkIdProduto(Integer fkIdProduto) {
        this.fkIdProduto = fkIdProduto;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Date getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(Date dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getNomeFantasia() {
        return nomeFantasia;
    }

    public void setNomeFantasia(String nomeFantasia) {
        this.nomeFantasia = nomeFantasia;
    }
    
    

}
