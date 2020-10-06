package Entidades;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author aguare
 */
public class Medico {
    
    private  String codigo;
    private String nombre;
    private int noColegiado;
    private String DPI;
    private int telefono;
    private String correo;
    private Date fechaInicio;
    private Time horaInicio;
    private Time horaFinal;
    private ArrayList<Especialidad> especialidades;

    public Medico(String codigo, String nombre, int noColegiado, String DPI, int telefono, String correo, Date fechaInicio, Time horaInicio, Time horaFinal, ArrayList<Especialidad> especialidades) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.noColegiado = noColegiado;
        this.DPI = DPI;
        this.telefono = telefono;
        this.correo = correo;
        this.fechaInicio = fechaInicio;
        this.horaInicio = horaInicio;
        this.horaFinal = horaFinal;
        this.especialidades = especialidades;
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

    public int getNoColegiado() {
        return noColegiado;
    }

    public void setNoColegiado(int noColegiado) {
        this.noColegiado = noColegiado;
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

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFinal() {
        return horaFinal;
    }

    public void setHoraFinal(Time horaFinal) {
        this.horaFinal = horaFinal;
    }

    public ArrayList<Especialidad> getEspecialidades() {
        return especialidades;
    }

    public void setEspecialidades(ArrayList<Especialidad> especialidades) {
        this.especialidades = especialidades;
    }
    
    
    
}
