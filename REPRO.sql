CREATE TABLE Cliente (
    ClienteId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    APaterno VARCHAR(50),
    AMaterno VARCHAR(50),
    NCelular VARCHAR(10),
    Password VARCHAR(10)
);

CREATE TABLE CuentaBancaria (
    CuentaBancariaId INTEGER PRIMARY KEY,
    SaldoActual INTEGER,
    ClienteId INTEGER,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);

CREATE TABLE Transaccion (
    TransaccionId INTEGER PRIMARY KEY,
    CuentaBancariaId INTEGER,
    FOREIGN KEY (CuentaBancariaId) REFERENCES CuentaBancaria(CuentaBancariaId)
);


--TABLE
CREATE TABLE Client (
    ClientId INTEGER PRIMARY KEY,
    UpdatedBy INTEGER,
    Name VARCHAR(50),
    LastName VARCHAR(50),
    Cell VARCHAR(10),
    Email VARCHAR(50),
    Observations VARCHAR(300),
    Active BOOLEAN,
    CreatedDate DATETIME,
    UpdatedDate DATETIME
);

CREATE TABLE UserUc (
    UserUcId INTEGER PRIMARY KEY,
    CreatedDate DATETIME,
    UpdatedBy INTEGER,
    Username VARCHAR(100),
    Password VARCHAR(100),
    LastAccess DATETIME,
    Active BOOLEAN,
    CreatedBy INTEGER,
    UpdatedDate DATETIME
);

CREATE TABLE Ticket (
    TicketId INTEGER PRIMARY KEY,
    RaffleId INTEGER,
    ClientId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    FOREIGN KEY (RaffleId) REFERENCES NFRRaffle(RaffleId),
    FOREIGN KEY (ClientId) REFERENCES NFRClient(ClientId),
    FOREIGN KEY (CreatedBy) REFERENCES NFRUserUc(UserUcId),
    FOREIGN KEY (UpdatedBy) REFERENCES NFRUserUc(UserUcId)
);

CREATE TABLE Raffle (
    RaffleId INTEGER PRIMARY KEY,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Description VARCHAR(300),
    StartDate DATETIME,
    RaffleDate DATETIME,
    Active BOOLEAN,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    FOREIGN KEY (CreatedBy) REFERENCES UserUc(UserUcId),
    FOREIGN KEY (UpdatedBy) REFERENCES UserUc(UserUcId)
);

CREATE TABLE Prize (
    PrizeId INTEGER PRIMARY KEY,
    RaffleId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Product VARCHAR(100),
    Active BOOLEAN,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId),
    FOREIGN KEY (CreatedBy) REFERENCES UserUc(UserUcId),
    FOREIGN KEY (UpdatedBy) REFERENCES UserUc(UserUcId)
);

CREATE TABLE Winner (
    WinnerId INTEGER PRIMARY KEY,
    TicketId INTEGER,
    PrizeId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    FOREIGN KEY (TicketId) REFERENCES Ticket(TicketId),
    FOREIGN KEY (PrizeId) REFERENCES Prize(PrizeId),
    FOREIGN KEY (CreatedBy) REFERENCES UserUc(UserUcId),
    FOREIGN KEY (UpdatedBy) REFERENCES UserUc(UserUcId)
);



--TABLE
CREATE TABLE Escuela (
    EscuelaId INTEGER PRIMARY KEY,
    NombreDeLaEscuela VARCHAR(70),
    Direccion VARCHAR(400)
);

CREATE TABLE Tutor (
    TutorId INTEGER PRIMARY KEY,
    NombreCompleto VARCHAR(50),
    FirmoCartaCompromiso BOOLEAN
);

CREATE TABLE Estudiante (
    ClienteId INTEGER PRIMARY KEY,
    Nombre VARCHAR(100),
    APaterno VARCHAR(50),
    AMaterno VARCHAR(50),
    FechaRegistro DATE,
    Genero CHAR(1),
    SuscripcionId INTEGER,
    FechaNacimiento DATE,
    CURP VARCHAR(50),
    EscuelaId INTEGER,
    FOREIGN KEY (SuscripcionId) REFERENCES NFRSuscripcion(SuscripcionId),
    FOREIGN KEY (EscuelaId) REFERENCES NFREscuela(EscuelaId)
);

CREATE TABLE EstudianteTutor (
    EstudianteTutorId INTEGER PRIMARY KEY,
    EstudianteId INTEGER,
    TutorId INTEGER,
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(ClienteId),
    FOREIGN KEY (TutorId) REFERENCES Tutor(TutorId)
);

CREATE TABLE Suscripcion (
    SuscripcionId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    Costo DECIMAL,
    Periodo VARCHAR(50)
);

CREATE TABLE Pago (
    PagoId INTEGER PRIMARY KEY,
    FechaDeAplicacion DATE,
    SuscripcionId INTEGER,
    ClienteId INTEGER,
    Cantidad DECIMAL,
    FOREIGN KEY (SuscripcionId) REFERENCES Suscripcion(SuscripcionId),
    FOREIGN KEY (ClienteId) REFERENCES Estudiante(ClienteId)
);

CREATE TABLE EstudianteGrado (
    EstudianteGradoId INTEGER PRIMARY KEY,
    ClienteId INTEGER,
    GradoId INTEGER,
    FechaObtencion DATE,
    FOREIGN KEY (ClienteId) REFERENCES Estudiante(ClienteId),
    FOREIGN KEY (GradoId) REFERENCES Grado(GradoId)
);

CREATE TABLE Grado (
    GradoId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    ColorDeCinta VARCHAR(50)
);

CREATE TABLE Categoria (
    CategoriaId INTEGER PRIMARY KEY,
    NombreCategoria VARCHAR(50),
    Active BOOLEAN
);

CREATE TABLE Examen (
    ExamenId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    Notas VARCHAR(50),
    CategoriaId INTEGER,
    FOREIGN KEY (CategoriaId) REFERENCES Categoria(CategoriaId)
);

CREATE TABLE Pregunta (
    PreguntaId INTEGER PRIMARY KEY,
    ExamenId INTEGER,
    TextoPregunta VARCHAR(700),
    R1 VARCHAR(50),
    R2 VARCHAR(50),
    R3 VARCHAR(50),
    RespuestaCorrecta VARCHAR(2),
    FOREIGN KEY (ExamenId) REFERENCES Examen(ExamenId)
);

CREATE TABLE Usuario (
    UsuarioId INTEGER PRIMARY KEY,
    Nickname VARCHAR(50),
    Password VARCHAR(32),
    FechaRegistro DATE,
    Column1 VARCHAR(50)
);

CREATE TABLE Estudiante (
    EstudianteId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    FechaRegistro DATETIME,
    UsuarioId INTEGER,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(UsuarioId)
);

CREATE TABLE ExamenEstudiante (
    ExamenEstudianteId INTEGER PRIMARY KEY,
    ExamenId INTEGER,
    EstudianteId INTEGER,
    Calificacion INTEGER,
    FechaRegistro DATETIME,
    FOREIGN KEY (ExamenId) REFERENCES Examen(ExamenId),
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId)
);

--TABLE
CREATE TABLE Cliente (
    ClienteId INTEGER PRIMARY KEY,
    Nombre VARCHAR(50),
    APaterno VARCHAR(50),
    AMaterno VARCHAR(50),
    nCelular VARCHAR(10),
    Password VARCHAR(10)
);

CREATE TABLE Transaccion (
    TransaccionId INTEGER PRIMARY KEY,
    ClienteId INTEGER,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);

CREATE TABLE CuentaBancaria (
    CuentaBancariaId INTEGER PRIMARY KEY,
    SaldoActual INTEGER,
    ClienteId INTEGER,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(ClienteId)
);