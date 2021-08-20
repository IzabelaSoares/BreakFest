//@author Izabela
package dominio;

import database.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImagemPerfil {

    //variaveis
    private Integer id;
    private String localizacao;
    private String fkCnpj;

    //inserir imagem perfil
    public boolean incluirImagemPerfil() {
        //comando de execução de banco de dados 
        String sql = "INSERT INTO public.imagempadaria (localizacao, fkcnpj) VALUES(?,?)";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.localizacao);
            stm.setString(2, this.fkCnpj);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("ERRO: " + ex);
            return false;
        }
        return true;
    }

    //consultar imagem perfil
    public ImagemPerfil ConsultarImagemPerfil(String parametro) {
        this.fkCnpj = parametro;
        //comando de execução de banco de dados 
        String sql = "SELECT  localizacao, fkcnpj FROM public.imagempadaria where fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();  
        //instanciar imagem
        ImagemPerfil imagemPerfil = null;
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.fkCnpj);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                imagemPerfil = new ImagemPerfil();
                imagemPerfil.setLocalizacao(rs.getString("localizacao"));
                imagemPerfil.setFkCnpj(rs.getString("fkcnpj"));
            }
        } catch (SQLException ex) {
            System.out.println("ERRO: " + ex.getMessage());
        }
        return imagemPerfil;
    }
    
    //alterar imagem perfil
    public boolean alterarImagemPerfil() {
        //comando de execução de banco de dados 
        String sql = "UPDATE INTO public.imagempadaria SET "
                + "localizacao=?, fkcnpj=? WHERE SET fkcnpj=?";
        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
            //preparando comando sql com os dados
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(2, this.localizacao);
            stm.setString(1, this.fkCnpj);
            stm.setString(3, this.fkCnpj);
            //executando comando
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    //excluir imagem perfil
    public boolean excluirImagemPerfil() {
        //comando de execução de banco de dados
        String sql = "DELETE FROM public.imagempadaria WHERE fkcnpj=?";

        //conectando com o banco
        Connection con = Conexao.conectar();
        try {
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

    //getters e setters
    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getFkCnpj() {
        return fkCnpj;
    }

    public void setFkCnpj(String fkCnpj) {
        this.fkCnpj = fkCnpj;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    
    
    

}
