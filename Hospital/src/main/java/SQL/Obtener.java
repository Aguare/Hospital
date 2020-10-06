package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author aguare
 */
public class Obtener {

    public String obtenerCostoExamen(String codigo) {
        String query = "SELECT * FROM Examen WHERE codigo = ?";
        String cantidad = "";

        Connection connection = Conexion.Conexion();
        try (PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codigo);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad += result.findColumn("costo");
            }

            connection.close();
        } catch (SQLException e) {
        }
        return cantidad;
    }

    public String obtenerCostoConsulta(String nombre) {
        String query = "SELECT * FROM Especialidad WHERE nombre = ?";
        String cantidad = "";

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, nombre);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad += result.findColumn("costoConsulta");
            }

            connection.close();
        } catch (SQLException e) {
        }
        return cantidad;
    }

    public String obtenerEspecialidades(String codMedico) {
        String query = "SELECT * FROM EspecialidadesMedico WHERE Medico_codigo = ?";
        String especialidad = "";

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codMedico);
            ResultSet result = preSt.executeQuery();
            while (result.next()) {
                especialidad = result.getString(2);
            }

        } catch (Exception e) {
            System.out.println("ERROR:"+e.getMessage());
        }
        return especialidad;
    }
    
    public String obtenerCodExamen(String nombre) {
        String query = "SELECT * FROM Examen WHERE nombre = ?";
        String cantidad = "";

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, nombre);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad = result.getString("codigo");
            }

            connection.close();
        } catch (SQLException e) {
        }
        return cantidad;
    }

}
