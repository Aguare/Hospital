package Entidades;

/**
 *
 * @author aguare
 */
public class Examen {

    private int codigo;
    private String nombre;
    private String requiereOrden;
    private String descripcion;
    private String formato;
    private Double costo;

    public Examen(int codigo, String nombre, String requiereOrden, String descripcion, String formato, Double costo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.requiereOrden = requiereOrden;
        this.descripcion = descripcion;
        this.formato = formato;
        this.costo = costo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRequiereOrden() {
        return requiereOrden;
    }

    public void setRequiereOrden(String requiereOrden) {
        this.requiereOrden = requiereOrden;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }
    
    
}
