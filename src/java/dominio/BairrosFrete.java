//@author Maria
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BairrosFrete {
    //variáveis
    private String fkCnpj;
    private String bairroAtendimento;
    private float frete;
    
    //métodos
    
    //cadastra os bairros e seus respectivos fretes
    public boolean cadastrarBairroFrete(){
        //comando de execução de banco de dados
        String sql = "INSERT INTO bairrofrete (fkcnpj, bairro, frete) " 
                   + "VALUES(?, ?, ?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            stm.setString(2, this.bairroAtendimento);
            stm.setFloat(3, this.frete);
            //executando comando
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ex.getMessage());
            return false;
        }
        
        return true;
    }
    
    //consulta todos os bairros da padaria
    public List<String> consultarBairros(String cnpj){
        //cria uma lista
        List<String> lista = new ArrayList<>();
        //comando de execução de banco de dados
        String sql = "SELECT bairros FROM pessoajuridica WHERE cnpj = ?";
        //conecta com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);     
            stm.setString(1, cnpj);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                String bairros = rs.getString("bairros");
                List<String> bairro = new ArrayList<>(Arrays.asList(bairros.split(",")));
                for(int i=0; i < bairro.size(); i++){
                    lista.add(bairro.get(i));
                }
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }
    
    //consulta todos os bairros e fretes da padaria
    public List<BairrosFrete> consultarBairrosFretes(String cnpj){
        //cria uma lista
        List<BairrosFrete> lista = new ArrayList<>();
        //comando de execução de banco de dados
        String sql = "SELECT * FROM bairrofrete WHERE fkcnpj = ?";
        //conecta com o banco
        Connection con = Conexao.conectar();
        try{
            //preparando o comando com os dados
            PreparedStatement stm = con.prepareStatement(sql);     
            stm.setString(1, cnpj);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                BairrosFrete bf = new BairrosFrete();
                bf.setFkCnpj(rs.getString("fkcnpj"));
                bf.setBairroAtendimento(rs.getString("bairro"));
                bf.setFrete(rs.getInt("frete"));
                lista.add(bf);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }
    
    //área de getters e setters
    public void setFkCnpj(String fkCnpj) {    
        this.fkCnpj = fkCnpj;
    }
    
    public String getFkCnpj() {
        return fkCnpj;
    }

    public String getBairroAtendimento() {
        return bairroAtendimento;
    }

    public void setBairroAtendimento(String bairroAtendimento) {
        this.bairroAtendimento = bairroAtendimento;
    }

    public float getFrete() {
        return frete;
    }

    public void setFrete(float frete) {
        this.frete = frete;
    }
}
