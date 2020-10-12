package Entidades;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author aguare
 */
public class CitaMedica {

    private String codigo;
    private Date fecha;
    private Time hora;
    private double costo;
    private String estaFinalizado;
    private Medico medico;
    private Paciente paciente;

    public CitaMedica(String codigo, Date fecha, Time hora, double costo, String estaFinalizado, Medico medico, Paciente paciente) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.costo = costo;
        this.estaFinalizado = estaFinalizado;
        this.medico = medico;
        this.paciente = paciente;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getEstaFinalizado() {
        return estaFinalizado;
    }

    public void setEstaFinalizado(String estaFinalizado) {
        this.estaFinalizado = estaFinalizado;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
    
}
