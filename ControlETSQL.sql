CREATE TABLE EstatusEst (
    EstatusEstId INT IDENTITY(1,1)PRIMARY KEY,
    NombreEstatus VARCHAR (50) NOT NULL,
    Active BIT NOT NULL DEFAULT 1,
);

CREATE TABLE Periodo(
    PeriodoId INT IDENTITY(1,1) PRIMARY KEY,
    NombrePeriodo VARCHAR (50) NOT NULL
);

CREATE TABLE Carrera(
    CarrearaId INT IDENTITY(1,1)PRIMARY KEY,
    Nombre VARCHAR(50),
    Clave VARCHAR(50),
    Active BIT NOT NULL DEFAULT 1
);

CREATE TABLE TipoUsuario(
    INT IDENTITY (1,1)PRIMARY KEY,
    NombreTipo VARCHAR (50)NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Usuario(
    UsuarioId INT IDENTITY (1,1) PRIMARY KEY,
    NickName VARCHAR (50)NOT NULL,
    Contraseña VARCHAR (50)NOT NULL,
    TipoUsuarioId INT NOT NULL,
    Ultimo acceso DATE NOT NULL,
    FechaRegistro DATE TIME NOT NULL,
    Active BIT NOT NULL DEFAULT 1
);

CREATE TABLE Estudiante(
    Estudianteid INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR (50) NOT NULL,
    APaterno VARCHAR(50) NOT NULL,
    AMaterno VARCHAR (50) NOT NULL,
    AnioIngreso DATE NOT NULL,
    Periodo INT NOT NULL,
    Celular VARCHAR(12) NOT NULL,
    Email VARCHAR (50) NOT NULL,
    EstatusEstId INT NOT NULL,
    FechaNacimiento DATE NOT NULL,
    UsuarioId INT INT NOT NULL,
    CreadoPor INT NOT NULL,
    CarrearaId INT NOT NULL,
    FOREING KEY (PeriodoId)REFERENCES Periodo (PeriodoId),
    FOREING KEY (EstatusEstId)REFERENCES EstatusEst (EstatusEstId),
    fOREING KEY (UsuarioId) REFERENCES Usuario (UsuarioId),
    FOREING KEY (CarreraId) REFERENCES Carrera(CarreraId) 
);

CREATE TABLE Domicilio(
    DomicilioId INT IDENTITY(1,1)PRIMARY KEY,
    Direccion VARCHAR(100)NOT NULL,
    EstudianteId INT NOT NULL,
    FOREING KEY (EstudianteId)REFERENCES Estudiante (EstudianteId)
);

CREATE TABLE Materia (
        MateriaId INT IDENTITY (1,1)PRIMARY KEY,
        Nombre VARCHAR(50) NOT NULL,
        Active BIT NOT NULL,
        Clave VARCHAR (20),
        CarreraId INT NOT NULL,
        FORENG KEY  (CarreraId)REFERENCES Carrera (CarreraId)
);

CREATE TABLE Profesor(
    ProfesorId INT IDENTITY (1,1)PRIMARY KEY,
    Nombre VARCHAR(50)NOT NULL,
    APaterno VARCHAR (50),
    AMaterno VARCHAR (50),
    Active BIT NOT NULL DEFAULT 1,
    Rfc VARCHAR (50),
    CarreraId INT NOT NULL,
    UsuarioId INT NOT NULL,
    FOREING KEY (CarrearaId) REFERENCES Carrera (CarrearaId),
    FOREING KEY (UsuarioId) REFERENCES Usuario (UsuarioId)
);

CREATE TABLE Clase(
    ClaseId INT IDENTITY (1,1)PRIMARY KEY,
    Nombre VARCHAR (50)NOT NULL,
    Horario VARCHAR (50)NOT NULL,
    MateriaId INT NOT NULL,
    Active BIT NOT NULL DEFAULT 1,
    ProfesorId INT NOT NULL,
    EstatusClaseId INT NOT NULL,
    Periodo INT NOT NULL,
    Año INT NOT NULL,
    FOREING KEY (MateriaId)REFERENCES Materia (MateriaId),
    FOREING KEY (ProfesorId) REFERENCES Profesor (ProfesorId),
    FOREING KEY (EstudianteClaseId)REFERENCES EstudianteClase (EstudianteClaseId),
    FOREING KEY (PeriodoId)REFERENCES Periodo (PeriodoId)
);

CREATE TABLE EsatusClase(
    EstatusClaseId INT IDENTITY(1,1)PRIMARY KEY,
    NombreEstatus VARCHAR (50)NOT NULL
);

CREATE TABLE EstudianteClase(
    EstudianteClaseId INT IDENTITY(1,1)PRIMARY KEY,
    ClaseId INT NOT NULL,
    EstudianteId INT NOT NULL,
    FOREING KEY (EstudianteId)REFERENCES Estudiante (EstudianteId),
    FOREING KEY (ClaseId)REFERENCES Clase (ClaseId)
);

 CREATE TABLE TipoActividad(
    TipoActividadId INT IDENTITY (1,1)PRIMARY KEY,
    Nombre VARCHAR (50) NOT NULL,
    Observaciones VARCHAR (50)
 );

 CREATE TABLE Actividad(
    Actividad INT IDENTITY(1,1)PRIMARY KEY,
    Nombre VARCHAR (50)NOT NULL,
    Descripcion VARCHAR (50),
    ClaseId INT NOT NULL,
    valorMaximo INT,
    FechaExpiracion DATETIME NOT NULL,
    TipoActividadId INT NOT NULL,
    FOREING KEY (ClaseId)REFERENCES Clase (ClaseId),
    FOREING KEY (TipoActividadId) REFERENCES TipoActividad(TipoActividadId)
 );

 CREATE TABLE EstudianteActividad(
    EstudianteActividadId INT IDENTITY (1,1)PRIMARY KEY,
    FechaRegistro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Calificacion DECIMAL (5,2)NOT NULL DEFAULT 0.00,
    EstudianteId INT NOT NULL,
    ClaseId INT NOT NULL,
    ActividadId INT NOT NULL,
    FOREING KEY (EstudianteId)REFERENCES Estudiante (EstudianteId),
    FOREING KEY (ClaseId)REFERENCES Clase(ClaseId),
    FOREING KEY (ActividadId)REFERENCES Actividad (ActividadId)
 );

CREATE TABLE EstudianteEvaluacion(
    EstudianteEvaluacionId INT IDENTITY (1,1)PRIMARY KEY,
    UnidadI DECIMAL (2,4)NOT NULL DEFAULT 0.0000,
    UnidadII DECIMAL (2,4)NOT NULL DEFAULT 0.0000,
    UnidadIII DECIMAL (2,4)NOT NULL DEFAULT 0.0000,
    PuntosExtras INT NOT NULL DEFAULT 0,
    ClaseId INT NOT NULL,
    EstudianteId INT NOT NULL,
    FOREING KEY (ClaseId)REFERENCES Clase (ClaseId),
    FOREING KEY (EstudianteId)REFERENCES Esrudiante (EstudianteId)
);