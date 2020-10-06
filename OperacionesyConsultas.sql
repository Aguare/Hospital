//INSERTAR DATOS A LAS TABLAS DE LA BD
INSERT INTO Usuario VALUES (?,?,?);						ya
INSERT INTO Administrador VALUES (?,?,?);				pendiente
INSERT INTO Medico VALUES (?,?,?,?,?,?,?,?,?);			ya
INSERT INTO Paciente VALUES (?,?,?,?,?,?,?,?,?);		ya
INSERT INTO Especialidad VALUES (?,?);					ya
INSERT INTO Examen VALUES (?,?,?,?,?,?);				ya
INSERT INTO Laboratorista VALUES (?,?,?,?,?,?,?,?,?);	ya
INSERT INTO EspecialidadesMedico VALUES(?,?);			ya
INSERT INTO InformeMedico VALUES (?,?,?,?,?,?);			ya
INSERT INTO citaMedica VALUES (?,?,?,?,?,?,?);			ya
INSERT INTO citaExamen VALUES (?,?,?,?,?,?,?,?,?,?);	ya
INSERT INTO ExamenRealizado VALUES (?,?,?);				ya

//ACTUALIZAR REGISTROS DE LA BASE DE DATOS
UPDATE Medico SET nombre = ?, noColegiado = ?, DPI = ?, telefono = ?, correo = ?, fechaInicio = ?, horaInicio = ?, horaFinal = ? WHERE codigo = ?;				ya

UPDATE Especialidad SET nombre = ?, costoConsulta = ? WHERE nombre = ?;																							ya
	
UPDATE Examen SET nombre = ?, requiereOrden = ?, descripcion = ?, formato = ?, costo = ? WHERE = codigo = ?;													ya

UPDATE Laboratorista SET nombre = ?, noRegistro = ?, DPI = ?, telefono = ?, correo = ?, diasTrabajo = ?, fechaInicio = ?, Examen_codigo = ? WHERE codigo = ?;	ya

UPDATE Paciente SET nombre = ?, sexo = ?, fechaNacimiento = ?, DPI = ?, telefono = ?, peso = ?, tipoSangre = ?, correo = ? WHERE codigo = ?;					ya

UPDATE Usuario SET usuario = ?, password = ? WHERE usuario = ?;

UPDATE Administrador SET codigo = ?, nombre = ?, DPI = ? WHERE codigo = ?;

UPDATE citaExamen SET resultado = ?, estaFinalizado = ? WHERE codigo = ?;

SELECT * FROM Examen WHERE codigo = ?;