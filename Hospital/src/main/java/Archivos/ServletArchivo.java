package Archivos;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author aguare
 */
@MultipartConfig//(maxFileSize = 16177215) //Maximo = 16mb
@WebServlet(name = "ServletArchivo", urlPatterns = {"/ServletArchivo"})
public class ServletArchivo extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Part archivoXML = req.getPart("archivoCarga");
        String path = Paths.get(archivoXML.getSubmittedFileName()).getFileName().toString();
        guardarArchivo(archivoXML, path);
        
        ArrayList<Part> partesArchivo = (ArrayList<Part>) req.getParts();
        for (Part part : partesArchivo) {
            String pathParte = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            guardarArchivo(part, pathParte);
        }
        
        String pathServidor = "/home/aguare/ArchivosHospital/" + path;
        LeerArchivo leer = new LeerArchivo();
        leer.leer(pathServidor);
        
        ArrayList<String> correcto = leer.getCorrecto();
        ArrayList<String> errores = leer.getErrores();
        req.setAttribute("correcto", correcto);
        req.setAttribute("errores", errores);
        
        RequestDispatcher request = req.getRequestDispatcher("Sesion/ArchivoCarga.jsp");
        request.forward(req, res);
    }
    
    private void guardarArchivo(Part archivoXML, String pathArchivo) {
        File path = new File("/home/aguare/ArchivosHospital");
        File archivo = new File(path, pathArchivo);
        
        try ( InputStream input = archivoXML.getInputStream()) {
            Files.copy(input, archivo.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
        }
    }
}
