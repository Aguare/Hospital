package SQL;

import Entidades.Especialidad;
import Entidades.Medico;
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
}
