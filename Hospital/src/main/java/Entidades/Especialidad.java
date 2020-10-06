package Entidades;

/**
 *
 * @author aguare
 */
public class Especialidad {
    
    private String nombre;
    private Double costoConsulta;

    public Especialidad(String nombre, Double costoConsulta) {
        this.nombre = nombre;
        this.costoConsulta = costoConsulta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getCostoConsulta() {
        return costoConsulta;
    }

    public void setCostoConsulta(Double costoConsulta) {
        this.costoConsulta = costoConsulta;
    }
    
    
}
