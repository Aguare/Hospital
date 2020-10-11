package SQL;

import Entidades.Usuario;
import Varios.Encriptar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author aguare
 */
public class Obtener {

    public int cantidadUsuarios() {
        String query = "SELECT COUNT(usuario) AS Total FROM Usuario";
        Connection connection = Conexion.Conexion();
        int numero = 0;
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            ResultSet resultado = pre.executeQuery();
            while (resultado.next()) {
                numero = resultado.getInt("Total");
            }
        } catch (Exception e) {
        }
        return numero;
    }

    public Usuario obtenerUsuario(String usuario, String password) {
        String query = "SELECT * FROM Usuario WHERE usuario = ?";
        Connection connection = Conexion.Conexion();
        Usuario user = null;
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            pre.setString(1, usuario);
            ResultSet resultado = pre.executeQuery();
            while (resultado.next()) {
                user = new Usuario(resultado.getString("usuario"), resultado.getString("tipoUsuario"), resultado.getString("nombre"), resultado.getString("password"));
            }
        } catch (Exception e) {
        }
        if (user != null) {
            Encriptar desencriptar = new Encriptar();
            String passDesen = desencriptar.desencriptarPass(user.getPassword(), "ipc");
            if (passDesen.equals(password)) {
                return user;
            }
        }
        return user;
    }

    public String obtenerCostoExamen(String codigo) {
        String query = "SELECT * FROM Examen WHERE codigo = ?";
        String cantidad = "";

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codigo);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad += result.findColumn("costo");
            }

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
            System.out.println("ERROR:" + e.getMessage());
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
                cantidad += result.getString("codigo");
            }

        } catch (SQLException e) {
        }
        return cantidad;
    }

}
