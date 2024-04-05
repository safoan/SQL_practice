--creating database
Create database planer_teacher;

Use planer_teacher;

--creating tables

-- Table Etudiant --
CREATE TABLE [Etudiant](
	[numero] [varchar](20) NOT NULL PRIMARY KEY ,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[age] [int] NOT NULL CHECK  ( [age]>0 ) );
	
-- Table Enseigant --	
CREATE TABLE [Enseignant](
	[id] [int]  NOT NULL PRIMARY KEY ,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL  );

-- Cours --
CREATE TABLE cours (
sigle VARCHAR(20) NOT NULL,
intitule VARCHAR(128) NOT NULL,
responsable [int] NOT NULL,
nombreSeances INT NOT NULL DEFAULT '0',
PRIMARY KEY (sigle),
FOREIGN KEY (responsable) REFERENCES enseignant(id)
);

-- Séance --
CREATE TABLE Seance (
cours VARCHAR(20) NOT NULL,
numero VARCHAR(50) NOT NULL,
type VARCHAR(2) NOT NULL CHECK(type in ('CM', 'TD', 'TP')),
date DATE NOT NULL,
salle VARCHAR(10) NOT NULL,
heureDebut TIME NOT NULL,
heureFin TIME NOT NULL,
enseignant int NOT NULL,
CONSTRAINT ck_01 CHECK (heureFin > heureDebut),
FOREIGN KEY (cours) REFERENCES Cours(sigle),
FOREIGN KEY (enseignant) REFERENCES Enseignant(id),		
PRIMARY KEY (cours,numero)
);

-- Inscription --
CREATE TABLE Inscription (
Etudiant VARCHAR(20) NOT NULL,
cours VARCHAR(20) NOT NULL,
FOREIGN KEY (cours) REFERENCES Cours(sigle),
FOREIGN KEY (Etudiant) REFERENCES Etudiant(numero),
PRIMARY KEY (cours,Etudiant)
);


