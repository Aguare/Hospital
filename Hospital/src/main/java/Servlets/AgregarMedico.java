package Servlets;

import SQL.AuxInsertar;
import java.io.IOException;
import java.sql.Date;
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
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String codigo = auxInsertar.getCodigoMedicoInsertar();
        String nombre = request.getParameter("nombre");
        int noColegiado = Integer.parseInt(request.getParameter("colegiado"));
        String DPI = request.getParameter("DPI");
        int noTelefono = Integer.parseInt(request.getParameter("telefono"));
        String correo = request.getParameter("correo");
        Date fechaInicio = Date.valueOf(request.getParameter("fecha_inicio"));
        
        String horaInicio = request.getParameter("hora_inicio");
        String horaFin = request.getParameter("hora_fin");
        
        
        
        //Mandas a insertar el medico
      
    }

    

}
