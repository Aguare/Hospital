package SQL;

import Entidades.Especialidad;
import Entidades.Examen;
import Entidades.Medico;
import Entidades.Paciente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author aguare
 */
public class Consultas {

    private Obtener obtener = new Obtener();

    public ArrayList<Medico> obtenerMedicos() {
        ArrayList<Medico> medicos = new ArrayList<>();
        String query = "SELECT * FROM Medico";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                ArrayList<Especialidad> especialidades = obtener.obtenerEspecialidadesLista(r.getString("codigo"));
                medicos.add(new Medico(r.getString("codigo"), r.getString("nombre"), r.getInt("noColegiado"),
                        r.getString("DPI"), r.getInt("telefono"), r.getString("correo"), r.getDate("fechaInicio"),
                        r.getTime("horaInicio"), r.getTime("horaFinal"), especialidades));
            }
        } catch (Exception e) {
        }
        return medicos;
    }

    public ArrayList<Paciente> obtenerPacientes() {
        ArrayList<Paciente> paciente = new ArrayList<>();
        String query = "SELECT * FROM Paciente";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                paciente.add(new Paciente(r.getString("codigo"), r.getString("nombre"), r.getString("sexo"),
                        r.getDate("fechaNacimiento"), r.getString("DPI"), r.getInt("telefono"), r.getDouble("peso"),
                        r.getString("tipoSangre"), r.getString("correo")));
            }
        } catch (Exception e) {
        }
        return paciente;
    }

    public ArrayList<Examen> obtenerExamenes() {
        ArrayList<Examen> examenes = new ArrayList<>();
        String query = "SELECT * FROM Examen";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement pre = connection.prepareStatement(query)) {
            ResultSet r = pre.executeQuery();
            while (r.next()) {
                examenes.add(new Examen(r.getInt("codigo"), r.getString("nombre"), r.getString("requiereOrden"),
                         r.getString("descripcion"), r.getString("formato"), r.getDouble("costo")));
            }
        } catch (Exception e) {
        }
        return examenes;
    }
}
