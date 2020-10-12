package Servlets;

import SQL.InsertarEditar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aguare
 */
@WebServlet(name = "EditarPaciente", urlPatterns = {"/EditarPaciente"})
public class EditarPaciente extends HttpServlet {

    private InsertarEditar insertar = new InsertarEditar();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String sexo = request.getParameter("sexo");
        String fecha = request.getParameter("fechaNacimiento");
        String DPI = request.getParameter("DPI");
        String telefono = request.getParameter("telefono");
        String peso = request.getParameter("peso");
        String tipoSangre = request.getParameter("tipoSangre");
        String correo = request.getParameter("correo");
        boolean verificar = insertar.paciente(codigo, nombre, sexo, fecha, DPI, telefono,
                peso, tipoSangre, correo, "", InsertarEditar.editar);
        if (verificar) {
            request.setAttribute("mensaje", 0);
            request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", 1);
            request.getRequestDispatcher("/Usuario/MAdmin.jsp").forward(request, response);
        }
    }
}
