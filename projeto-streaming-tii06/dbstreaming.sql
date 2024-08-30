-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/08/2024 às 18:49
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
-- Banco de dados: `dbstreaming`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbacl`
--

CREATE TABLE `tbacl` (
  `idAcl` int(2) NOT NULL,
  `type` int(2) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblogin`
--

CREATE TABLE `tblogin` (
  `idLogin` int(10) NOT NULL,
  `name` varchar(35) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  `hash` varchar(60) NOT NULL,
  `idAcl` int(2) NOT NULL,
  `idStatus` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbstatus`
--

CREATE TABLE `tbstatus` (
  `idStatus` int(2) NOT NULL,
  `type` int(2) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbuser`
--

CREATE TABLE `tbuser` (
  `idUser` int(10) NOT NULL,
  `nameFull` int(100) NOT NULL,
  `cpf` int(11) NOT NULL,
  `dateBrith` date NOT NULL,
  `cellPhone` int(13) NOT NULL,
  `idLogin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbacl`
--
ALTER TABLE `tbacl`
  ADD PRIMARY KEY (`idAcl`),
  ADD UNIQUE KEY `UQ_type` (`type`);

--
-- Índices de tabela `tblogin`
--
ALTER TABLE `tblogin`
  ADD PRIMARY KEY (`idLogin`),
  ADD UNIQUE KEY `UQ_email` (`email`),
  ADD UNIQUE KEY `UQ_name` (`name`),
  ADD KEY `FK_idAcl` (`idAcl`),
  ADD KEY `FK_idStatus` (`idStatus`);

--
-- Índices de tabela `tbstatus`
--
ALTER TABLE `tbstatus`
  ADD PRIMARY KEY (`idStatus`),
  ADD UNIQUE KEY `UQ_type` (`type`);

--
-- Índices de tabela `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `UQ_cpf` (`cpf`),
  ADD UNIQUE KEY `UQ_cellPhone` (`cellPhone`),
  ADD UNIQUE KEY `UQ_idLogin` (`idLogin`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbacl`
--
ALTER TABLE `tbacl`
  MODIFY `idAcl` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tblogin`
--
ALTER TABLE `tblogin`
  MODIFY `idLogin` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbstatus`
--
ALTER TABLE `tbstatus`
  MODIFY `idStatus` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `idUser` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tblogin`
--
ALTER TABLE `tblogin`
  ADD CONSTRAINT `tblogin_ibfk_1` FOREIGN KEY (`idAcl`) REFERENCES `tbacl` (`idacl`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblogin_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `tbstatus` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbuser`
--
ALTER TABLE `tbuser`
  ADD CONSTRAINT `tbuser_ibfk_1` FOREIGN KEY (`idLogin`) REFERENCES `tblogin` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
