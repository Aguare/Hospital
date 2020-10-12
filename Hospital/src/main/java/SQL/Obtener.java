package SQL;

import Entidades.Especialidad;
import Entidades.Examen;
import Entidades.Laboratorista;
import Entidades.Medico;
import Entidades.Paciente;
import Entidades.Usuario;
import Varios.Encriptar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

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
        int cantidad = 0;

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codigo);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad += result.getInt("costo");
            }

        } catch (SQLException e) {
        }
        return String.valueOf(cantidad);
    }

    public String obtenerCostoConsulta(String nombre) {
        String query = "SELECT * FROM Especialidad WHERE nombre = ?";
        int cantidad = 0;

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, nombre);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                cantidad += result.getInt("costoConsulta");
            }

        } catch (SQLException e) {
        }
        return String.valueOf(cantidad);
    }

    public String obtenerEspecialidades(String codMedico) {
        String query = "SELECT * FROM EspecialidadesMedico WHERE Medico_codigo = ?";
        String especialidad = "";

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codMedico);
            ResultSet result = preSt.executeQuery();
            while (result.next()) {
                especialidad = result.getString("Especialidad_nombre");
            }
        } catch (Exception e) {
        }
        return especialidad;
    }

    public ArrayList<Especialidad> obtenerEspecialidadesLista(String codMedico) {
        String query = "SELECT * FROM EspecialidadesMedico WHERE Medico_codigo = ?";
        ArrayList<Especialidad> especialidad = new ArrayList<>();

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codMedico);
            ResultSet result = preSt.executeQuery();
            while (result.next()) {
                especialidad.add(especialidad(result.getString("Especialidad_nombre")));
            }
        } catch (Exception e) {
            System.out.println("ERROR:" + e.getMessage());
        }
        return especialidad;
    }

    private Especialidad especialidad(String nombre) {
        String query = "SELECT * FROM Especialidad WHERE nombre = ?";
        Especialidad especialidad = null;

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, nombre);
            ResultSet result = preSt.executeQuery();
            while (result.next()) {
                especialidad = new Especialidad(result.getString("nombre"), result.getDouble("costoConsulta"));
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

    public ArrayList<Especialidad> obtenerTodasEspecialidades() {
        String query = "SELECT * FROM Especialidad";
        ArrayList<Especialidad> especialidades = new ArrayList<>();

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                especialidades.add(new Especialidad(result.getString("nombre"), result.getDouble("costoConsulta")));
            }

        } catch (SQLException e) {
        }
        return especialidades;
    }

    public Examen obtenerExamen(String codigo) {
        String query = "SELECT * FROM Examen WHERE codigo = ?";
        Examen examen = null;

        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {

            preSt.setString(1, codigo);
            ResultSet result = preSt.executeQuery();

            while (result.next()) {
                examen = new Examen(result.getInt("codigo"), result.getString("nombre"), result.getString("requiereOrden"),
                        result.getString("descripcion"), result.getString("formato"), result.getDouble("costo"));
            }

        } catch (SQLException e) {
        }
        return examen;
    }

    public ArrayList<Laboratorista> obtenerLaboratoristasLista() {
        ArrayList<Laboratorista> lab = new ArrayList<>();
        String query = "SELECT * FROM Laboratorista";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                lab.add(new Laboratorista(r.getString("codigo"), r.getString("nombre"), r.getString("noRegistro"),
                        r.getString("DPI"), r.getInt("telefono"), r.getString("correo"), r.getString("diasTrabajo"),
                        r.getDate("fechaInicio"), obtenerExamen(r.getString("Examen_codigo"))));
            }
        } catch (Exception e) {
        }
        return lab;
    }

    public Medico obtenerMedico(String cod) {
        Medico medico = null;
        String query = "SELECT * FROM Medico WHERE codigo = ?";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            pre.setString(1, cod);
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                ArrayList<Especialidad> especialidades = obtenerEspecialidadesLista(r.getString("codigo"));
                medico = new Medico(r.getString("codigo"), r.getString("nombre"), r.getInt("noColegiado"),
                        r.getString("DPI"), r.getInt("telefono"), r.getString("correo"), r.getDate("fechaInicio"),
                        r.getTime("horaInicio"), r.getTime("horaFinal"), especialidades);
            }
        } catch (Exception e) {
        }
        return medico;
    }

    public Paciente obtenerPaciente(String codigo) {
        Paciente paciente = null;
        String query = "SELECT * FROM Paciente WHERE codigo = ?";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            pre.setString(1, codigo);
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                paciente = new Paciente(r.getString("codigo"), r.getString("nombre"), r.getString("sexo"),
                        r.getDate("fechaNacimiento"), r.getString("DPI"), r.getInt("telefono"), r.getDouble("peso"),
                        r.getString("tipoSangre"), r.getString("correo"));
            }
        } catch (Exception e) {
        }
        return paciente;
    }

    public String obtenerFechaActual() {
        Calendar fecha = new GregorianCalendar();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        return año + "-" + mes + "-" + dia;
    }

    public String obtenerPathServidor() {
        return "/home/aguare/ArchivosHospital/";
    }
}
