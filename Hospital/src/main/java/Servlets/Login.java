package Servlets;

import Entidades.Usuario;
import SQL.Obtener;
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
@WebServlet("/Login")
public class Login extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            System.out.println("Error en el INICIO DE SESIÓN");
        }
    }
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            String id = request.getParameter("id");
            String pass = request.getParameter("password");
            Obtener obtener = new Obtener();
            Usuario user = obtener.obtenerUsuario(id, pass);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                String tipoUsuario = user.getTipoUsuario();
                switch (tipoUsuario) {
                    case "Administrador":
                        if (obtener.cantidadUsuarios() == 1) {
                            response.sendRedirect(request.getContextPath()+"/ServletArchivo");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/Usuario/MAdmin.jsp");
                        }
                        break;
                    case "Laboratorista":
                        response.sendRedirect(request.getContextPath() + "/Usuario/MLab.jsp");
                        break;
                    case "Paciente":
                        response.sendRedirect(request.getContextPath() + "/Usuario/MPaciente.jsp");
                        break;
                    case "Medico":
                        response.sendRedirect(request.getContextPath() + "/Usuario/MMedico.jsp");
                        break;
                }
            } else {
                request.setAttribute("success", 2);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            
        } catch (IOException | ServletException e) {
            System.out.println("ERROR AL INICIAR SESION");
        }
    }
}
