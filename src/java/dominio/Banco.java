//@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Banco {
    //declaração de variáveis
    private int id;
    private String banco;
    private int numero;
    
    //métodos
    
    //consulta as agências
    public List<Banco> consultarGeral(){
        List<Banco> lista = new ArrayList<>();
        String sql = "SELECT banco, numero FROM banco";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Banco b = new Banco();
                b.setBanco(rs.getString("banco"));
                b.setNumero(rs.getInt("numero"));
                lista.add(b);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }       
        return lista;        
    }
    
    //área de getters e setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    

    
}
