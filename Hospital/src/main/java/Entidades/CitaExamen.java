package Entidades;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author aguare
 */
public class CitaExamen {

    private int codigo;
    private Date fecha;
    private Time hora;
    private Double costo;
    private String resultado;
    private String ordenExamen;
    private boolean estaFinalizado;
    private Paciente paciente;
    private Medico medico;
    private Examen examen;

    public CitaExamen(int codigo, Date fecha, Time hora, Double costo, boolean estaFinalizado, Paciente paciente, Medico medico, Examen examen) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.hora = hora;
        this.costo = costo;
        this.estaFinalizado = estaFinalizado;
        this.paciente = paciente;
        this.medico = medico;
        this.examen = examen;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
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

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public boolean isEstaFinalizado() {
        return estaFinalizado;
    }

    public void setEstaFinalizado(boolean estaFinalizado) {
        this.estaFinalizado = estaFinalizado;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public Medico getMedico() {
        return medico;
    }

    public void setMedico(Medico medico) {
        this.medico = medico;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public String getOrdenExamen() {
        return ordenExamen;
    }

    public void setOrdenExamen(String ordenExamen) {
        this.ordenExamen = ordenExamen;
    }
    
    
}
