CREATE TABLE IF NOT EXISTS `Clientes` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`cpf` varchar(14) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	`email` varchar(100) NOT NULL,
	PRIMARY KEY (`id_cliente`)
);
CREATE TABLE IF NOT EXISTS `Treinadores` (
	`id_treinador` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`cpf` varchar(14) NOT NULL,
	`especialidade` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`email` varchar(100) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	PRIMARY KEY (`id_treinador`)
);
CREATE TABLE IF NOT EXISTS `Haras` (
	`id_haras` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_haras` varchar(100) NOT NULL,
	`proprietario` varchar(100) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`email` varchar(100) NOT NULL,
	PRIMARY KEY (`id_haras`)
);
CREATE TABLE IF NOT EXISTS `Cavalos` (
	`id_cavalo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`cor` varchar(50) NOT NULL,
	`raca` varchar(50) NOT NULL,
	`sexo` varchar(10) NOT NULL,
	`peso` decimal(4,2) NOT NULL,
	`altura` decimal(2,2) NOT NULL,
	`idade` int NOT NULL,
	`id_haras` int NOT NULL,
	PRIMARY KEY (`id_cavalo`)
);
CREATE TABLE IF NOT EXISTS `Vendas` (
	`id_vendas` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_cliente` int NOT NULL,
	`id_cavalo` int NOT NULL,
	`id_treinador` int NOT NULL,
	`data_venda` int AUTO_INCREMENT NOT NULL,
	`data_entrega` int AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (`id_vendas`)
);
CREATE TABLE IF NOT EXISTS `Veterinarios` (
	`id_veterinario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`especialidade` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`email` varchar(100) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	PRIMARY KEY (`id_veterinario`)
);
CREATE TABLE IF NOT EXISTS `Exames` (
	`id_exame` int AUTO_INCREMENT NOT NULL UNIQUE,
	`tipo_exame` varchar(30) NOT NULL,
	`data_exame` date NOT NULL,
	`id_cavalo` int NOT NULL,
	`id_veterinario` int NOT NULL,
	PRIMARY KEY (`id_exame`)
);
ALTER TABLE `Cavalos` ADD CONSTRAINT `Cavalos_fk7` FOREIGN KEY (`id_haras`) REFERENCES `Haras`(`id_haras`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk2` FOREIGN KEY (`id_cavalo`) REFERENCES `Cavalos`(`id_cavalo`);
ALTER TABLE `Vendas` ADD CONSTRAINT `Vendas_fk3` FOREIGN KEY (`id_treinador`) REFERENCES `Treinadores`(`id_treinador`);
ALTER TABLE `Exames` ADD CONSTRAINT `Exames_fk3` FOREIGN KEY (`id_cavalo`) REFERENCES `Cavalos`(`id_cavalo`);
ALTER TABLE `Exames` ADD CONSTRAINT `Exames_fk4` FOREIGN KEY (`id_veterinario`) REFERENCES `Veterinarios`(`id_veterinario`);