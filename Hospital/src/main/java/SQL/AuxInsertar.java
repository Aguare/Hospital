package SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author aguare
 */
public class AuxInsertar {

    public String getCodigoLabInsertar() {
        String query = "SELECT codigo FROM Laboratorista ORDER BY codigo DESC LIMIT 1";
        Connection connection = Conexion.Conexion();

        try (PreparedStatement preSt = connection.prepareStatement(query);
                ResultSet resultado = preSt.executeQuery()) {
            if (resultado.next()) {
                String lastCode = resultado.getString(1); //Se obtiene el ultimo codigo de Lab
                String[] ultimoCodigo = lastCode.split("-");
                int noUltimoCodigo = Integer.parseInt(ultimoCodigo[ultimoCodigo.length - 1]); //Obtenemos el numero de codigo
                noUltimoCodigo++;
                return "LAB-" + noUltimoCodigo; //Retornamos el codigo a ingresar
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return "";
    }

    public String getCodigoMedicoInsertar() {
        String query = "SELECT codigo FROM Medico ORDER BY codigo DESC LIMIT 1";
        Connection connection = Conexion.Conexion();

        try (PreparedStatement preSt = connection.prepareStatement(query);
                ResultSet resultado = preSt.executeQuery()) {
            if (resultado.next()) {
                String lastCode = resultado.getString(1); //Se obtiene el ultimo codigo de Medico
                String[] ultimoCodigo = lastCode.split("-");
                int noUltimoCodigo = Integer.parseInt(ultimoCodigo[ultimoCodigo.length - 1]); //Obtenemos el numero de codigo
                noUltimoCodigo++;
                return "MED-" + noUltimoCodigo; //Retornamos el codigo a ingresar
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return "";
    }
    
    public ArrayList<Integer> codigosExamen(){
        String query = "SELECT codigo FROM Examen";
        Connection connection = Conexion.Conexion();
        ArrayList<Integer> listCodigos = new ArrayList<>();
        
        try (PreparedStatement preSt = connection.prepareStatement(query);
                ResultSet resultado = preSt.executeQuery()) {
            while (resultado.next()) {
                listCodigos.add(resultado.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        return listCodigos;
    }
}
