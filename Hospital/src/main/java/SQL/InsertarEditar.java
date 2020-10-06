package SQL;

import Varios.Encriptar;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author aguare
 */
public class InsertarEditar {

    public static int insertar = 1;
    public static int editar = 2;

    public boolean insertarAdmin(String codigo, String nombre, String DPI,String password, int opcion) {
        
        String query = "";
        switch (opcion) {
            case 1:
                insertarUsuario(codigo, "Administrador", password, 1);
                query = "INSERT INTO Administrador VALUES (?,?,?)";
                break;
            case 2:
                query = "UPDATE Administrador SET codigo = ?, nombre = ?, DPI = ? WHERE codigo = ?";

                break;
            default:
                return false;
        }
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, nombre);
            preSt.setString(3, DPI);
            if (opcion == 2) {
                preSt.setString(4, codigo);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    private boolean insertarUsuario(String usuario, String tipoUsuario, String password, int opcion) {
        //Encriptación de la contraseña
        Encriptar encriptar = new Encriptar();
        String newPass = encriptar.encriptarPass(password);

        String query = "";
        switch (opcion) {
            case 1:
                query = "INSERT INTO Usuario VALUES (?,?,?)";
                break;
            case 2:
                query = "UPDATE Usuario SET usuario = ?, tipoUsuario = ?, password = ? WHERE usuario = ?";
                break;
            default:
                return false;
        }
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, usuario);
            preSt.setString(2, tipoUsuario);
            preSt.setString(3, newPass);
            if (opcion == 2) {
                preSt.setString(4, usuario);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean medico(String codigo, String nombre, String noColegiado,
            String DPI, String telefono, String correo, String fechaInicio, String horaInicio, String horaFinal, String password, int opcion) {

        String query = "";
        switch (opcion) {
            case 1:
                insertarUsuario(codigo, "Medico", password, 1);
                query = "INSERT INTO Medico VALUES (?,?,?,?,?,?,?,?,?)";
                break;
            case 2:
                query = "UPDATE Medico SET codigo = ?, nombre = ?, noColegiado = ?, DPI = ?, telefono = ?, correo = ?, fechaInicio = ?, horaInicio = ?, horaFinal = ? WHERE codigo = ?";

                break;
            default:
                return false;
        }
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, nombre);
            preSt.setString(3, noColegiado);
            preSt.setString(4, DPI);
            preSt.setString(5, telefono);
            preSt.setString(6, correo);
            preSt.setString(7, fechaInicio);
            preSt.setString(8, horaInicio);
            preSt.setString(9, horaFinal);
            if (opcion == 2) {
                preSt.setString(10, codigo);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean paciente(String codigo, String nombre, String sexo,
            String fechaNacimiento, String DPI, String telefono, String peso, String tipoSangre, String correo, String password, int opcion) {

        String query = "";
        switch (opcion) {
            case 1:
                insertarUsuario(DPI, "Paciente", password, 1);
                query = "INSERT INTO Paciente VALUES (?,?,?,?,?,?,?,?,?)";
                break;
            case 2:
                query = "UPDATE Paciente SET codigo = ?, nombre = ?, sexo = ?, fechaNacimiento = ?, DPI = ?, telefono = ?, peso = ?, tipoSangre = ?, correo = ? WHERE codigo = ?";
                break;
            default:
                return false;
        }
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, nombre);
            preSt.setString(3, sexo);
            preSt.setString(4, fechaNacimiento);
            preSt.setString(5, DPI);
            preSt.setString(6, telefono);
            preSt.setString(7, peso);
            preSt.setString(8, tipoSangre);
            preSt.setString(9, correo);
            if (opcion == 2) {
                preSt.setString(10, codigo);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean laboratorista(String codigo, String nombre, String noRegistro,
            String DPI, String telefono, String correo, String diasTrabajo, String fechaInicio, String codigoExamen, String password, int opcion) {

        String query = "";
        switch (opcion) {
            case 1:
                insertarUsuario(codigo, "Laboratorista", password, 1);
                query = "INSERT INTO Laboratorista VALUES (?,?,?,?,?,?,?,?,?)";
                break;
            case 2:
                query = "UPDATE Laboratorista SET codigo = ?, nombre = ?, noRegistro = ?, DPI = ?, telefono = ?, correo = ?, diasTrabajo = ?, fechaInicio = ?, Examen_codigo = ? WHERE codigo = ?";
                break;
            default:
                return false;
        }
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, nombre);
            preSt.setString(3, noRegistro);
            preSt.setString(4, DPI);
            preSt.setString(5, telefono);
            preSt.setString(6, correo);
            preSt.setString(7, diasTrabajo);
            preSt.setString(8, fechaInicio);
            preSt.setString(9, codigoExamen);
            if (opcion == 2) {
                preSt.setString(10, codigo);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean examen(String codigo, String nombre, String requiereOrden,
            String descripcion, String formato, String costo, int opcion) {
        
        String query = "";
        switch (opcion) {
            case 1:
                query = "INSERT INTO Examen VALUES (?,?,?,?,?,?)";
                break;
            case 2:
                query = "UPDATE Examen SET codigo = ?, nombre = ?, requiereOrden = ?, descripcion = ?, formato = ?, costo = ? WHERE = codigo = ?";
                break;
            default:
                return false;
        }       
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, nombre);
            preSt.setString(3, requiereOrden);
            preSt.setString(4, descripcion);
            preSt.setString(5, formato);
            preSt.setString(6, costo);
            if (opcion == 2) {
                preSt.setString(7, codigo);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarEspecialidad(String nombre, String costoConsulta, int opcion) {
        String query = "";
        switch (opcion) {
            case 1:
                query = "INSERT INTO Especialidad VALUES (?,?)";
                break;
            case 2:
                query = "UPDATE Especialidad SET nombre = ?, costoConsulta = ? WHERE nombre = ?";
                break;
            default:
                return false;
        } 
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, nombre);
            preSt.setString(2, costoConsulta);
            if (opcion==2) {
                preSt.setString(3, nombre);
            }
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarInformeMedico(String codigo, String descripcion, String fecha, String hora, String codMedico, String codPaciente) {

        String query = "INSERT INTO InformeMedico VALUES (?,?,?,?,?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, descripcion);
            preSt.setString(3, fecha);
            preSt.setString(4, hora);
            preSt.setString(5, codMedico);
            preSt.setString(6, codPaciente);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarEspecialidadesMedico(String codMedico, String nombreEspe) {

        String query = "INSERT INTO EspecialidadesMedico VALUES(?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codMedico);
            preSt.setString(2, nombreEspe);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarCitaMedica(String codigo, String fecha, String hora,
            String costo, String estaFinalizado, String codMedico, String codPaciente) {

        String query = "INSERT INTO citaMedica VALUES (?,?,?,?,?,?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, fecha);
            preSt.setString(3, hora);
            preSt.setString(4, costo);
            preSt.setString(5, estaFinalizado);
            preSt.setString(6, codMedico);
            preSt.setString(7, codPaciente);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarCitaExamenSin(String codigo, String fecha, String hora,
            String costo,String ordenExamen, String estaFinalizado, String codPaciente, String codMedico, String codExamen) {

        String query = "INSERT INTO citaExamen(codigo,fecha,hora,costo,estaFinalizado,Paciente_codigo,Examen_codigo) VALUES(?,?,?,?,?,?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, fecha);
            preSt.setString(3, hora);
            preSt.setString(4, costo);
            preSt.setString(5, estaFinalizado);
            preSt.setString(6, codPaciente);
            preSt.setString(7, codExamen);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean insertarCitaExamenOrden(String codigo, String fecha, String hora,
            String costo,String ordenExamen, String estaFinalizado, String codPaciente, String codMedico, String codExamen){
        String query = "INSERT INTO citaExamen(codigo,fecha,hora,costo,ordenExamen,estaFinalizado,Paciente_codigo,Medico_codigo,Examen_codigo) VALUES(?,?,?,?,?,?,?,?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codigo);
            preSt.setString(2, fecha);
            preSt.setString(3, hora);
            preSt.setString(4, costo);
            preSt.setString(5, ordenExamen);
            preSt.setString(6, estaFinalizado);
            preSt.setString(7, codPaciente);
            preSt.setString(8, codMedico);
            preSt.setString(9, codExamen);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertarExamenRealizado(String codLaboratorista, String codExamen, String fecha) {

        String query = "INSERT INTO ExamenRealizado VALUES (?,?,?)";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, codLaboratorista);
            preSt.setString(2, codExamen);
            preSt.setString(3, fecha);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean insertarResultados(String codCitaExamen, String pathResultado, String fecha, String codExamen, String codLaboratorista){
        insertarExamenRealizado(codLaboratorista, codExamen, fecha);
        String query = "UPDATE citaExamen SET resultado = ?, estaFinalizado = ? WHERE codigo = ?";
        Connection connection = Conexion.Conexion();
        try ( PreparedStatement preSt = connection.prepareStatement(query)) {
            preSt.setString(1, pathResultado);
            preSt.setString(2, "True");
            preSt.setString(3, codCitaExamen);
            preSt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
