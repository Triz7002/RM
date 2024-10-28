-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/10/2024 às 15:16
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `assistencia_rm`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `data_agendamento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_car` int(6) NOT NULL,
  `id_cli` int(6) NOT NULL,
  `id_prod` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho`
--

INSERT INTO `carrinho` (`id_car`, `id_cli`, `id_prod`) VALUES
(17, 3, 20),
(18, 3, 17),
(50, 2, 18),
(51, 2, 16),
(53, 2, 20),
(54, 2, 20),
(55, 2, 20),
(56, 2, 18),
(57, 2, 20),
(58, 2, 17),
(59, 2, 16),
(60, 2, 16),
(61, 2, 16),
(62, 2, 16),
(63, 2, 16),
(64, 2, 16),
(65, 2, 16),
(66, 2, 20),
(67, 2, 17),
(68, 2, 22);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(2) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Samsung'),
(2, 'Motorolas'),
(4, 'Redmi'),
(5, 'LG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` mediumint(5) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `quant` tinyint(2) NOT NULL,
  `valor` float(7,2) NOT NULL,
  `categoria` smallint(2) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `quant`, `valor`, `categoria`, `foto`) VALUES
(23, 'A01 core Samsung Tela', 4, 232.00, 1, 'A01core.jpeg'),
(24, 'A03 Samsung Tela', 4, 250.00, 1, 'A03.jpeg'),
(25, 'A03 core Samsung', 5, 270.00, 1, 'A03core.jpeg'),
(26, 'A10 Samsung Tela', 2, 225.00, 1, 'A10.jpeg'),
(27, 'A10s Samsung Tela', 3, 240.00, 1, 'A10s.jpeg'),
(28, 'A02 Samsung Tela', 2, 250.00, 1, 'A02.webp'),
(29, 'A02s Samsung', 4, 250.00, 1, 'A02s.jpeg'),
(30, 'A11 Samsung Tela', 2, 240.00, 1, 'A11.jpeg'),
(31, 'A12 Samsung Tela', 4, 250.00, 1, 'A12.jpg'),
(32, 'A04 Samsung Tela', 7, 250.00, 1, 'A04.jpeg'),
(33, ' G10 Motorola Tela', 8, 230.00, 2, 'G10.webp'),
(34, 'G10 Motorola Tela', 6, 230.00, 2, 'G10.webp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` mediumint(4) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `login` varchar(15) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `adm` tinyint(1) NOT NULL DEFAULT 0,
  `bairro` varchar(50) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `num_casa` varchar(50) DEFAULT NULL,
  `cep` float DEFAULT NULL,
  `celular` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `senha`, `adm`, `bairro`, `rua`, `num_casa`, `cep`, `celular`) VALUES
(1, 'Rangel', 'Rangel', '987654', 1, NULL, NULL, NULL, NULL, NULL),
(2, 'Bia', 'bia', '2212', 0, NULL, NULL, NULL, NULL, NULL),
(3, 'Ellen', 'ellen', '7002', 0, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_car`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_car` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` mediumint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
