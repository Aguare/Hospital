package Servlets;

import SQL.InsertarEditar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author aguare
 */
@WebServlet("/Registrar")
public class Registrar extends HttpServlet {

    private InsertarEditar insertar = new InsertarEditar();

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            String nombre = request.getParameter("nombre");
            String sexo = request.getParameter("sexo");
            String fecha = request.getParameter("fechaNacimiento");
            String DPI = request.getParameter("DPI");
            String telefono = request.getParameter("telefono");
            String peso = request.getParameter("peso");
            String tipoSangre = request.getParameter("tipoSangre");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("passRegistro");
            boolean verificar = insertar.paciente(DPI, nombre, sexo, fecha, DPI, telefono,
                    peso, tipoSangre, correo, pass, InsertarEditar.insertar);
            if (verificar) {
                request.setAttribute("success", 3);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }else{
                request.setAttribute("success", 0);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }

    }
}
