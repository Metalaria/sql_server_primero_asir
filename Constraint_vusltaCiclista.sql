ALTER TABLE [VEHICULOS]
ADD constraint FK_VEHICULOS FOREIGN KEY (Id_Equipo) REFERENCES Equipos (Id_Equipo);
GO

ALTER TABLE[Ciclistas_Equipos]
ADD constraint FK_Ciclistas_Equipos1 FOREIGN KEY (Id_Ciclista) REFERENCES Ciclistas (DNI);
GO

ALTER TABLE [Ciclistas_Equipos]
ADD constraint FK_Ciclistas_Equipos2 FOREIGN KEY (Id_Equipo) REFERENCES Equipos(Id_Equipo);
GO

ALTER TABLE [Ediciones_Ciclistas]
ADD constraint FK_Ediciones_Ciclistas1 FOREIGN KEY (Id_Ciclista) REFERENCES Ciclistas (DNI);
GO

ALTER TABLE [Ediciones_Ciclistas]
ADD constraint FK_Ediciones_Ciclistas2 FOREIGN KEY (Edición) REFERENCES Ediciones (Edición);
GO

ALTER TABLE [Etapas_Ciclistas]
ADD constraint FK_Etapas_Ciclistas1 FOREIGN KEY (Id_Ciclista) REFERENCES Ciclistas (DNI);
GO

ALTER TABLE [Etapas_Ciclistas]
ADD constraint FK_Etapas_Ciclistas2 FOREIGN KEY (Edición, Etapa) REFERENCES Etapas (Edición, Etapa);
GO

ALTER TABLE [Etapas]
ADD constraint FK_Etapas FOREIGN KEY (Edición) REFERENCES Ediciones (Edición);
GO

ALTER TABLE [Ediciones]
ADD constraint CK_Ediciones_Etapas CHECK ([N_Etapa]>=20 AND [N_Etapa]<=25);
GO

ALTER TABLE [Ediciones]
ADD constraint CK_Ediciones_Fecha CHECK ([Año]>=1980 AND [Año]<=2020);
GO

ALTER TABLE [Ediciones]
ADD constraint CK_Ediciones_Edición CHECK ([Edición]>=1);
GO

ALTER TABLE [Ediciones]
ADD constraint CK_Ediciones_Fechas CHECK ([Fecha_Inicio]<[Fecha_Fin]);
GO

ALTER TABLE [Etapas]
ADD constraint CK_Etapas CHECK ([Etapa]>=1 AND [Etapa]<=25);
GO

ALTER TABLE [Etapas]
ADD constraint CK_Etapas_Tipo CHECK (Tipo_Etapa='Llana' OR Tipo_Etapa='Montaña' OR Tipo_Etapa='Contrarreloj equipos' OR Tipo_Etapa='Contrarreloj individual');
GO

ALTER TABLE [Etapas]
ADD constraint CK_Etapas_N_Kilometros CHECK ([N_Kilometros]>=0 AND [N_Kilometros]<=500);
GO

ALTER TABLE [Etapas]
ADD constraint CK_Etapas_Edición CHECK ([Edición]>=1);
GO

ALTER TABLE [Equipos]
ADD constraint CK_Equipos_Id CHECK ([Id_Equipo] like '[0-9][0-9][B-D,F-H,J-N,P-T,V-Z][B-D,F-H,J-N,P-T,V-Z]');
GO

ALTER TABLE [Ciclistas]
ADD constraint CK_Ciclistas_DNI CHECK (DNI>0 and DNI<99999999);
GO

ALTER TABLE [Ciclistas]
ADD [Edad] (gatedate()-[Fecha_Nac]);
GO

ALTER TABLE [Ciclistas_Equipos]
ADD constraint CK_Equipos_Años_Cont CHECK([N_Años_Cont]>=1);
GO

ALTER TABLE [Ciclistas_Equipos]
ADD constraint CK_Equipos_Año CHECK([Fecha_Inicial]>=01/01/1980);
GO

ALTER TABLE [VEHICULOS]
ADD constraint CK_VEHICULOS_Matrícula CHECK ([Matrícula] like '[0-9][0-9][0-9][0-9][B-D,F-H,J-N,P-T,V-Z][B-D,F-H,J-N,P-T,V-Z][B-D,F-H,J-N,P-T,V-Z]');
GO

ALTER TABLE [VEHICULOS]
ADD constraint CK_VEHICULOS_Tipo CHECK (Tipo='Turismo' OR Tipo='Camión' OR Tipo='Motocicleta');