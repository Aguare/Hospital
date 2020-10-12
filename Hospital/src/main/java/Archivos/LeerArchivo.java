package Archivos;

import SQL.InsertarEditar;
import SQL.Obtener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author aguare
 */
public class LeerArchivo {

    private InsertarEditar insertar = new InsertarEditar();
    private Obtener obtener = new Obtener();
    private ArrayList<String> correcto = new ArrayList<>();
    private ArrayList<String> errores = new ArrayList<>();

    public void leer(String path) {
        try {
            File archivo = new File(path);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = dbFactory.newDocumentBuilder();
            Document documento = builder.parse(archivo);
            documento.getDocumentElement().normalize();

            NodeList medicos = documento.getElementsByTagName("doctor");
            NodeList admin = documento.getElementsByTagName("admin");
            NodeList laboratorista = documento.getElementsByTagName("laboratorista");
            NodeList paciente = documento.getElementsByTagName("paciente");
            NodeList examen = documento.getElementsByTagName("examen");
            NodeList informe = documento.getElementsByTagName("reporte");
            NodeList resultado = documento.getElementsByTagName("resultado");
            NodeList cita = documento.getElementsByTagName("cita");
            NodeList especialidad = documento.getElementsByTagName("consulta");
            ingresarEspecialidad(especialidad);
            ingresarMedicos(medicos);
            ingresarAdministrador(admin);
            ingresarExamen(examen);
            ingresarLaboratorista(laboratorista);
            ingresarPaciente(paciente);
            ingresarResultados(resultado);
            ingresarCitaMedica(cita);
            ingresarInforme(informe);
        } catch (IOException | ParserConfigurationException | SAXException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<String> getCorrecto() {
        return correcto;
    }

    public ArrayList<String> getErrores() {
        return errores;
    }

    private void ingresarMedicos(NodeList medicos) {
        for (int i = 0; i < medicos.getLength(); i++) {
            Node medico = medicos.item(i);

            if (medico.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) medico;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String nombre = element.getElementsByTagName("NOMBRE").item(0).getTextContent().trim();
                String colegiado = element.getElementsByTagName("COLEGIADO").item(0).getTextContent().trim();
                String DPI = element.getElementsByTagName("DPI").item(0).getTextContent().trim();
                String telefono = element.getElementsByTagName("TELEFONO").item(0).getTextContent().trim();
                String correo = element.getElementsByTagName("CORREO").item(0).getTextContent().trim();
                String fechaInicio = element.getElementsByTagName("TRABAJO").item(0).getTextContent().trim();
                String password = element.getElementsByTagName("CONTRASEÑA").item(0).getTextContent().trim();
                String horaInicio = element.getElementsByTagName("INICIO").item(0).getTextContent().trim();
                String horaSalida = element.getElementsByTagName("FIN").item(0).getTextContent().trim();
                insertarListado(("Médico = " + codigo + ", " + nombre), insertar.medico(codigo, nombre, colegiado, DPI,
                        telefono, correo, fechaInicio, horaInicio, horaSalida, password, InsertarEditar.insertar));

                NodeList espe = element.getElementsByTagName("TITULO");
                for (int j = 0; j < espe.getLength(); j++) {
                    Node especialidad = espe.item(j);
                    insertarListado(("Especialidad Medico " + codigo + " ->" + especialidad.getTextContent()),
                            insertar.insertarEspecialidadesMedico(codigo, especialidad.getTextContent()));
                }
            }
        }
    }

    private void ingresarAdministrador(NodeList admin) {
        for (int i = 0; i < admin.getLength(); i++) {
            Node datos = admin.item(i);

            if (datos.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) datos;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String nombre = element.getElementsByTagName("NOMBRE").item(0).getTextContent().trim();
                String password = element.getElementsByTagName("CONTRASEÑA").item(0).getTextContent().trim();
                String DPI = element.getElementsByTagName("DPI").item(0).getTextContent().trim();
                insertarListado(("Administrador = " + codigo + ", " + nombre), insertar.insertarAdmin(codigo, nombre, DPI, password, InsertarEditar.insertar));
            }
        }
    }

    private void ingresarLaboratorista(NodeList lab) {
        for (int i = 0; i < lab.getLength(); i++) {
            Node laboratorista = lab.item(i);

            if (laboratorista.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) laboratorista;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String nombre = element.getElementsByTagName("NOMBRE").item(0).getTextContent().trim();
                String registro = element.getElementsByTagName("REGISTRO").item(0).getTextContent().trim();
                String DPI = element.getElementsByTagName("DPI").item(0).getTextContent().trim();
                String telefono = element.getElementsByTagName("TELEFONO").item(0).getTextContent().trim();
                String correo = element.getElementsByTagName("CORREO").item(0).getTextContent().trim();
                String fechaInicio = element.getElementsByTagName("TRABAJO").item(0).getTextContent().trim();
                String password = element.getElementsByTagName("CONTRASEÑA").item(0).getTextContent().trim();
                String nombreExamen = element.getElementsByTagName("EXAMEN").item(0).getTextContent().trim();
                if (!nombreExamen.equals("")) {
                    String codExamen = obtener.obtenerCodExamen(nombreExamen);
                    NodeList espe = element.getElementsByTagName("DIA");
                    String diasTrabajo = "";
                    for (int j = 0; j < espe.getLength(); j++) {
                        Node especialidad = espe.item(j);
                        if (j < espe.getLength() - 1) {
                            diasTrabajo += especialidad.getTextContent().trim()+",";
                        } else {
                            diasTrabajo += especialidad.getTextContent().trim();
                        }
                    }
                    insertarListado(("Laboratorista = " + codigo + ", " + nombre), insertar.laboratorista(codigo, nombre, registro, DPI, telefono, correo, diasTrabajo,
                            fechaInicio, codExamen, password, InsertarEditar.insertar));
                } else {
                    errores.add("Laboratorista = " + codigo + ", " + nombre);
                }

            }
        }
    }

    private void ingresarPaciente(NodeList pacientes) {
        for (int i = 0; i < pacientes.getLength(); i++) {
            Node paciente = pacientes.item(i);

            if (paciente.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) paciente;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String nombre = element.getElementsByTagName("NOMBRE").item(0).getTextContent().trim();
                String sexo = element.getElementsByTagName("SEXO").item(0).getTextContent().trim();
                String fechaNacimiento = element.getElementsByTagName("NACIMIENTO").item(0).getTextContent().trim();
                String DPI = element.getElementsByTagName("DPI").item(0).getTextContent().trim();
                String telefono = element.getElementsByTagName("TELEFONO").item(0).getTextContent().trim();
                String peso = element.getElementsByTagName("PESO").item(0).getTextContent().trim();
                String tipoSangre = element.getElementsByTagName("SANGRE").item(0).getTextContent().trim();
                String correo = element.getElementsByTagName("CORREO").item(0).getTextContent().trim();
                String password = element.getElementsByTagName("CONTRASEÑA").item(0).getTextContent().trim();

                insertarListado(("Paciente = " + codigo + ", " + nombre), insertar.paciente(codigo, nombre, sexo, fechaNacimiento, DPI, telefono, peso, tipoSangre,
                        correo, password, InsertarEditar.insertar));
            }
        }
    }

    private void ingresarExamen(NodeList examenes) {
        for (int i = 0; i < examenes.getLength(); i++) {
            Node examen = examenes.item(i);

            if (examen.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) examen;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String nombre = element.getElementsByTagName("NOMBRE").item(0).getTextContent().trim();
                String requiereOrden = element.getElementsByTagName("ORDEN").item(0).getTextContent().trim();
                String descripcion = element.getElementsByTagName("DESCRIPCION").item(0).getTextContent().trim();
                String formato = element.getElementsByTagName("INFORME").item(0).getTextContent().trim();
                String costo = element.getElementsByTagName("COSTO").item(0).getTextContent().trim();

                insertarListado(("Examen = " + codigo + ", " + nombre), insertar.examen(codigo, nombre, requiereOrden, descripcion, formato, costo, InsertarEditar.insertar));
            }
        }
    }

    private void ingresarInforme(NodeList informes) {
        for (int i = 0; i < informes.getLength(); i++) {
            Node informe = informes.item(i);

            if (informe.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) informe;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String codPaciente = element.getElementsByTagName("PACIENTE").item(0).getTextContent().trim();
                String codMedico = element.getElementsByTagName("MEDICO").item(0).getTextContent().trim();
                String descripcion = element.getElementsByTagName("INFORME").item(0).getTextContent().trim();
                String fecha = element.getElementsByTagName("FECHA").item(0).getTextContent().trim();
                String hora = element.getElementsByTagName("HORA").item(0).getTextContent().trim();

                insertarListado(("Informe Médico = " + codigo + ", " + fecha), insertar.insertarInformeMedico(codigo, descripcion, fecha, hora, codMedico, codPaciente));
            }
        }
    }

    //SE AGREGO A LOS ARCHIVOS QUE TENIAN ORDEN EL CODIGO DE UN MEDICO, PARA SABER QUE MEDICO HABIA REALIZADO LA ORDEN
    // Y QUE PUDIESE SER UTILIZADA EN LOS INFORMES
    private void ingresarResultados(NodeList informes) {;
        for (int i = 0; i < informes.getLength(); i++) {
            Node informe = informes.item(i);

            if (informe.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) informe;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String codPaciente = element.getElementsByTagName("PACIENTE").item(0).getTextContent().trim();
                String codExamen = element.getElementsByTagName("EXAMEN").item(0).getTextContent().trim();
                String codLaboratorista = element.getElementsByTagName("LABORATORISTA").item(0).getTextContent().trim();
                String resultados = element.getElementsByTagName("INFORME").item(0).getTextContent().trim();
                String fecha = element.getElementsByTagName("FECHA").item(0).getTextContent().trim();
                String hora = element.getElementsByTagName("HORA").item(0).getTextContent().trim();
                String orden = element.getElementsByTagName("ORDEN").item(0).getTextContent().trim();
                String codMedico = element.getElementsByTagName("MEDICO").item(0).getTextContent().trim();
                if (orden.equals("")) {
                    insertarListado(("Cita Examen = " + codigo + ", " + codPaciente), insertar.insertarCitaExamenSin(codigo, fecha, hora, obtener.obtenerCostoExamen(codExamen),
                            orden, "FALSO", codPaciente, codMedico, codExamen));
                } else {
                    insertarListado(("Cita Examen = " + codigo + ", " + codPaciente), insertar.insertarCitaExamenOrden(codigo, fecha, hora, obtener.obtenerCostoExamen(codExamen),
                            orden, "FALSO", codPaciente, codMedico, codExamen));
                }

                insertarListado(("Resultados = " + resultados + ", " + fecha), insertar.insertarResultados(codigo, resultados, fecha, codExamen, codLaboratorista));
            }
        }
    }

    private void ingresarCitaMedica(NodeList citas) {
        for (int i = 0; i < citas.getLength(); i++) {
            Node cita = citas.item(i);

            if (cita.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) cita;
                String codigo = element.getElementsByTagName("CODIGO").item(0).getTextContent().trim();
                String paciente = element.getElementsByTagName("PACIENTE").item(0).getTextContent().trim();
                String medico = element.getElementsByTagName("MEDICO").item(0).getTextContent().trim();
                String fecha = element.getElementsByTagName("FECHA").item(0).getTextContent().trim();
                String hora = element.getElementsByTagName("HORA").item(0).getTextContent().trim();
                String especialidades = obtener.obtenerEspecialidades(medico).trim();
                String costo = "200.00";
                costo = obtener.obtenerCostoConsulta(especialidades);
                insertarListado(("Cita Médica = " + codigo + ", " + paciente), insertar.insertarCitaMedica(codigo, fecha, hora, costo, "FALSO", medico, paciente));
            }
        }
    }

    private void ingresarEspecialidad(NodeList especialidades) {
        for (int i = 0; i < especialidades.getLength(); i++) {
            Node cita = especialidades.item(i);

            if (cita.getNodeType() == Node.ELEMENT_NODE) {
                Element element = (Element) cita;
                String nombre = element.getElementsByTagName("TIPO").item(0).getTextContent().trim();
                String costoConsulta = element.getElementsByTagName("COSTO").item(0).getTextContent().trim();
                insertarListado(("Especialidad = " + nombre + ", " + costoConsulta), insertar.insertarEspecialidad(nombre, costoConsulta, InsertarEditar.insertar));
            }
        }
    }

    private void insertarListado(String frase, boolean opcion) {
        if (opcion) {
            correcto.add(frase);
        } else if (opcion) {
            errores.add(frase);
        }
    }

}
