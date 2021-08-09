CREATE DATABASE `hospital`;

USE `hospital`;

CREATE TABLE `ESPECIALIDAD`(
	`COD_ESPECIALIDAD` INT NOT NULL PRIMARY KEY,
	`TIPO` VARCHAR(50) NOT NULL
);

CREATE TABLE `PACIENTE`(
	`DNI_PACIENTE` INT NOT NULL PRIMARY KEY,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`APELLIDO` VARCHAR(50) NOT NULL,
	`DIRECCION` VARCHAR(50) NOT NULL,
	`EDAD` INT NOT NULL
);

CREATE TABLE `DIRECCION`(
	`COD_DIRECCION` INT NOT NULL PRIMARY KEY,
	`DNI_PACIENTE` INT NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`NUMERO` INT NOT NULL,
	`CP` VARCHAR(50) NOT NULL,
	CONSTRAINT `FK_direccion_paciente` FOREIGN KEY (`DNI_PACIENTE`) REFERENCES `paciente` (`DNI_PACIENTE`)
);

CREATE TABLE `O_SOCIAL`(
	`COD_OSOCIAL` INT NOT NULL PRIMARY KEY,
	`DNI_PACIENTE` INT NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`CUIT` VARCHAR(50) NOT NULL,
	`CATEGORIA` VARCHAR(50) NOT NULL,
	CONSTRAINT `FK_o_social_paciente` FOREIGN KEY (`DNI_PACIENTE`) REFERENCES `paciente` (`DNI_PACIENTE`)
);

CREATE TABLE `MEDICO`(
	`DNI_DR` INT NOT NULL PRIMARY KEY,
	`MATRICULA` VARCHAR(50) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`APELLIDO` VARCHAR(50) NOT NULL
);

CREATE TABLE `TELEFONO`(
	`COD_TELEFONO` INT NOT NULL PRIMARY KEY,
	`DNI_DR` INT,
	`DNI_PACIENTE` INT,
	`TIPO` VARCHAR(50) NOT NULL,
	`NUMERO` INT,
	CONSTRAINT `FK_telefono_medico` FOREIGN KEY (`DNI_DR`) REFERENCES `medico` (`DNI_DR`),
	CONSTRAINT `FK_telefono_paciente` FOREIGN KEY (`DNI_PACIENTE`) REFERENCES `paciente` (`DNI_PACIENTE`)
	
);

CREATE TABLE `EJERCE`(
	`COD_EJERCE` INT NOT NULL PRIMARY KEY,
	`COD_ESPECIALIDAD` INT NOT NULL,
	`DNI_DR` INT NOT NULL,
	`DIAS_ATENCION` DATETIME NOT NULL,
	`COMENTARIOS` VARCHAR(50) NOT NULL,
	CONSTRAINT `FK_ejerce_especialidad` FOREIGN KEY (`COD_ESPECIALIDAD`) REFERENCES `especialidad` (`COD_ESPECIALIDAD`),
	CONSTRAINT `FK_ejerce_medico` FOREIGN KEY (`DNI_DR`) REFERENCES `medico` (`DNI_DR`)
);

CREATE TABLE `ATENCION`(
	`COD_ATENCION` INT NOT NULL PRIMARY KEY,
	`DNI_DR` INT NOT NULL,
	`DNI_PACIENTE` INT NOT NULL,
	`FECHA_ATENCION` DATETIME NOT NULL,
	`COMENTARIOS` VARCHAR(200) NOT NULL,
	`DIAGNOSTICO` VARCHAR(50) NOT NULL,
	CONSTRAINT `FK_atencion_medico` FOREIGN KEY (`DNI_DR`) REFERENCES `medico` (`DNI_DR`),
	CONSTRAINT `FK_atencion_paciente` FOREIGN KEY (`DNI_PACIENTE`) REFERENCES `paciente` (`DNI_PACIENTE`)
);


/*ESPECIALIDAD*/

INSERT INTO `hospital`.`especialidad` (`COD_ESPECIALIDAD`, `TIPO`) 
VALUES ('3252', 'NEUROLOGIA');

INSERT INTO `hospital`.`especialidad` (`COD_ESPECIALIDAD`, `TIPO`) 
VALUES ('243', 'ORTOPEDIA');

INSERT INTO `hospital`.`especialidad` (`COD_ESPECIALIDAD`, `TIPO`) 
VALUES ('87998', 'CARDIOLOGIA');

INSERT INTO `hospital`.`especialidad` (`COD_ESPECIALIDAD`, `TIPO`) 
VALUES ('126489', 'TRAUMATOLOGIA');

INSERT INTO `hospital`.`especialidad` (`COD_ESPECIALIDAD`, `TIPO`) 
VALUES ('43', 'GINECOLOGIA');


/*PACIENTE*/
INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('468762', 'Emiliano', 'Hernadez', 'Urquiza', '56');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('56443', 'Gustavo', 'Fernandez', 'Vergara', '20');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('5423', 'Gilberto', 'Gomez', 'Pedro diaz', '75');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('3423412', 'Norberto', 'Perez', 'Gorriti', '55');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('5643', 'Luisa', 'Florez', 'Pedro diaz', '39');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('423', 'Marcelo', 'Gallardo', 'Avenida', '45');

INSERT INTO `hospital`.`paciente` (`DNI_PACIENTE`, `NOMBRE`, `APELLIDO`, `DIRECCION`, `EDAD`) 
VALUES ('543', 'Enzo', 'Francescoli', 'Calle', '43');

/*Direccion*/
INSERT INTO `hospital`.`direccion` (`COD_DIRECCION`, `DNI_PACIENTE`, `NOMBRE`, `NUMERO`, `CP`) 
VALUES ('123123', '468762', 'Urquiza', '7788', '1663');


INSERT INTO `hospital`.`direccion` (`COD_DIRECCION`, `DNI_PACIENTE`, `NOMBRE`, `NUMERO`, `CP`) 
VALUES ('5464', '56443', 'Vergara', '8200', '1686');

INSERT INTO `hospital`.`direccion` (`COD_DIRECCION`, `DNI_PACIENTE`, `NOMBRE`, `NUMERO`, `CP`) 
VALUES ('2342', '5423', 'Pedro diaz', '3388', '1686');

INSERT INTO `hospital`.`direccion` (`COD_DIRECCION`, `DNI_PACIENTE`, `NOMBRE`, `NUMERO`, `CP`) 
VALUES ('9876', '3423412', 'Gorriti', '3333', '1686');

/*Obra social*/
INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('8734290', '468762', 'UOM', '238047', 'Categoria A');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('342', '5423', 'OSECAC', '912390', 'Categoria A');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('23423', '56443', 'UOM', '32094829', 'Categoria C');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('32432423', '3423412', 'PAMI', '234234', 'Categoria B');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('2342', '5643', 'UOM', '2354', 'Categoria C');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('52342', '543', 'OSECAC', '24523', 'Categoria A');

INSERT INTO `hospital`.`o_social` (`COD_OSOCIAL`, `DNI_PACIENTE`, `NOMBRE`, `CUIT`, `CATEGORIA`) 
VALUES ('643523', '423', 'PAMI', '2930', 'Categoria C');

/*MEDICO*/

INSERT INTO `hospital`.`medico` (`DNI_DR`, `MATRICULA`, `NOMBRE`, `APELLIDO`) 
VALUES ('234234', '893724', 'Fernando', 'Rey');

INSERT INTO `hospital`.`medico` (`DNI_DR`, `MATRICULA`, `NOMBRE`, `APELLIDO`) 
VALUES ('23543635', '653234', 'Alberto', 'Dominguez');

INSERT INTO `hospital`.`medico` (`DNI_DR`, `MATRICULA`, `NOMBRE`, `APELLIDO`) 
VALUES ('3534', '534', 'Matias', 'Diaz');

INSERT INTO `hospital`.`medico` (`DNI_DR`, `MATRICULA`, `NOMBRE`, `APELLIDO`) 
VALUES ('2352342', '76543', 'Alberto', 'Perez');

INSERT INTO `hospital`.`medico` (`DNI_DR`, `MATRICULA`, `NOMBRE`, `APELLIDO`) 
VALUES ('2342', '45634', 'Pedro', 'Fi');

/*TELEFONO*/

INSERT INTO `hospital`.`telefono` (`COD_TELEFONO`, `DNI_DR`, `TIPO`) 
VALUES ('643', '23543635', 'Celular');

INSERT INTO `hospital`.`telefono` (`COD_TELEFONO`, `DNI_PACIENTE`, `TIPO`, `NUMERO`) 
VALUES ('5634', '468762', 'Celular', '23423');

INSERT INTO `hospital`.`telefono` (`COD_TELEFONO`, `DNI_PACIENTE`, `TIPO`) 
VALUES ('653', '5423', 'Fijo');

INSERT INTO `hospital`.`telefono` (`COD_TELEFONO`, `DNI_DR`, `TIPO`, `NUMERO`) 
VALUES ('345', '2352342', 'Fijo', '239042');

INSERT INTO `hospital`.`telefono` (`COD_TELEFONO`, `DNI_DR`, `TIPO`, `NUMERO`) 
VALUES ('4234', '3534', 'Fijo', '544');

/*EJERCE*/
INSERT INTO `hospital`.`ejerce` (`COD_EJERCE`, `COD_ESPECIALIDAD`, `DNI_DR`, `DIAS_ATENCION`, `COMENTARIOS`) 
VALUES ('98765', '87998', '3534', '2021-08-07 09:00:00', 'Comentarios 1');

INSERT INTO `hospital`.`ejerce` (`COD_EJERCE`, `COD_ESPECIALIDAD`, `DNI_DR`, `DIAS_ATENCION`, `COMENTARIOS`) 
VALUES ('6543', '3252', '23543635', '2021-07-20 07:30:00', 'Comentarios 2');

INSERT INTO `hospital`.`ejerce` (`COD_EJERCE`, `COD_ESPECIALIDAD`, `DNI_DR`, `DIAS_ATENCION`, `COMENTARIOS`) 
VALUES ('23413', '126489', '2352342', '2021-07-27 14:30:00', 'Comentarios 3');

INSERT INTO `hospital`.`ejerce` (`COD_EJERCE`, `COD_ESPECIALIDAD`, `DNI_DR`, `DIAS_ATENCION`, `COMENTARIOS`) 
VALUES ('3412', '243', '234234', '2021-10-15 11:00:00', 'Comentarios 4');

INSERT INTO `hospital`.`ejerce` (`COD_EJERCE`, `COD_ESPECIALIDAD`, `DNI_DR`, `DIAS_ATENCION`, `COMENTARIOS`) 
VALUES ('34', '43', '2342', '2021-09-17 15:15:00', 'Comentarios 5');

/*ATENCION*/
INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('4323', '3534', '468762', '2021-07-07 18:49:13', 'Atendido', 'Diagnostico 1');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('324324', '2352342', '56443', '2021-07-17 10:00:00', 'Atendido', 'Diagnostico 2');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('2342', '23543635', '3423412', '2021-07-07 14:00:00', 'Atendido', 'Diagnostico 3');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('356', '3534', '5423', '2021-06-07 11:15:00', 'Atendido', 'Diagnostico 4');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('2423', '2342', '5643', '2021-10-15 11:15:00', 'Atendido', 'Diagnostico 5');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('35342', '23543635', '5643', '2021-07-07 19:43:42', 'Atendido', 'Diagnostico 6');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('6574', '23543635', '468762', '2021-07-17 08:00:00', 'Atendido', 'Diagnostico 5');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('56543', '23543635', '3423412', '2021-07-07 19:47:10', 'Atendido', 'Diagnostico 2');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('756', '23543635', '5423', '2021-07-07 19:47:55', 'Atendido', 'Diagnostico 2');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('2534', '234234', '423', '2021-11-11 10:00:00', 'Atendido', 'Diagnostico 2');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('54632', '23543635', '423', '2021-07-07 19:58:30', 'Atendido', 'Diagnostico 1');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('32523', '3534', '543', '2021-08-12 08:30:00', 'Atendido', 'Diagnostico 4');

INSERT INTO `hospital`.`atencion` (`COD_ATENCION`, `DNI_DR`, `DNI_PACIENTE`, `FECHA_ATENCION`, `COMENTARIOS`, `DIAGNOSTICO`) 
VALUES ('23423', '2342', '468762', '2019-12-25 00:00:00', 'Atendido', 'Diagnostico 2');
/*1.
Listar la edad promedio de los pacientes que se han atendido con aquellos Médicos donde la especialidad haya sido Traumatología 
a fin de conocer el índice de nivel poblacional que recurre a dicha especialidad.*/
SELECT round(avg(paciente.EDAD)) AS `Edad promedio`, especialidad.TIPO AS "Especialidad"

FROM	paciente, atencion, medico, ejerce, especialidad

WHERE paciente.DNI_PACIENTE = atencion.DNI_PACIENTE AND atencion.DNI_DR = medico.DNI_DR AND ejerce.DNI_DR = medico.DNI_DR
		AND ejerce.COD_ESPECIALIDAD = especialidad.COD_ESPECIALIDAD AND especialidad.TIPO = "TRAUMATOLOGIA";
		
/*2.
Listar la Fecha de Atención, Diagnostico, nombre y apellido del Médico de aquellos Pacientes que tienen como obra social OSECAC.*/
SELECT atencion.FECHA_ATENCION AS "Fecha de atencion" , atencion.DIAGNOSTICO AS "Diagnostico", 
		medico.NOMBRE AS "Nombre del medico", medico.APELLIDO AS "Apellido del medico"

FROM paciente, o_social, medico, atencion

WHERE paciente.DNI_PACIENTE = o_social.DNI_PACIENTE AND paciente.DNI_PACIENTE = atencion.DNI_PACIENTE 
		AND atencion.DNI_DR = medico.DNI_DR AND o_social.NOMBRE = "OSECAC";
		
/*3. 
Listar el número (cantidad) de Pacientes que se han atendido el 25 de diciembre de 2017, 2018 y 2019 a fin de conocer números 
estadísticos de las consecuencias del uso de fuegos artificiales, restringir a consultas de especialidad “Oftalmología.”*/		
SELECT COUNT(paciente.DNI_PACIENTE) AS "Cantidad de pacientes"

FROM paciente, atencion, especialidad

WHERE paciente.DNI_PACIENTE = atencion.DNI_PACIENTE AND DAY(atencion.FECHA_ATENCION) = 25 AND MONTH(atencion.FECHA_ATENCION) = 12 
		AND especialidad.TIPO = "OFTAMOLOGIA" AND YEAR(atencion.FECHA_ATENCION) = 2019 OR YEAR(atencion.FECHA_ATENCION) = 2018 OR YEAR(atencion.FECHA_ATENCION) = 2017;

/*4.
Listar los Pacientes y Médicos que no disponen de Numero de Teléfono en el sistema a fin de notificárseos 
y tener la base de datos actualizada.*/
SELECT paciente.NOMBRE AS "Nombre del paciente", paciente.APELLIDO AS "Apellido del paciente",
		medico.NOMBRE AS "Nombre del medico", medico.APELLIDO AS "Apellido del medico" 

FROM paciente, medico, telefono

WHERE paciente.DNI_PACIENTE = telefono.DNI_PACIENTE OR medico.DNI_DR = telefono.DNI_DR AND telefono.NUMERO IS NULL;


/*5.
Listar, Nombre y Apellido de los Médicos, Días que atiende de todos los que están almacenados en el sistema, 
filtrando la especialidad “Ginecología”
*/
SELECT medico.NOMBRE AS "Nombre del medico", medico.APELLIDO AS "Apellido del medico", 
		ejerce.DIAS_ATENCION AS "Dias que atiende"
		
FROM	medico, ejerce, especialidad

WHERE medico.DNI_DR = ejerce.DNI_DR AND ejerce.COD_ESPECIALIDAD = especialidad.COD_ESPECIALIDAD 
		AND especialidad.TIPO = "GINECOLOGIA";

/*6.
Mostrar los 3 Pacientes de mayor edad, donde su Obra Social es UOM y que se hayan atendido en la especialidad Neurología.
*/
SELECT paciente.NOMBRE AS "Nombre del paciente", paciente.APELLIDO AS "Apellido del paciente", 
		paciente.edad AS "Edad del paciente", o_social.NOMBRE AS "Obra soial del paciente"

FROM	paciente, o_social, medico, atencion, especialidad, ejerce

WHERE paciente.DNI_PACIENTE = o_social.DNI_PACIENTE AND paciente.DNI_PACIENTE = atencion.DNI_PACIENTE 
		AND atencion.DNI_DR = medico.DNI_DR AND medico.DNI_DR = ejerce.DNI_DR AND ejerce.COD_ESPECIALIDAD = especialidad.COD_ESPECIALIDAD
		AND o_social.NOMBRE = "UOM" AND especialidad.TIPO = "NEUROLOGIA"

ORDER BY	paciente.EDAD DESC

LIMIT 3;
		
/*7.
Listar la Historia Clínica de los Paciente “Enzo Francescoli” y “Marcelo Gallardo” ordenarlos por nombre y luego Apellido del Paciente */
SELECT paciente.NOMBRE AS "Nombre paiente", paciente.APELLIDO AS "Apellido paciente", atencion.FECHA_ATENCION AS "Fecha de atencion", 
		 atencion.DIAGNOSTICO AS "Diagnostico inicial", medico.NOMBRE AS "Nombre medico", medico.APELLIDO AS "Apellido medico", 
		 especialidad.TIPO AS "Especialidad medico", o_social.NOMBRE AS "Obra social"
		
FROM	paciente, atencion, medico, ejerce, especialidad, o_social

WHERE paciente.DNI_PACIENTE = atencion.DNI_PACIENTE AND atencion.DNI_DR = medico.DNI_DR AND medico.DNI_DR = ejerce.DNI_DR
		AND ejerce.COD_ESPECIALIDAD = especialidad.COD_ESPECIALIDAD AND paciente.DNI_PACIENTE = o_social.DNI_PACIENTE 
		AND (paciente.NOMBRE = "Marcelo" AND paciente.APELLIDO = "Gallardo" OR paciente.NOMBRE = "Enzo" AND paciente.APELLIDO = "Francescoli");
