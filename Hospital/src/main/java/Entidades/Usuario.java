package Entidades;

/**
 *
 * @author aguare
 */
public class Usuario {

    private final String usuario;
    private final String tipoUsuario;
    private final String nombre;
    private final String password;

    public Usuario(String usuario, String tipoUsuario,String nombre, String password) {
        this.usuario = usuario;
        this.tipoUsuario = tipoUsuario;
        this.nombre = nombre;
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public String getPassword() {
        return password;
    }

    public String getNombre() {
        return nombre;
    }
    
}
