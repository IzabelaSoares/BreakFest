//@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TipoChave {
    //declaração de variáveis
    private int id;
    private String tipo;
    
    //métodos
    //consulta os tipos de chave para pix
    public List<TipoChave> consultarGeral(){
        List<TipoChave> lista = new ArrayList<>();
        String sql = "SELECT tipo "
                   + " FROM tipochave";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                TipoChave tipo = new TipoChave();
                tipo.setTipo(rs.getString("tipo"));
                lista.add(tipo);
           }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        
        return lista;
        
    }
    //área de getters e setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
