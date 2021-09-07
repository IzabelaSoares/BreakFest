///@author Maria

package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Categoria {
    //criação de variáveis
    private Integer idCategoria;
    private String tituloCategoria;
    
    public List<Categoria> consultaGeral(){
        List<Categoria> lista = new ArrayList<>();
        String sql = "select * from categoria";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Categoria cat = new Categoria();
                cat.setTituloCategoria(rs.getString("titulocategoria"));
                lista.add(cat);
            }
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }        
        return lista;       
    }

    //getters e setters
    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idcategoria) {
        this.idCategoria = idcategoria;
    }

    public String getTituloCategoria() {
        return tituloCategoria;
    }

    public void setTituloCategoria(String titulocategoria) {
        this.tituloCategoria = titulocategoria;
    }

}
