
CREATE  TABLE Funcionalidad (
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  descripcion NVARCHAR(255) NULL ,
  )

CREATE  TABLE Rol(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  descripcion NVARCHAR(255) NULL,
  baja INT DEFAULT 0,
  )

CREATE  TABLE Usuario (
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  usuario NVARCHAR(255) NOT NULL,
  pass NVARCHAR(255) NULL ,
  baja INT default 0,
  fechaBaja DATE,
  )

CREATE  TABLE RolxFuncionalidad (
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idRol INT REFERENCES Rol(id) ,
  idFuncionalidad INT REFERENCES Funcionalidad(id) ,
  )

CREATE  TABLE RolxUsuario(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idRol INT REFERENCES Rol(id) ,
  idUsuario INT REFERENCES Usuario(id) ,
  )

CREATE  TABLE Paciente (
  id INTEGER PRIMARY KEY NOT NULL IDENTITY,
  nombreApellido NVARCHAR(255) NOT NULL ,
  tipoDocumento VARCHAR NOT NULL,
  documento INT NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(255),
  fechaNacimiento DATE NOT NULL,
  sexo CHAR NOT NULL,
  estadoCivil VARCHAR(10) NOT NULL,
  cantFamiliares INT DEFAULT 0,
  cantConsultas INT DEFAULT 0,
   )

CREATE  TABLE Agenda(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY,
  idProfesional INT REFERENCES Professional(id),
  fechaInicio DATE NOT NULL,   -- ACA PARA FECHA DEL A�O QUE TRABAJA Y HORARIO
  fechaFinal DATE NOT NULL,
  diaInicio VARCHAR(10),   -- ACA PARA LUNES Y MARTES
  )

CREATE  TABLE Profesional (
  id INTEGER PRIMARY KEY NOT NULL IDENTITY,
  nombreApellido NVARCHAR(255) NOT NULL ,
  tipoDocumento VARCHAR NOT NULL,
  documento INT NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(255),
  fechaNacimiento DATE NOT NULL,
  sexo CHAR NOT NULL,
  idAgenda INT REFERENCES Agenda(id),
   )

CREATE  TABLE CompraBono(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY,
  idPaciente INT REFERENCES Paciente(id),
  cantidad INT NOT NULL DEFAULT 1,
  monto INT NOT NULL,
   )

CREATE  TABLE Servicio(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  precioBono INT NOT NULL,
  precioCuota INT NOT NULL,
  baja INT DEFAULT 0,
   )

CREATE  TABLE Modificacion(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idPaciente INT REFERENCES Paciente(id),
  idPlan INT REFERENCES Servicio(id),
  fecha DATE,
   )

CREATE  TABLE Bono(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idPaciente INT REFERENCES Paciente(id),
  idPlan INT REFERENCES Servicio(id),
  idCompraBono INT REFERENCES CompraBono(id),
   )

CREATE  TABLE ConsultaMedica(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idBono INT REFERENCES Bono(id),
  fecha DATE NOT NULL,
  diagnostico VARCHAR(255) NOT NULL,
  sintomas VARCHAR(255),
   )

CREATE  TABLE Turno(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idProfesional INT REFERENCES Profesional(id),
  idPaciente INT REFERENCES Paciente(id),
  idConsultaMedica INT REFERENCES ConsultaMedica(id),
  fecha DATE NOT NULL,
  baja INT default 0,
  )

CREATE TABLE Cancelacion(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idConsultaMedica INT REFERENCES ConsultaMedica(id),
  tipoCancelacion INT NOT NULL,
  motivo VARCHAR(255),
  )

CREATE TABLE CancelacionProfesional(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idProfesional INT REFERENCES Profesional(id),
  fecha DATE NOT NULL
  )

CREATE TABLE Especialidad(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  descripcion VARCHAR(255),
  tipoEspecialidad VARCHAR(30) NOT NULL,
  )

CREATE TABLE EspecialidadXProfesional(
  id INTEGER PRIMARY KEY NOT NULL IDENTITY ,
  idEspecialidad INT REFERENCES Especialidad(id) ,
  idProfesional INT REFERENCES Profesional(id) ,
  )




  






