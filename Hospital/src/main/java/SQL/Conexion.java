package SQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author aguare
 */
public class Conexion {
    
    public static Connection Conexion() {
        String url = "jdbc:mysql://localhost:3306/Hospital?useSSL=false";
        String user = "root";
        String password = "74ef6a14";
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.out.println("Error al conectar a la Base de Datos");
        }
        return connection;
    }
    
}
