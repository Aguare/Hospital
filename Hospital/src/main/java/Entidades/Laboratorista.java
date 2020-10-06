package Entidades;

import java.sql.Date;

/**
 *
 * @author aguare
 */
public class Laboratorista {
    
    private  String codigo;
    private  String nombre;
    private String noRegistro;
    private String DPI;
    private int telefono;
    private String correo;
    private String diasTrabajo;
    private Date fechaInicio;
    private Examen examen;

    public Laboratorista(String codigo, String nombre, String noRegistro, String DPI, int telefono, String correo, String diasTrabajo, Date fechaInicio, Examen examen) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.noRegistro = noRegistro;
        this.DPI = DPI;
        this.telefono = telefono;
        this.correo = correo;
        this.diasTrabajo = diasTrabajo;
        this.fechaInicio = fechaInicio;
        this.examen = examen;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNoRegistro() {
        return noRegistro;
    }

    public void setNoRegistro(String noRegistro) {
        this.noRegistro = noRegistro;
    }

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDiasTrabajo() {
        return diasTrabajo;
    }

    public void setDiasTrabajo(String diasTrabajo) {
        this.diasTrabajo = diasTrabajo;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }
    
    
}
