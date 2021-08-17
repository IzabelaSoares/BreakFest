//@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UnidadedeMedida {
    //declaração de variáveis
    private int id;
    private String nome;
    
    //métodos
    public List<UnidadedeMedida> consultaGeral(){
        List<UnidadedeMedida> lista = new ArrayList<>();
        String sql = "select * from unidadedemedida";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                UnidadedeMedida uni = new UnidadedeMedida();
                uni.setNome(rs.getString("nome"));
                lista.add(uni);
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

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
}
