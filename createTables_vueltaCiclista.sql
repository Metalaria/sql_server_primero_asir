USE gmmoreno_1;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_VEHICULOS')
ALTER TABLE [VEHICULOS]
DROP constraint FK_VEHICULOS;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Ciclistas_Equipos1')
ALTER TABLE[Ciclistas_Equipos]
DROP constraint FK_Ciclistas_Equipos1 ;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Ciclistas_Equipos2')
ALTER TABLE [Ciclistas_Equipos]
DROP constraint FK_Ciclistas_Equipos2;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Ediciones_Ciclistas1')
ALTER TABLE [Ediciones_Ciclistas]
DROP constraint FK_Ediciones_Ciclistas1;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Ediciones_Ciclistas2')
ALTER TABLE [Ediciones_Ciclistas]
DROP constraint FK_Ediciones_Ciclistas2;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Etapas_Ciclistas1')
ALTER TABLE [Etapas_Ciclistas]
DROP constraint FK_Etapas_Ciclistas1;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Etapas_Ciclistas2')
ALTER TABLE [Etapas_Ciclistas]
DROP constraint FK_Etapas_Ciclistas2;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME LIKE 'FK_Etapas')
ALTER TABLE [Etapas]
DROP constraint FK_Etapas;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Ciclistas')
DROP TABLE [Ciclistas];
GO

CREATE TABLE [Ciclistas](
[DNI] [int] constraint PK_Ciclistas PRIMARY KEY,
[Nombre] [varchar](20) NOT NULL,
[Apellido1] [varchar] (20) NOT NULL,
[Apellido2] [varchar] (20),
[Fecha_Nac] [datetime] NOT NULL,
[Edad] [int]);
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Equipos')
DROP TABLE [Equipos];
GO

CREATE TABLE [Equipos](
[Id_Equipo] [char](4)constraint PK_Equipos PRIMARY KEY,
[Nombre] [varchar](20) NOT NULL,
[Nacionalidad] [varchar](20) NOT NULL);
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Ediciones')
DROP TABLE [Ediciones];
GO

CREATE TABLE [Ediciones](
[Edición][smallint] constraint PK_Ediciones PRIMARY KEY,
[Fecha_Inicio][datetime] NOT NULL,
[Fecha_Fin][datetime] NOT NULL,
[N_Etapa][integer] NOT NULL default '20',
[Año][integer] NOT NULL);
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Etapas')
DROP TABLE [Etapas];
GO

CREATE TABLE [Etapas](
[Edición][smallint],
[Etapa][smallint],
[Ciudad_Origen][varchar](50) NOT NULL,
[Ciudad_Destino][varchar](50) NOT NULL,
[Tipo_Etapa] [varchar](30) NOT NULL,
[N_Kilometros][float] NOT NULL,
constraint PK_Etapas PRIMARY KEY (Edición, Etapa));
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'VEHICULOS')
DROP TABLE [VEHICULOS];
GO

CREATE TABLE [VEHICULOS](
[Matrícula][char](7) constraint PK_VEHICULOS PRIMARY KEY,
[Tipo][varchar](20) NOT NULL default 'Turismo',
[Id_Equipo][char](4));
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Ciclistas_Equipos')
DROP TABLE [Ciclistas_Equipos];
GO

CREATE TABLE [Ciclistas_Equipos](
[Id_Ciclista][int],
[Id_Equipo][char](4),
[Fecha_Inicial][datetime],
[N_Años_Cont][smallint],
constraint PK_Ciclistas_Equipos PRIMARY KEY (Id_Ciclista,Id_Equipo));
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Ediciones_Ciclistas')
DROP TABLE [Ediciones_Ciclistas];
GO

CREATE TABLE [Ediciones_Ciclistas](
[Id_Ciclista][int],
[Edición][smallint],
[Tiempo][real],
[Posición][smallint],
constraint PK_Edición_Ciclista PRIMARY KEY (Id_Ciclista,Edición));
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'Etapas_Ciclistas')
DROP TABLE [Etapas_Ciclistas];
GO

CREATE TABLE[Etapas_Ciclistas](
[Edición][smallint],
[Etapa][smallint],
[Id_Ciclista][int],
[Tiempo][float],
[Posición][int],
constraint PK_Etapas_Ciclistas PRIMARY KEY (Edición,Etapa,Id_Ciclista));