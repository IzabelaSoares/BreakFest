//@author Maria

package dominio;

import bancodedados.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Agencia {
    //declaração de variáveis
    private int id;
    private String agencia;
    
    //métodos
    
    //consulta as agências
    public List<Agencia> consultarGeral(){
        List<Agencia> lista = new ArrayList<>();
        String sql = "SELECT agencia"
                   + " FROM agencia";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Agencia agencia = new Agencia();
                agencia.setAgencia(rs.getString("agencia"));
                lista.add(agencia);
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

    public String getAgencia() {
        return agencia;
    }

    public void setAgencia(String agencia) {
        this.agencia = agencia;
    }
    
}
