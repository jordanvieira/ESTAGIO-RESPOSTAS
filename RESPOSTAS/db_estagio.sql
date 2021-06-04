-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Jun-2021 às 21:03
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_atividades`
--
CREATE DATABASE IF NOT EXISTS `db_atividades` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_atividades`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_alunos`
--
-- Criação: 04-Jun-2021 às 18:39
--

CREATE TABLE `tb_alunos` (
  `CODALU` int(11) NOT NULL,
  `NOMEALU` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_alunos`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_aluno_curso`
--
-- Criação: 04-Jun-2021 às 18:52
--

CREATE TABLE `tb_aluno_curso` (
  `CODAC` int(11) NOT NULL,
  `CODALU` int(11) NOT NULL,
  `CODCUR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_aluno_curso`:
--   `CODALU`
--       `tb_alunos` -> `CODALU`
--   `CODCUR`
--       `tb_curso` -> `CODCURSO`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso`
--
-- Criação: 04-Jun-2021 às 18:41
--

CREATE TABLE `tb_curso` (
  `CODCURSO` int(11) NOT NULL,
  `NOMECURSO` varchar(50) NOT NULL,
  `NIVELCURSO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_curso`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_disciplina`
--
-- Criação: 04-Jun-2021 às 18:46
--

CREATE TABLE `tb_disciplina` (
  `CODDIS` int(11) NOT NULL,
  `NOMEDIS` varchar(50) NOT NULL,
  `CHDIS` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_disciplina`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_matricula`
--
-- Criação: 04-Jun-2021 às 18:42
--

CREATE TABLE `tb_matricula` (
  `CODMAT` int(11) NOT NULL,
  `CODAC` int(11) NOT NULL,
  `CODTURMA` int(11) NOT NULL,
  `CODPER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_matricula`:
--   `CODAC`
--       `tb_aluno_curso` -> `CODAC`
--   `CODTURMA`
--       `tb_turma` -> `CODTUR`
--   `CODPER`
--       `tb_periodo` -> `CODPER`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_matricula_disciplina`
--
-- Criação: 04-Jun-2021 às 18:44
--

CREATE TABLE `tb_matricula_disciplina` (
  `CODMD` int(11) NOT NULL,
  `CODMAT` int(11) NOT NULL,
  `CODDIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_matricula_disciplina`:
--   `CODMAT`
--       `tb_matricula` -> `CODMAT`
--   `CODDIS`
--       `tb_disciplina` -> `CODDIS`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_periodo`
--
-- Criação: 04-Jun-2021 às 18:43
--

CREATE TABLE `tb_periodo` (
  `CODPER` int(11) NOT NULL,
  `DECPER` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_periodo`:
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--
-- Criação: 04-Jun-2021 às 18:43
--

CREATE TABLE `tb_turma` (
  `CODTUR` int(11) NOT NULL,
  `NOMETURMA` varchar(50) NOT NULL,
  `SERIETURMA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_turma`:
--

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_alunos`
--
ALTER TABLE `tb_alunos`
  ADD PRIMARY KEY (`CODALU`);

--
-- Índices para tabela `tb_aluno_curso`
--
ALTER TABLE `tb_aluno_curso`
  ADD PRIMARY KEY (`CODAC`),
  ADD KEY `FK_ALUNO_E_CURSO` (`CODALU`),
  ADD KEY `FK_ALUNO_NO_CURSO` (`CODCUR`);

--
-- Índices para tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`CODCURSO`);

--
-- Índices para tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD PRIMARY KEY (`CODDIS`);

--
-- Índices para tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD PRIMARY KEY (`CODMAT`),
  ADD KEY `FK_MATRICULA_ALUNO` (`CODAC`),
  ADD KEY `FK_MATRICULA_TURMA` (`CODTURMA`),
  ADD KEY `FK_MAT_PERIODO` (`CODPER`);

--
-- Índices para tabela `tb_matricula_disciplina`
--
ALTER TABLE `tb_matricula_disciplina`
  ADD PRIMARY KEY (`CODMD`),
  ADD KEY `FK_MATRICULA_DISCIPLINA` (`CODMAT`),
  ADD KEY `FK_MAT_DISC` (`CODDIS`);

--
-- Índices para tabela `tb_periodo`
--
ALTER TABLE `tb_periodo`
  ADD PRIMARY KEY (`CODPER`);

--
-- Índices para tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`CODTUR`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_alunos`
--
ALTER TABLE `tb_alunos`
  MODIFY `CODALU` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_aluno_curso`
--
ALTER TABLE `tb_aluno_curso`
  MODIFY `CODAC` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `CODCURSO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  MODIFY `CODDIS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  MODIFY `CODMAT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_matricula_disciplina`
--
ALTER TABLE `tb_matricula_disciplina`
  MODIFY `CODMD` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_periodo`
--
ALTER TABLE `tb_periodo`
  MODIFY `CODPER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `CODTUR` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_aluno_curso`
--
ALTER TABLE `tb_aluno_curso`
  ADD CONSTRAINT `FK_ALUNO_E_CURSO` FOREIGN KEY (`CODALU`) REFERENCES `tb_alunos` (`CODALU`),
  ADD CONSTRAINT `FK_ALUNO_NO_CURSO` FOREIGN KEY (`CODCUR`) REFERENCES `tb_curso` (`CODCURSO`);

--
-- Limitadores para a tabela `tb_matricula`
--
ALTER TABLE `tb_matricula`
  ADD CONSTRAINT `FK_MATRICULA_ALUNO` FOREIGN KEY (`CODAC`) REFERENCES `tb_aluno_curso` (`CODAC`),
  ADD CONSTRAINT `FK_MATRICULA_TURMA` FOREIGN KEY (`CODTURMA`) REFERENCES `tb_turma` (`CODTUR`),
  ADD CONSTRAINT `FK_MAT_PERIODO` FOREIGN KEY (`CODPER`) REFERENCES `tb_periodo` (`CODPER`);

--
-- Limitadores para a tabela `tb_matricula_disciplina`
--
ALTER TABLE `tb_matricula_disciplina`
  ADD CONSTRAINT `FK_MATRICULA_DISCIPLINA` FOREIGN KEY (`CODMAT`) REFERENCES `tb_matricula` (`CODMAT`),
  ADD CONSTRAINT `FK_MAT_DISC` FOREIGN KEY (`CODDIS`) REFERENCES `tb_disciplina` (`CODDIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
