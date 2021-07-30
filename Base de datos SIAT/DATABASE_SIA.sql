USE SIA;

CREATE TABLE Vehiculos(
    Placa VARCHAR(10) PRIMARY KEY NOT NULL,
    Marca varchar(30) NOT NULL,
    Modelo year NOT NULL,
    Numero_Sillas Int(3) NOT NULL,
    Motor VARCHAR(20) NOT NULL,
    Estado VARCHAR(10) NOT NULL,
    Medida_Ancho FLOAT(5) NOT NULL,
    Medida_Altura FLOAT(5) NOT NULL
)


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