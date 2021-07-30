USE DB_SIAT;

CREATE TABLE Vehiculos(
    Placa VARCHAR(10) PRIMARY KEY NOT NULL,
    Marca varchar(30) NOT NULL,
    Modelo year NOT NULL,
    Numero_Sillas Int(3) NOT NULL,
    Motor VARCHAR(20) NOT NULL,
    Estado VARCHAR(10) NOT NULL,
    Medida_Ancho FLOAT(5) NOT NULL,
    Medida_Altura FLOAT(5) NOT NULL
);


CREATE TABLE Conductor(
    Numero_identificacion VARCHAR(10) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Apellido VARCHAR(30) NOT NULL,
    Licencia_conduccion VARCHAR(10) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    
    FOREIGN KEY(Placa) REFERENCES Vehiculos(Placa)
);


CREATE TABLE Ficha_tecnica(
    Fecha_creacion DATE PRIMARY KEY NOT NULL,
    Propietario VARCHAR(50) NOT NULL,
    Soat VARCHAR(20) NOT NULL,
    Tecnomecanica VARCHAR(20) NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    
    FOREIGN KEY(Placa) REFERENCES Vehiculos(Placa)
);


CREATE TABLE Ruta(
    Numero_ruta Integer(100) PRIMARY KEY NOT NULL,
    Numero_estudiantes Integer(100),
    Hubicacion_GPS VARCHAR (100) NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    Origen VARCHAR(30) NOT NULL,
    Destino VARCHAR(30) NOT NULL,
    
    FOREIGN KEY(Placa) REFERENCES Vehiculos(Placa)
);



CREATE TABLE Estudiantes(
    Numero_Identificacion VARCHAR(15) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(15) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    Grado VARCHAR(5) NOT NULL,
    Edad INTEGER(2) NOT NULL,
    Numero_ruta Integer(100) NOT NULL,
    
    FOREIGN KEY(Numero_ruta) REFERENCES Ruta(Numero_ruta)
);



CREATE TABLE Institucion(
    Nit VARCHAR(20) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    Numero_Identificacion VARCHAR(15) NOT NULL,
    
    FOREIGN KEY(Numero_Identificacion) REFERENCES Estudiantes(Numero_Identificacion)
);


CREATE TABLE Padre_familia(
    Cedula VARCHAR(10) PRIMARY KEY NOT NULL,
    Nombre_padre VARCHAR(15) NOT NULL,
    Apellido_padre VARCHAR(15) NOT NULL,
 	Numero_Identificacion VARCHAR(15) NOT NULL,
    Telefono_padre VARCHAR(20) NOT NULL,
    Email_padre VARCHAR(30) NOT NULL,
    
    FOREIGN KEY(Numero_Identificacion) REFERENCES Estudiantes(Numero_Identificacion)
);


CREATE TABLE Monitor_ruta(
    Cedula_monitor VARCHAR(15) PRIMARY KEY NOT NULL,
    Nombre_monitor VARCHAR(15) NOT NULL,
    Apellido_monitor VARCHAR(15) NOT NULL,
    Telefono_monitor VARCHAR(5) NOT NULL,
    Email_monitor INTEGER(2) NOT NULL,
    Numero_ruta Integer(100) NOT NULL,
    
    FOREIGN KEY(Numero_ruta) REFERENCES Ruta(Numero_ruta)
);


CREATE TABLE Alertas(
    Codigo VARCHAR(15) PRIMARY KEY NOT NULL,
    Tipo VARCHAR(15) NOT NULL,
    Remitente VARCHAR(15) NOT NULL,
    Receptor VARCHAR(15) NOT NULL,
    Numero_ruta Integer(100) NOT NULL,
    Cedula Varchar(10) NOT NULL,
    
    FOREIGN KEY(Numero_ruta) REFERENCES Ruta(Numero_ruta),
    FOREIGN KEY(Cedula) REFERENCES Padre_familia(Cedula)
);