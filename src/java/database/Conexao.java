package database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:postgresql://breakfest.c2q2okru5re1.us-east-2.rds.amazonaws.com:5432/breakfest";
        String user = "postgres";
        String password = "projetobreakfest"; 
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco de dados");
        }
        return con;                
    }    
}
