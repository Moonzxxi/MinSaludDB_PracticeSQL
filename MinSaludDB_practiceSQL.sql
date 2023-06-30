
--(MESA 5)
--YAMILKA HENRIQUEZ - 1088537
--LETICIA SANCHEZ   - 1087298
--SALMA MARMOL      - 1085618

--Script de Ministerio de Salud


--CREACION DE LA BASE DE DATOS
CREATE DATABASE DBSaludPublica
USE DBSaludPublica

--CRECION DE LAS TABLAS
CREATE TABLE [Tbl_Habitacion] (
  [ID_Habitacion] INT,
  [NumeroCama] INT,
  PRIMARY KEY ([ID_Habitacion])
);

CREATE TABLE [Tbl_TipoAministracion] (
  [ID_TipoAdm] INT,
  [NombreTA] Varchar(11),
  PRIMARY KEY ([ID_TipoAdm])
);

CREATE TABLE [Tbl_TipoCentro] (
  [ID_TipoC] INT,
  [NombreTipoC] Varchar(50),
  PRIMARY KEY ([ID_TipoC])
);

CREATE TABLE [Tbl_Rol] ( 
  [ID_Rol] INT,
  [NombreRol] Varchar(50),
  PRIMARY KEY ([ID_Rol])
);


CREATE TABLE [Tbl_Estado] (
  [ID_Estado] INT,
  [NombreEstado] Char(10),
  PRIMARY KEY ([ID_Estado])
);

CREATE TABLE [Tbl_Especialidad] (
  [ID_Especialidad] INT,
  [NombreEspecialidad] Varchar(50),
  PRIMARY KEY ([ID_Especialidad])
);

CREATE TABLE [Tbl_SubEspecialidad] (
  [ID_SubEspecialidad] INT,
  [NombreSubEspecialidad] Varchar(50),
  PRIMARY KEY ([ID_SubEspecialidad])
);

CREATE TABLE [Tbl_Provincia] (
  [ID_Provincia] INT,
  [Provincia] Varchar(50),
  PRIMARY KEY ([ID_Provincia])
);
CREATE TABLE [Tbl_PersonalMed] (
  [ID_PersonalMed] INT,
  PRIMARY KEY ([ID_PersonalMed])
);
CREATE TABLE [Tbl_Ciudad] (
  [ID_Ciudad] INT IDENTITY,
  [ID_Provincia1] INT REFERENCES Tbl_Provincia(ID_Provincia),
  [NomCiudad] Varchar(50),
  PRIMARY KEY ([ID_Ciudad])
);

CREATE TABLE [Tbl_Ala] (
  [ID_Ala] INT,
  [ID_Especialidad1] INT REFERENCES Tbl_Especialidad(ID_Especialidad),
  [NomAla] Varchar (50),
  PRIMARY KEY ([ID_Ala])
);

CREATE TABLE [Tbl_AlaHabitacion] ( 
  [ID_AlaHabitacion] INT,
  [ID_Ala1] INT REFERENCES Tbl_Ala(ID_Ala),
  [ID_Habitacion1] INT REFERENCES Tbl_Habitacion(ID_Habitacion),
  PRIMARY KEY ([ID_AlaHabitacion]),
);

CREATE TABLE [Tbl_Personal_Adm] (
  [ID_PersonalAdm] INT,
  [ID_Rol1] INT REFERENCES Tbl_Rol(ID_Rol),
  [ID_Centro6] INT,
  [ID_Estado7] INT REFERENCES Tbl_Estado(ID_Estado),
  PRIMARY KEY ([ID_PersonalAdm])
);

CREATE TABLE [Tbl_RegistroPersonal] (
  [ID_Personal] INT,
  [ID_PersonalAdm9] INT REFERENCES Tbl_Personal_Adm(ID_PersonalAdm),
  [ID_PersonalMed2] INT REFERENCES Tbl_PersonalMed(ID_PersonalMed),
  [NombrePers] Varchar(50),
  [ApellidoPers] Varchar(50),
  [Cedula] Char(11),
  [DireccionPers] Varchar(50),
  [TelefonoPers] Char(10),
  [FechaIngreso] Date,
  PRIMARY KEY ([ID_Personal])
);
CREATE TABLE [Tbl_Centro] (
  [ID_Centro] INT,
  [ID_TipoC1] INT REFERENCES Tbl_TipoCentro(ID_TipoC),
  [ID_TipoAdm] INT REFERENCES Tbl_TipoAministracion(ID_TipoAdm),
  [ID_Provincia4] INT REFERENCES Tbl_Provincia(ID_Provincia),
  [ID_Personal1] INT REFERENCES Tbl_RegistroPersonal(ID_Personal),
  [NombreCentro] Varchar(50),
  [DireccionCentro] Varchar(50),
  [TelCentro] Char(10),
  PRIMARY KEY ([ID_Centro])
);

CREATE TABLE [Tbl_CentroPersonalMed] (
  [ID_CentroMed] INT,
  [ID_PersonalMed1] INT REFERENCES Tbl_PersonalMed(ID_PersonalMed),
  [ID_Centro1] INT REFERENCES Tbl_Centro(ID_Centro),
  [ID_Estado1] INT REFERENCES Tbl_Estado(ID_Estado),
  PRIMARY KEY ([ID_CentroMed])
);

CREATE TABLE [Tbl_TipoSala] ( --LISTO
  [ID_TipoSala] INT,
  [TipoSala] Varchar(100),
  PRIMARY KEY ([ID_TipoSala])
);

CREATE TABLE [Tbl_Sala] (
  [ID_Sala] INT,
  [ID_Ala3] INT REFERENCES Tbl_Ala(ID_Ala),
  [ID_TipoSala9] INT REFERENCES Tbl_TipoSala(ID_TipoSala),
  PRIMARY KEY ([ID_Sala])
);
CREATE TABLE [Tbl_CentroAla] (
  [ID_CentroAla] INT,
  [ID_Centro3] INT REFERENCES Tbl_Centro(ID_Centro),
  [ID_Ala5] INT REFERENCES Tbl_Ala(ID_Ala),
  PRIMARY KEY ([ID_CentroAla])
);
CREATE TABLE [Tbl_RolMedico] (
  [ID_RolMedico] INT,
  [ID_CentroMed1] INT REFERENCES Tbl_CentroPersonalMed(ID_CentroMed),
  [ID_PersonalAdm1] INT REFERENCES Tbl_Personal_Adm(ID_PErsonalAdm),
  PRIMARY KEY ([ID_RolMedico])
);

CREATE TABLE [Tbl_Esp_Sub_Esp] (
  [ID_Sub_Esp] INT,
  [ID_Especialidad3] INT REFERENCES Tbl_Especialidad(ID_Especialidad),
  [ID_SubEspecialidad3] INT REFERENCES Tbl_SubEspecialidad(ID_SubEspecialidad),
  [ID_PersonalMed4] INT REFERENCES Tbl_PersonalMed(ID_PersonalMed),
  PRIMARY KEY ([ID_Sub_Esp])
);

CREATE TABLE [Tbl_Especialidad_Personal] (
  [ID_Esp-Pers] INT,
  [ID_Sub_Esp] INT REFERENCES Tbl_SubEspecialidad(ID_SubEspecialidad),
  [ID_CentroMEd1] INT REFERENCES Tbl_CentroPersonalMEd(ID_CentroMEd),
  PRIMARY KEY ([ID_Esp-Pers])
);

--------------------------------------------------------------------------------------------------------------
ALTER TABLE Tbl_Personal_Adm ADD FOREIGN KEY (ID_Centro6) REFERENCES Tbl_Centro(ID_Centro)
-------------------------------------------------------------------------------------------------------------

---------------------------------------/*DATA*/---------------------------------

--DATOS DE LA TABLA SUBESPECIALIDAD
SELECT *FROM Tbl_SubEspecialidad

--Anestesiología/Medicina de Urgencias/Medicina Interna
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (101,'Anestesiologia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (102,'Medicina del enfermo en estado critico')

--Ginecología y obstetricia
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (201,'Medicina Materno fetal')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (202,'Endocrinologia obstretricia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (203,'Fertilidad y Reproduccion')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (204,'Ginecologia Oncologica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (205,'Biologia de la reproduccion humana')

--Imagenología
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (301,'Radiografia')

--Pediatria
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (401,'Cardiologia Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (402,'Neonatologia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (403,'Perinatologia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (404,'Gastroenterologia Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (405,'Endocrinología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (406,'Eurología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (407,'Cardiología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (408,'Nefrología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (409,'Neumología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (410,'Hemato-Oncología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (411,'Infectología Pediatrica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (412,'Intensivista Pediatrico')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (413,'Cirugía Pediatrica')

--Medicina Interna
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (501,'Cardiologia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (502,'Medicina Familiar')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (503,'	Nutriología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (504,'Neurología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (505,'Endocrinología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (506,'Hematología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (507,'Oncología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (508,'Radiología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (509,'Oncología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (510,'Gastroenterología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (511,'Reumatología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (512,'Inmunología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (513,'Dermatología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (514,'Psiquiatría')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (515,'Geriatría')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (516,'Infectología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (517,'Epidemiología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (518,'Neumología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (519,'Alergia e Inmunologia clinica')

--Cirugia general
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (601,'Angiologia')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (602,'Cirugia Vascular')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (603,'Urología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (604,'Ortopedía y Traumatología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (605,'Neurocirugía')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (606,'Cirugía plástica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (607,'Oftalmología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (608,'Fellow de cirugía vascular')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (609,'Cirugía oncológica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (610,'Cirugía de cabeza y cuello')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (611,'Cirugía Maxilofacial')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (612,'Emergenciología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (613,'Fellow de pie diabético')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (614,'Otorrinolaringología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (615,'Citología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (616,'Diabetología')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (617,'Intensivista')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (618,'Cirugía Carditorácica')
INSERT INTO Tbl_SubEspecialidad(ID_SubEspecialidad,NombreSubEspecialidad) VALUES (619,'Coloproctología')

-------------------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA ESPECIALIDAD
SELECT *FROM Tbl_Especialidad

INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (100,'Anestesiología/Medicina de Urgencias') 
INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (200,'Ginecología y obstetricia') 
INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (300,'Imagenología') 
INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (400,'Pediatria')
INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (500,'Medicina Interna')
INSERT INTO Tbl_Especialidad(ID_Especialidad,NombreEspecialidad) VALUES (600,'Cirugia general')--601-619


-------------------------------------------------------------------------------------------------------------------------------

--DATOS DE LA TABLA ESTADO
INSERT INTO Tbl_Estado
VALUES(1, 'Activo'),
(2,'Inactivo'),
(3,'Suspendido');

-------------------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA PROVINCIA
INSERT INTO Tbl_Provincia
VALUES(1,'Azua'),
(2,'Bahoruco'),
(3,'Barahona'),
(4,'Dajabón'),
(5,'Distrito Nacional'),
(6,'Duarte'),
(7,'Elias Piña'),
(8,'El Seibo'),
(9,'Espaillat'),
(10,'Hato Mayor'),
(11,'Hermanas Mirabal'),
(12,'Independencia'),
(13,'La Altagracia'),
(14,'La Romana'),
(15,'La Vega'),
(16,'Maria Trinidad Sanchez'),
(17,'Moseñor Nouel'),
(18,'Monte Cristi'),
(19,'Monte Plata'),
(20,'Samana'),
(21,'Sanchez Ramirez'),
(22,'San Cristobal'),
(23,'San Jose de Ocoa'),
(24,'San Juan'),
(25,'San Pedro de Macoris'),
(26,'Santiago'),
(27,'Santiago Rodriguez'),
(28,'Santo Domingo'),
(29,'Valverde'),
(30,'Pedernales'),
(31,'Peravia'),
(32,'Puerto Plata');

---------------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA TIPOADMINISTRACION
INSERT INTO Tbl_TipoAministracion
VALUES(1,'Publico'),
(2,'Privado'),
(3,'Mixto');

-----------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA HABITACION
INSERT INTO Tbl_Habitacion
VALUES(201,4),
(202,5),
(203,5),
(204,4),
(205,5),
(206,4),
(207,4),
(208,4),
(209,4),
(210,5),
(211,5),
(212,5),
(213,5),
(214,4),
(215,5),
(216,4),
(217,5),
(218,4),
(219,5),
(220,4),
(221,5),
(222,4),
(223,4),
(224,5),
(225,5),
(301,3),
(302,3),
(303,2),
(304,3),
(305,3),
(306,3),
(307,3),
(308,3),
(309,3),
(310,3),
(311,3),
(312,3),
(313,2),
(314,2),
(315,2),
(316,3),
(317,3),
(318,3),
(319,3),
(320,3),
(321,2),
(322,2),
(323,2),
(324,3),
(325,2),
(401,2),
(402,2),
(403,2),
(404,2),
(405,2),
(406,2),
(407,2),
(408,2),
(409,2),
(410,2),
(411,2),
(412,2),
(413,2),
(414,2),
(415,2),
(416,2),
(417,2),
(418,2),
(419,2),
(420,2),
(421,2),
(422,2),
(423,2),
(424,2),
(425,2),
(501,1),
(502,1),
(503,1),
(504,1),
(505,1),
(506,1),
(507,1),
(508,1),
(509,1),
(510,1),
(511,1),
(512,1),
(513,1),
(514,1),
(515,1),
(516,1),
(517,1),
(518,1),
(519,1),
(520,1),
(521,1),
(522,1),
(523,1),
(524,1),
(525,1),
(601,1),
(602,1),
(603,1),
(604,1),
(605,1),
(606,1),
(607,1),
(608,1),
(609,1),
(610,1),
(611,1),
(612,1),
(613,1),
(614,1),
(615,1),
(616,1),
(617,1),
(618,1),
(619,1),
(620,1),
(621,1),
(622,1),
(623,1),
(624,1),
(625,1);

-------------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA TIPO CENTRO
INSERT INTO Tbl_TipoCentro
VALUES (1,'Hospital Central'),
(2,'Hospital de Convalecientes'),
(3,'Hospital Materno'),
(4,'Hospital General'),
(5,'Hospital Geriatrico'),
(6,'Hospital Materno-Infantil'),
(7,'Hospital militar'),
(8,'Hospital Pedriatico'),
(9,'Hospital Psiquiatrico'),
(10,'Hospital Universitario');

---DATOS DE LA TABLA TipoSala
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(1,'Cirugia')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(2,'Recuperacion')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(3,'Cuidados Intensivos-UCI')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(4,'UCI Neonatos')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(5,'UCI Niños')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(6,'Labor de Parto')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(7,'Area Esteralizacion')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(8,'Farmacia')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(9,'RayosX')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(10,'Laboratorio')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(11,'Emergencias')
insert into Tbl_TipoSala(ID_TipoSala,TipoSala) values(12,'Estacion Enfermeria')
-----------------------------------------------------
---DATOS DE LA TABLA Tbl_Rol

insert into Tbl_Rol(ID_Rol,NombreRol) values(1,'Personal de limpieza')
insert into Tbl_Rol(ID_Rol,NombreRol) values(2,'Enfermero/a')
insert into Tbl_Rol(ID_Rol,NombreRol) values(3,'Administrativo')
insert into Tbl_Rol(ID_Rol,NombreRol) values(4,'Seguridad')
insert into Tbl_Rol(ID_Rol,NombreRol) values(5,'Mantenimiento')
insert into Tbl_Rol(ID_Rol,NombreRol) values(6,'Personal de facturacion')
insert into Tbl_Rol(ID_Rol,NombreRol) values(7,'Secretario/a')
insert into Tbl_Rol(ID_Rol,NombreRol) values(8,'Personal Tecnico')
insert into Tbl_Rol(ID_Rol,NombreRol) values(9,'Personal de Consejeria')
insert into Tbl_Rol(ID_Rol,NombreRol) values(10,'Residente')

-----------------------------------------------------
--DATOS CIUDAD
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Azua de compostela')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Sabana Yegua')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Pueblo Viejo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Peralta')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Las Charcas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Guayabal')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Las Yayas de Viajama')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Estebania')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Padre Las Casas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Tabara Arriba')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Villarpando')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Palmar de Ocoa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Monte Bonito')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (1,'Bohechío')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Neiba')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Villa Jaragua')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Galván')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Los Ríos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Uvilla')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'Vicente Noble')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (2,'El Palmar')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Barahona')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'La Ciénaga')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Polo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES  (3,'Cabral')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Paraíso')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Fundación')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Enriquillo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'El Peñón')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Los Patos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'El Cachón')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Las Salinas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Jaquimeyes')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Vicente Noble')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Pescadería')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (3,'Juancho')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (4,'Dajabón')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (4,'Loma de Cabrera')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (4,'Partido')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (4,'Restauración')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (4,'El Pino')


INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (5,'Distrito Nacional')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'San Francisco de Macorís')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Las Guáranas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Eugenio María de Hostos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Arenoso')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Pimentel')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Villa Riva')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Agua Santa del Yuna')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (6,'Cenoví')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'Comendador')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'Hondo Valle')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'Bánica')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'El Llano')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'Pedro Santana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (7,'Río Limpio')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (8,'Miches')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (8,'Pedro Sanchez')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (8,'El Seibo')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Moca')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Jamao al Norte')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Gaspar Hernández')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Juan Lopez')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'San Victor')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Cayetano Germosén')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Santiago de los Caballeros')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Joba Arriba')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Las Lagunas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Río San Juan')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Puñal')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (9,'Tamboríl')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (10,'Hato Mayor del Rey')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (10,'Sabana de la Mar')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (10,'El Valle')


INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (11,'Salcedo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (11,'Tenares')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (11,'Villa Tapia')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (11,'Cenoví')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (12,'Jimaní')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (12,'Poster Río')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Higuey')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Las Cejas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Dominicus')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'San Rafael de Yuma')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Juanillo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Punta Cana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'La Otra Banda')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Anamuya')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'La Vacama')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Las Lagunas de Nisibon')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Uvero Alto')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (13,'Bavaro')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (14,'La Romana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (14,'Guaymate')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (14,'Villa Hermosa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (14,'Caleta')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (15,'La Vega')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (15,'Constanza')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (15,'Jarabacoa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (15,'Jima Abajo')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (16,'Nagua')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (16,'Cabrera')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (16,'El Factor')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (16,'Río San Juan')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (17,'Bonao')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (17,'Maimón')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (17,'Piedra Blanca')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'Castañuelas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'Guayubín')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'Las Matas de Santa Cruz')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'Pepillo Salcedo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'San Fernando de Monte Cristi')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (18,'Villa Vásquez')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (19,'Monte Plata')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (19,'Bayaguana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (19,'Peralvillo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (19,'Sabana Grande de Boyá Gonzalo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (19,'Yamasá Los Botados')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (20,'Santa Bárbara de Samaná')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (20,'Las Terrenas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (20,'Sánchez')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (21,'Platanal')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (21,'Quita Sueño')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (21,'Caballero')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (21,'Comedero Arriba')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (21,'Zambrana')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'San Cristóbal')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Cambita Garabito')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Los Cacaos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Sabana Grande de Palenque')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'San Gregorio de Nigua')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Bajos de Haina')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Yaguate')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (22,'Villa Altagracia')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (23,'San José de Ocoa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (23,'Rancho Arriba')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (23,'Sabana Larga')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'San Juan de la Maguana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'Juan de Herrera')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'Bohechío')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'El Cercado')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'Las Matas de Farfán')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (24,'Vallejuelo')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'San Pedro de Macorís')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'San José de Los Llanos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'Ramón Santana')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'Consuelo')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'Quisqueya')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (25,'Guayacanes')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Baitoa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Jánico')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Licey al Medio')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Puñal')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Sabana Iglesia')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'San José de Las Matas')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Santiago de los Caballeros')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Tamboril')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Villa Bisonó')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (26,'Villa González')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (27,'San Ignacio de Sabaneta')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (27,'Monción')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (27,'Villa Los Almácigos')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Santo Domingo Este')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Boca Chica')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Los Alcarrizos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Pedro Brand')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'San Antonio de Guerra')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Santo Domingo Norte')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (28,'Santo Domingo Oeste')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (29,'Mao')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (29,'Esperanza')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (29,'Laguna Salada')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (30,'Pedernales')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (30,'Oviedo')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (31,'Baní')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (31,'Nizao')

INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Puerto Plata')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Altamira')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Guananico')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Imbert')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Los Hidalgos')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Luperón')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Sosúa')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Villa Isabela')
INSERT INTO Tbl_Ciudad(ID_Provincia1,NomCiudad) VALUES (32,'Villa Montellano')

-------------------------------------------------------------------------------------------------------------------------
--DATOS DE LA TABLA ALA
INSERT INTO Tbl_Ala
VALUES(1,100,'Ala Norte'),
(2,200,'Ala Sur'),
(3,300,'Ala Este'),
(4,400,'Ala Oeste'),
(5,500,'Ala Central'),
(6,600,'Ala Central Sur')

-----------------------------------------------
-----------------------------------------------------
--DATOS DE LA TABLA Sala
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (10,2,1)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (20,2,2)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (30,4,3)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (40,4,4)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (50,4,5)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (60,1,6)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (70,1,7)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (80,1,8)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (90,1,9)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (100,3,10)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (110,3,11)
Insert into Tbl_Sala(ID_Sala,ID_Ala3,ID_TipoSala9) values (120,4,12)
----------------------------------------------
--DATOS DE LA TABLA alahabitacion
INSERT  INTO Tbl_AlaHabitacion VALUES(1,2,201),
(2,2,202),
(3,2,203),
(4,2,204),
(5,2,205),
(6,2,206),
(7,2,207),
(8,2,208),
(9,2,209),
(10,2,210),
(11,2,211),
(12,2,212),
(13,2,213),
(14,2,214),
(15,2,215),
(16,1,216),
(17,1,217),
(18,1,218),
(19,1,219),
(20,1,220),
(21,1,221),
(22,1,222),
(23,1,223),
(24,1,224),
(25,1,225),
(26,1,301),
(27,1,302),
(28,1,303),
(29,1,304),
(30,1,305),
(31,3,306),
(32,3,307),
(33,3,308),
(34,3,309),
(35,3,310),
(36,3,311),
(37,3,312),
(38,3,313),
(39,3,314),
(40,3,315),
(41,3,316),
(42,3,317),
(43,3,318),
(44,3,319),
(45,3,320),
(46,3,321),
(47,4,322),
(48,4,323),
(49,4,324),
(50,4,325),
(51,4,401),
(52,4,402),
(53,4,403),
(54,4,404),
(55,4,405),
(56,4,406),
(57,4,407),
(58,4,408),
(59,4,409),
(60,4,410),
(61,4,411),
(62,4,412),
(63,4,413),
(64,4,414),
(65,4,415),
(66,4,416),
(67,4,417),
(68,4,418),
(69,4,419),
(70,4,420),
(71,4,421),
(72,4,422),
(73,4,423),
(74,4,424),
(75,5,425),
(76,5,501),
(77,5,502),
(78,5,503),
(79,5,504),
(80,5,505),
(81,5,506),
(82,5,507),
(83,5,508),
(84,5,509),
(85,5,510),
(86,5,511),
(87,5,512),
(88,5,513),
(89,5,514),
(90,5,515),
(91,5,516),
(92,5,517),
(93,5,518),
(94,5,519),
(95,5,520),
(96,5,521),
(97,5,522),
(98,5,523),
(99,5,524),
(100,5,525),
(101,6,601),
(102,6,602),
(103,6,603),
(104,6,604),
(105,6,605),
(106,6,607),
(107,6,608),
(108,6,609),
(109,6,610),
(110,6,611),
(111,6,612),
(112,6,613),
(113,6,614),
(114,6,615),
(115,6,616),
(116,6,617),
(117,6,618),
(118,6,619),
(119,6,620),
(120,6,621),
(121,6,622),
(122,6,623),
(123,6,624),
(124,6,625);
--------------------------------------------------
--Tabla personal medico

INSERT INTO Tbl_PersonalMed(ID_PersonalMed) VALUES (32606),
(20555),
(10741),
(53330),
(3491),
(29447),
(62924),
(31258),
(66894),
(11474),
(11645),
(45089),
(23877),
(24050),
(28489),
(47676),
(48107),
(48217),
(20533),
(9038),
(9141),
(9144),
(60493),
(9682),
(9685),
(41413),
(41928),
(64094),
(5489),
(5673);

INSERT INTO Tbl_PersonalMed(ID_PersonalMed) VALUES (5682),
(5693),
(63206),
(4449),
(4907),
(5176),
(43925),
(65749),
(62410),
(2287),
(2388),
(30285),
(46504),
(46800),
(46993),
(47086),
(52474),
(7481),
(7525),
(7888),
(7965),
(7994),
(8037),
(8166),
(8315),
(57363),
(3480),
(3736),
(3850),
(3944),
(53644),
(72862),
(12257),
(12733),
(50878),
(50880),
(50910),
(51375),
(51555),
(51598),
(51607),
(6887),
(6895),
(7020),
(7208),
(7244),
(7257),
(7302),
(7374),
(7375);

-----------------------------------------------------
INSERT INTO Tbl_Esp_Sub_Esp VALUES (1,100,101,32606),
(2,100,102,2287),
(3,200,201,2388),
(4,200,202,3480),
(5,200,203,3491),
(6,200,204,3736),
(7,200,205,3850),
(8,300,301,3944),
(9,400,401,4449),
(10,400,402,4907),
(11,400,403,5176),
(12,400,404,5489),
(13,400,405,5673),
(14,400,406,5682),
(15,400,407,5693),
(16,400,408,6895),
(17,400,408,7020),
(18,400,409,7208),
(19,400,410,7244),
(20,400,411,7257),
(21,400,412,7302),
(22,400,413,7374),
(23,500,501,7375),
(24,200,202,7481),
(25,200,201,7525),
(26,100,101,7888),
(27,100,102,7965),
(28,100,101,7994),
(29,400,413,8037),
(30,500,501,8166),
(31,500,502,8315),
(32,500,503,9038),
(33,500,504,9141),
(34,500,505,9144),
(35,500,506,9682),
(36,500,507,9685),
(37,500,508,10741),
(38,500,509,11474),
(39,500,510,11645),
(40,500,511,12257),
(41,500,512,12733),
(42,500,513,20533),
(43,500,514,20555),
(44,500,515,23877),
(45,500,516,24050),
(46,500,517,28489),
(47,500,518,29447),
(48,500,519,30285),
(49,600,601,31258),
(50,600,602,32606),
(51,600,603,41413),
(52,600,604,41928),
(53,600,605,43925),
(54,600,606,45089),
(55,600,607,46504),
(56,600,608,46800),
(57,600,609,46993),
(58,600,610,47086),
(59,600,611,47676),
(60,600,612,48107),
(61,600,613,48217),
(62,600,614,50878),
(63,600,615,50880),
(64,600,616,50910),
(65,600,617,51375),
(66,600,618,51555),
(67,600,619,51598);

-----------------------------------------------------
--Tabla centro
INSERT INTO Tbl_Centro VALUES(1,1,1,4,105,'Ney Arias Lora','San Felipe Calle 12','8092684564'),
(2,1,2,30,106,'Moscoso Puello','Esq.Nuñez de Cacerez','8092364568'),
(3,10,2,23,107,'San Rafael','Gustavo Mejia no.12','8092584568'),
(4,9,3,7,108,'Plaza de la Salud','Av. 27 de Febrero, esq. Surchi','8095284654'),
(5,3,3,9,109,'Cruz Jiminian','Gazcue no. 64','8092396132'),
(6,4,1,26,110,'Santo Socorro','Charles de gaulle','8092396456')  

-----------------------------------------------------
--Tabla PersonalAdm
INSERT INTO Tbl_Personal_Adm
VALUES(1,1,1,1),
(2,1,1,1),
(3,3,1,1),
(4,4,1,1),
(5,5,1,1),
(6,6,1,1),
(7,7,1,1),
(8,8,1,1),
(9,9,1,1),
(10,1,2,2),
(12,1,2,2),
(13,3,2,1),
(14,4,2,3),
(15,5,2,3),
(16,6,2,1),
(17,7,2,1),
(18,8,2,1),
(19,9,2,1),
(20,1,5,1),
(21,2,3,1);

-----------------------------------------------------
--Tabla Tbl_RegistroPersonal

INSERT INTO Tbl_RegistroPersonal(ID_Personal,ID_PersonalAdm9,ID_PersonalMed2,NombrePers,ApellidoPers,Cedula,DireccionPers,
TelefonoPers,FechaIngreso) VALUES (101,NULL,2287,'VIVIAN','SEIJO RIVERA','00112851662','Av. Romulo Betancourt 1420, Bella Vista',
'8095610021','14/12/2001')

INSERT INTO Tbl_RegistroPersonal(ID_Personal,ID_PersonalAdm9,ID_PersonalMed2,NombrePers,ApellidoPers,Cedula,DireccionPers,
TelefonoPers,FechaIngreso) VALUES (102,NULL,2388,'ARMANDO','MENESES SANCHEZ','00117739291','Juan de Morfa No.12 San Carlos',
'8095018511','11/03/2001')

INSERT INTO Tbl_RegistroPersonal(ID_Personal,ID_PersonalAdm9,ID_PersonalMed2,NombrePers,ApellidoPers,Cedula,DireccionPers,
TelefonoPers,FechaIngreso) VALUES (103,NULL,3480,'ARMANDO','CARRAZONA ROSALES','00118839261','Av. John F. Kennedy no. 34 Ensanche Naco',
'8093337659','08/08/1988')

INSERT INTO Tbl_RegistroPersonal(ID_Personal,ID_PersonalAdm9,ID_PersonalMed2,NombrePers,ApellidoPers,Cedula,DireccionPers,
TelefonoPers,FechaIngreso) VALUES (104,NULL,5682,'AMANDA','MEDOZA','40218839642','Aut. 30 de Mayo Km 7½ Urb. Tropical',
'8093337689','21/08/1998')


INSERT INTO Tbl_RegistroPersonal(ID_Personal,ID_PersonalAdm9,ID_PersonalMed2,NombrePers,ApellidoPers,Cedula,DireccionPers,
TelefonoPers,FechaIngreso) VALUES (105,NULL,5693,'ARMANDO','MEDOZA','4019949658','Aut. 30 de Mayo Km 7½ Urb. Tropical',
'809333769','21/08/1998')

INSERT INTO Tbl_RegistroPersonal
VALUES (106,NULL,7375,'YAMILKA','RAMIREZ SANCHEZ','07392910210','Barrio Nuevo No.12 Villa Mella Sto Dgo','8095055511','11/03/2001'),
(107,NULL,7374,'ALEJANDRO','RAMIREZ MONTERO','11111910210','Villa Rivas No.14','8095111511','16/03/2005'),
(108,NULL,7257,'ROSA','CARMEN PEREZ','12354545226','Alma Rosa No.45 ','8092684654','15/06/2006'),
(109,NULL,6895,'MARTA','MALAGOLI','14785236912','Los Alcarrizos No.49 ','8092684654','11/02/2004'),
(110,NULL,6895,'MARIO','SANTANA','40128939682','Los Alcarrizos No.49 ','8092684654','11/02/2003');

INSERT INTO Tbl_RegistroPersonal VALUES (111,21,NULL,'SALMA ISAMAR','MARMOL LAYA','40288856357','Cancino, Calle E','8098885271','22/03/2018'),
(112,15,NULL,'SIMON','MORENO ZERPA','40289811111', 'Las Americas, Calle 54','8092396134','25/03/2015'),
(113,12,NULL,'VICTOR', 'ALMAZAR','40889787878','Villa Faro, No.50','8097415623','15/01/1989'),
(114,9,NULL,'ALVARO','RODRIGUEZ','40889822331','Cristo Rey, No.8A','8097895213', '08/07/2015'),
(115,6,NULL,'MARIANELA','LAYA','40372822437','Lucerna, No.24B','8097418520','07/10/2013'),
(116,14,NULL,'RAMON','PERALTA','40256827438','Lucerna, No.27A','8095612233','12/12/2007');

--DATOS DE LA TABLA CentroPersonalMED
Insert into Tbl_CentroPersonalMed values (100,5693,1,1),
(10,5693,1,1),
(20,63206,1,1),
(30,4449,1,1),
(40,4907,2,1),
(50,5176,2,2),
(60,43925,2,2),
(70,65749,6,2),
(80,62410,6,2),
(90,2287,3,2),
(11,2388,3,2),
(12,30285,3,3),
(13,46504,3,3),
(14,46800,4,1),
(15,46993,4,1),
(16,47086,4,3),
(17,52474,4,1),
(18,52474,5,1),
(19,52474,5,2);
--DATOS DE LA TABLA RolMedico
INSERT INTO Tbl_RolMedico VALUES (1,10,1),
(100,20,2),
(200,30,3),
(300,40,4),
(400,50,5),
(500,60,6),
(600,70,7),
(700,80,8),
(800,90,9);

INSERT INTO Tbl_RolMedico VALUES (900,100,10),
(110,110,21),
(111,120,12),
(120,130,13),
(130,140,14),
(140,150,15),
(150,160,16),
(160,170,17),
(170,180,18),
(180,190,19);

---DATOS DE LA TABLA centroala
INSERT INTO Tbl_CentroAla
VALUES(1,1,1),
(2,1,2),
(3,1,3),
(4,1,4),
(5,1,5),
(6,2,1),
(7,2,2),
(8,2,3),
(9,3,4),
(10,3,3),
(11,3,2),
(12,3,5),
(13,4,6),
(14,4,1),
(15,5,3),
(16,5,4),
(17,5,5),
(18,6,1),
(19,6,3),
(20,6,2),
(21,6,4);

-----------------------------------------------------
--Tabla especialidadpersonal 

INSERT INTO Tbl_Especialidad_Personal VALUES (1,101,40),
(2,301,30),
(3,203,20),
(4,402,10),
(5,410,140),
(6,404,130),
(7,405,150),
(8,411,160),
(9,409,170),
(10,501,180),
(11,502,190),
(12,503,40),
(13,504,20),
(14,505,60),
(15,509,100),
(16,519,80),
(17,510,50),
(18,518,90),
(19,511,10),
(20,517,30),
(21,512,120),
(22,516,70),
(23,513,30),
(24,602,90),
(25,603,40),
(26,604,100),
(27,605,140),
(28,614,150),
(29,611,120),
(30,612,140),
(31,613,50),
(32,614,50),
(33,615,40),
(34,616,60),
(35,616,50),
(36,617,70),
(37,617,80),
(38,618,10),
(39,619,60),
(40,404,20),
(41,405,30),
(42,406,70);
