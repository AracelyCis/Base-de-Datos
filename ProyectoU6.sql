create database ProyectoU6;
use ProyectoU6;
create table PELICULA(
idP varchar(10) primary key not null unique,
Subtitulos varchar(5), 
Resumen text, 
PaisOrigen varchar(20), 
clasificacion varchar(20),
diaEst int, 
mesEst int, 
añoEst int,
AñoProd varchar(10),
TituloO varchar(20),
TituloDist varchar(20), 
HrsD  int, 
MinD int,
IdiomaO varchar(15),
UrlPeli varchar(30)
);
drop table cine;
create table CINE(
NombCine varchar(15) primary key not null unique,
calleC varchar(15),
cdC varchar(20),
colC varchar(20),
numC int,
telC  int
);
ALTER TABLE CINE
MODIFY COLUMN telC int;
create table SALA(
NumSala int primary key not null unique,
NombSala varchar(20),
Butacas int,
NombCine varchar(10),
foreign key (NombCine) references CINE(NombCine)
);
drop table cine;
DELETE FROM genero;

create table OPINION(
idOp varchar(10) primary key not null unique,
califOp int,
ComentOp text,
diaOp int, 
mesOp int, 
añoOp int,
pNombOp varchar(20),
sNombOp varchar(20),
pPatOp varchar(20),
apMatOp varchar(20),
edadOp int, 
idP varchar(10),
foreign key (idP) references PELICULA(idP)
);
create table PARTICIPANTE(
NombreP varchar(15) primary key not null unique,
NacP varchar(15)
);
alter table participante
modify column NombreP varchar(25);
create table FUNCION(
idF varchar(10),
NumSala int,
cantB int,
diaSem int,
HrsComienzo int,
primary key (idF, NumSala),
foreign key (NumSala) references SALA(NumSala)
);
drop table funcion;
drop table PARTICIPANTE;
create table PROMOCIONES(
NombCine varchar(10),
idProm varchar(10),
Descuento varchar(10),
Descripcion text,
ResumenPeli text,
primary key (NombCine, idProm),
foreign key (NombCine) references CINE(NombCine)
);
create table PART_PELI(
NombreP varchar(15),
idP varchar(10),
primary key (NombreP, idP),
foreign key (idP) references PELICULA(idP),
foreign key (NombreP) references PARTICIPANTE(NombreP)
);
alter table PART_PELI
modify column NombreP varchar(25);
create table GENERO(
idP varchar(10),
genero varchar(15),
primary key (idP, genero),
foreign key (idP) references PELICULA(idP)
);
select * from GENERO;
create table PART_DIRECTOR(
NombreP varchar(15),
idPD varchar(10) primary key not null unique,
NumPelisD int,
foreign key (NombreP) references PARTICIPANTE(NombreP)
);
alter table part_director
modify column NombreP varchar(25);
create table PART_ACTOR(
NombreP varchar(15),
idPA varchar(10) primary key not null unique,
NumPelisA int,
foreign key (NombreP) references PARTICIPANTE(NombreP)
);
drop table PART_ACTOR;
create table SALAVIP(
numSala int,
idSVIP varchar(10) primary key not null unique,
NumMeseros int,
foreign key (numSala) references SALA(numSala)
);
create table SALAJR(
numSala int,
idSJR varchar(10) primary key not null unique,
NumMenores int,
foreign key (numSala) references SALA(numSala)
);
create table SALATRADICIONAL(
numSala int,
idST varchar(10) primary key not null unique,
NumPeli int,
foreign key (numSala) references SALA(numSala)
);
create table NOMB_PERSONAJE(
idPA varchar(10),
NombPer varchar(20) primary key not null unique,
foreign key (idPA) references PART_ACTOR(idPA)
);
create table DIRECTOR_RECOMIENDA(
idPD   varchar(10),
idPDR    varchar(10),
primary key (idPD, idPDR),
foreign key (idPD) references PART_DIRECTOR(idPD)
);
ALTER TABLE part_peli
Modify column NombreP varchar(25);
delete from pelicula;
delete from opinion;
delete from promociones;
delete from sala;
delete from funcion;
delete from participante;
delete from part_actor;
delete from part_director;
delete from part_peli;
delete from salavip;
delete from salatradicional;
delete from salajr;
delete from nomb_personaje;
delete from director_recomienda;
delete from genero;
delete from promociones;