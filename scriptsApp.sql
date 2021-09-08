-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aplicacion-de-notas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aplicacion-de-notas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aplicacion-de-notas` DEFAULT CHARACTER SET utf8 ;
USE `aplicacion-de-notas` ;

-- -----------------------------------------------------
-- Table `aplicacion-de-notas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacion-de-notas`.`usuarios` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacion-de-notas`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacion-de-notas`.`notas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME  NULL,
  `descripcion` TEXT NOT NULL,
  `eliminable` TINYINT UNSIGNED NOT NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`),
  INDEX `fk_notas_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_notas_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `aplicacion-de-notas`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacion-de-notas`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacion-de-notas`.`categorias` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacion-de-notas`.`notas_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacion-de-notas`.`notas_categoria` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `notas_id` INT UNSIGNED NOT NULL,
  `categoria_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `notas_id`, `categoria_id`),
  INDEX `fk_notas_has_categoria_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  INDEX `fk_notas_has_categoria_notas1_idx` (`notas_id` ASC) VISIBLE,
  CONSTRAINT `fk_notas_has_categoria_notas1`
    FOREIGN KEY (`notas_id`)
    REFERENCES `aplicacion-de-notas`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_has_categoria_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `aplicacion-de-notas`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO categorias(id, nombre)
VALUES (1, "Tareas");
INSERT INTO categorias(id, nombre)
VALUES (2, "Musica");
INSERT INTO categorias(id, nombre)
VALUES (3, "Peliculas");
INSERT INTO categorias(id, nombre)
VALUES (4, "Series");
INSERT INTO categorias(id, nombre)
VALUES (5, "Trabajo");
INSERT INTO categorias(id, nombre)
VALUES (6, "Libros");
INSERT INTO categorias(id, nombre)
VALUES (7, "Recetas");
INSERT INTO categorias(id, nombre)
VALUES (8, "Compras");
INSERT INTO categorias(id, nombre)
VALUES (9, "Gastos");
INSERT INTO categorias(id, nombre)
VALUES (10, "Cumpleaños");
INSERT INTO usuarios(id, nombre, email)
VALUES (1, "Sebastian", "sebas@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (2, "Antonela", "anto@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (3, "Juan", "juan@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (4, "Eliana", "eli@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (5, "Lorena", "lore@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (6, "Federico", "fede@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (7, "Cecilia", "ceci@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (8, "Jorge", "jor@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (9, "Soledad", "sole@gmail.com");
INSERT INTO usuarios(id, nombre, email)
VALUES (10, "Maria", "maria@gmail.com");
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (1, "Comprar", '2018-00-00 00:00:00','2008-00-00 00:00:00', "Lista de cosas que podria comprar", 1, 2);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (2, "Comprar", '2021-00-00 00:00:00',null, "Lista de cosas que podria comprar", 2, 1);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (3, "Comprar", '2021-00-00 00:00:00',null, "Lista de cosas que podria comprar", 1, 5);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (4, "Comprar", '2021-00-00 00:00:00','2008-00-00 00:00:00', "Lista de cosas que podria comprar", 2, 4);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (5, "Comprar", '2012-00-00 00:00:00',null, "Lista de cosas que podria comprar", 1, 3);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (6, "Comprar", '2021-00-00 00:00:00',null, "Lista de cosas que podria comprar", 2, 7);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (7, "Comprar", '2021-00-00 00:00:00','2008-00-00 00:00:00', "Lista de cosas que podria comprar", 1, 6);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (8, "Comprar", '2012-00-00 00:00:00',null, "Lista de cosas que podria comprar", 2, 9);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (9, "Comprar", '2021-00-00 00:00:00','2008-00-00 00:00:00', "Lista de cosas que podria comprar", 1, 8);
INSERT INTO notas(id, titulo,fecha_creacion, fecha_modificacion,descripcion, eliminable, usuario_id)
VALUES (10, "Comprar", '2021-00-00 00:00:00',null, "Lista de cosas que podria comprar", 2, 10);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (1, 2, 1);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (2, 1, 3);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (3, 4, 6);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (4, 3, 5);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (5, 5, 4);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (6, 8, 7);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (7, 9, 10);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (8, 7, 8);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (9, 6, 9);
INSERT INTO notas_categoria(id, notas_id, categoria_id)
VALUES (10, 10, 2);
