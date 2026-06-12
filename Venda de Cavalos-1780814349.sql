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

-- CLIENTES
INSERT INTO Clientes (nome, cpf, telefone, cidade, email)
VALUES
('João Silva', '123.456.789-00', '(16) 99999-1111', 'Ribeirão Preto', 'joao@gmail.com'),
('Maria Souza', '987.654.321-00', '(16) 98888-2222', 'Araraquara', 'maria@gmail.com');

-- TREINADORES
INSERT INTO Treinadores (nome, cpf, especialidade, telefone, email, cidade)
VALUES
('Carlos Mendes', '111.222.333-44', 'Adestramento', '(16) 97777-3333', 'carlos@gmail.com', 'Jaboticabal'),
('Fernanda Lima', '555.666.777-88', 'Hipismo', '(16) 96666-4444', 'fernanda@gmail.com', 'São Carlos');

-- HARAS
INSERT INTO Haras (nome_haras, proprietario, cidade, telefone, email)
VALUES
('Haras Estrela', 'Paulo Oliveira', 'Ribeirão Preto', '(16) 95555-5555', 'estrela@haras.com'),
('Haras Vitória', 'Marcos Pereira', 'Araraquara', '(16) 94444-6666', 'vitoria@haras.com');

-- CAVALOS
INSERT INTO Cavalos (cor, raca, sexo, peso, altura, idade, id_haras)
VALUES
('Castanho', 'Mangalarga', 'Macho', 450.00, 1.65, 5, 1),
('Branco', 'Quarto de Milha', 'Fêmea', 480.00, 1.70, 6, 2),
('Preto', 'Árabe', 'Macho', 420.00, 1.60, 4, 1);

-- VETERINÁRIOS
INSERT INTO Veterinarios (nome, especialidade, telefone, email, cidade)
VALUES
('Dr. Ricardo Alves', 'Clínica Equina', '(16) 93333-7777', 'ricardo@gmail.com', 'Ribeirão Preto'),
('Dra. Juliana Costa', 'Cirurgia Equina', '(16) 92222-8888', 'juliana@gmail.com', 'São Carlos');

-- EXAMES
INSERT INTO Exames (tipo_exame, data_exame, id_cavalo, id_veterinario)
VALUES
('Hemograma', '2026-05-10', 1, 1),
('Raio-X', '2026-05-15', 2, 2),
('Ultrassom', '2026-05-20', 3, 1);

-- VENDAS
INSERT INTO Vendas (id_cliente, id_cavalo, id_treinador, data_venda, data_entrega)
VALUES
(1, 1, 1, '2026-06-01', '2026-06-05'),
(2, 2, 2, '2026-06-03', '2026-06-08');

SELECT
    v.id_vendas,
    c.nome AS cliente,
    ca.raca,
    ca.cor,
    h.nome_haras,
    t.nome AS treinador,
    v.data_venda,
    v.data_entrega
FROM Vendas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
JOIN Cavalos ca ON v.id_cavalo = ca.id_cavalo
JOIN Haras h ON ca.id_haras = h.id_haras
JOIN Treinadores t ON v.id_treinador = t.id_treinador;
