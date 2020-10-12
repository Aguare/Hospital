package Servlets;

import SQL.AuxInsertar;
import SQL.InsertarEditar;
import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aguare
 */
@WebServlet(name = "AgregarMedico", urlPatterns = {"/AgregarMedico"})
public class AgregarMedico extends HttpServlet {

    private AuxInsertar auxInsertar = new AuxInsertar();
    private InsertarEditar insertar = new InsertarEditar();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("opcion");
        if (op.equalsIgnoreCase("0")) {
            insertarMedico(request, response);
        } else {
            editarMedico(request, response);
        }

    }

    private void editarMedico(HttpServletRequest request, HttpServletResponse response) {
        try {
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String noColegiado = request.getParameter("colegiado");
            String DPI = request.getParameter("DPI");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String fechaInicio = request.getParameter("fecha_inicio");
            String horaInicio = request.getParameter("hora_inicio");
            String horaFin = request.getParameter("hora_fin");
            boolean op = insertar.medico(codigo, nombre, noColegiado, DPI, telefono, correo, fechaInicio, horaInicio, horaFin, correo, InsertarEditar.editar);
            if (op) {
                request.setAttribute("mensaje", 0);
                request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", 1);
                request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
        }

    }

    private void insertarMedico(HttpServletRequest request, HttpServletResponse response) {
        try {
            String codigo = auxInsertar.getCodigoMedicoInsertar();
            String nombre = request.getParameter("nombreR");
            String noColegiado = request.getParameter("colegiadoR");
            String DPI = request.getParameter("DPIR");
            String telefono = request.getParameter("telefonoR");
            String correo = request.getParameter("correoR");
            Calendar fecha = new GregorianCalendar();
            int año = fecha.get(Calendar.YEAR);
            int mes = fecha.get(Calendar.MONTH);
            int dia = fecha.get(Calendar.DAY_OF_MONTH);
            String fechaInicio = año + "-" + mes + "-" + dia;
            String horaInicio = request.getParameter("hora_inicioR");
            String horaFin = request.getParameter("hora_finR");
            String especialidad = request.getParameter("especialidadR");
            String password = request.getParameter("passwordR");
            boolean operacion = insertar.medico(codigo, nombre, noColegiado, DPI, telefono, correo, fechaInicio, horaInicio, horaFin, password, InsertarEditar.insertar);
            boolean op = insertar.insertarEspecialidadesMedico(codigo, especialidad);
            if (op) {
                request.setAttribute("mensaje", 3);
                request.setAttribute("info", "CODIGO DE ACCESO DEL NUEVO MÉDICO -> " + codigo);
                request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
            } else {
                request.setAttribute("mensaje", 1);
                request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
        }
    }

}
