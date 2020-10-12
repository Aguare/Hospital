DROP DATABASE IF EXISTS Hospital;
CREATE SCHEMA IF NOT EXISTS Hospital;

USE Hospital;

CREATE TABLE IF NOT EXISTS Usuario(
	usuario VARCHAR(20) NOT NULL,
	tipoUsuario VARCHAR(13) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	password VARCHAR(100) NOT NULL,
	PRIMARY KEY(usuario)		
);

CREATE TABLE IF NOT EXISTS Administrador(
	codigo VARCHAR(15) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	DPI VARCHAR(13) NOT NULL,
	PRIMARY KEY(codigo)	
);

CREATE TABLE IF NOT EXISTS Medico(
	codigo VARCHAR(30) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	noColegiado INT(6) NOT NULL,
	DPI VARCHAR(13) NOT NULL,
	telefono INT(8) NOT NULL,
	correo VARCHAR(45) NOT NULL,
	fechaInicio DATE NOT NULL,
	horaInicio TIME NOT NULL,
	horaFinal TIME NOT NULL,
	PRIMARY KEY(codigo)	
);

CREATE TABLE IF NOT EXISTS Paciente(
	codigo VARCHAR(10) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	sexo VARCHAR(6) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	DPI VARCHAR(13) NOT NULL,
	telefono INT(8) NOT NULL,
	peso DOUBLE NOT NULL,
	tipoSangre VARCHAR(3) NOT NULL,
	correo VARCHAR(45) NOT NULL,
	PRIMARY KEY(codigo)
);

CREATE TABLE IF NOT EXISTS Especialidad(
	nombre VARCHAR(40) NOT NULL,
	costoConsulta DOUBLE NOT NULL,
	PRIMARY KEY(nombre)	
);


CREATE TABLE IF NOT EXISTS Examen(
	codigo INT NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	requiereOrden VARCHAR(9) NOT NULL,
	descripcion VARCHAR(500) NOT NULL,
	formato VARCHAR(3) NOT NULL,
	costo DOUBLE NOT NULL,
	PRIMARY KEY(codigo)
);

CREATE TABLE IF NOT EXISTS Laboratorista(
	codigo VARCHAR(15) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	noRegistro VARCHAR(15) NOT NULL,
	DPI VARCHAR(13) NOT NULL,
	telefono INT(8) NOT NULL,
	correo VARCHAR(45) NOT NULL,
	diasTrabajo VARCHAR(60) NOT NULL,
	fechaInicio DATE NOT NULL,
	Examen_codigo INT NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY (Examen_codigo) REFERENCES Examen(codigo)	
);

CREATE TABLE IF NOT EXISTS EspecialidadesMedico(
	Medico_codigo VARCHAR(30),
	Especialidad_nombre VARCHAR(40),
	PRIMARY KEY(Medico_codigo, Especialidad_nombre),
	FOREIGN KEY(Medico_codigo) REFERENCES Medico(codigo),
	FOREIGN KEY(Especialidad_nombre) REFERENCES Especialidad(nombre)	
);

CREATE TABLE IF NOT EXISTS InformeMedico(
	codigo INT NOT NULL,
	descripcion VARCHAR(1500) NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	Medico_codigo VARCHAR(30) NOT NULL,
	Paciente_codigo VARCHAR(10) NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY(Medico_codigo) REFERENCES Medico(codigo),
	FOREIGN KEY(Paciente_codigo) REFERENCES Paciente(codigo)
);

CREATE TABLE IF NOT EXISTS citaMedica(
	codigo INT NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	costo DOUBLE NOT NULL,
	estaFinalizado VARCHAR(9) NOT NULL,
	Medico_codigo VARCHAR(30) NOT NULL,
	Paciente_codigo VARCHAR(10) NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY(Medico_codigo) REFERENCES Medico(codigo),
	FOREIGN KEY(Paciente_codigo) REFERENCES Paciente(codigo)	
);

CREATE TABLE IF NOT EXISTS citaExamen(
	codigo INT NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	costo DOUBLE NOT NULL,
	resultado VARCHAR(100),
	ordenExamen VARCHAR(100),
	estaFinalizado VARCHAR(9) NOT NULL,
	Paciente_codigo VARCHAR(10) NOT NULL,
	Medico_codigo VARCHAR(30),
	Examen_codigo INT NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY(Paciente_codigo) REFERENCES Paciente(codigo),
	FOREIGN KEY(Medico_codigo) REFERENCES Medico(codigo),
	FOREIGN KEY(Examen_codigo) REFERENCES Examen(codigo)	
);

CREATE TABLE IF NOT EXISTS ExamenRealizado(
	laboratorista_codigo VARCHAR(15) NOT NULL,
	citaExamen_codigo INT NOT NULL,
	fecha DATE NOT NULL,
	PRIMARY KEY(laboratorista_codigo, citaExamen_codigo),
	FOREIGN KEY(laboratorista_codigo) REFERENCES Laboratorista(codigo),
	FOREIGN KEY(citaExamen_codigo) REFERENCES Examen(codigo)
);

INSERT INTO Usuario VALUES('aguare','Administrador','MARCOS AGUARE','+fVzxZgi5GI=');
INSERT INTO Administrador VALUES('ADD','MARCOS AGUARE',3300385321201);