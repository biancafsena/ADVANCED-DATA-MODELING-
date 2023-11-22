CREATE TABLE Hospital (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Localizacao VARCHAR(100) NOT NULL,
  QuantidadeQuartos INT NOT NULL
);

CREATE TABLE CorpoClinico (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE Medico (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Especialidade VARCHAR(50) NOT NULL,
  Contato VARCHAR(50) NOT NULL
);

CREATE TABLE Paciente (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(50) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Contato VARCHAR(50) NOT NULL,
  PlanoSaude VARCHAR(50) NOT NULL
);

CREATE TABLE Procedimento (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  TipoProcedimento VARCHAR(50) NOT NULL,
  Data DATE NOT NULL
);

CREATE TABLE Prontuario (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  PacienteID INT NOT NULL,
  MedicoID INT NOT NULL,
  HospitalID INT NOT NULL,
  ProcedimentoID INT NOT NULL,
  FOREIGN KEY (PacienteID) REFERENCES Paciente(ID),
  FOREIGN KEY (MedicoID) REFERENCES Medico(ID),
  FOREIGN KEY (HospitalID) REFERENCES Hospital(ID),
  FOREIGN KEY (ProcedimentoID) REFERENCES Procedimento(ID)
);

CREATE TABLE Hospital_CorpoClinico (
  HospitalID INT NOT NULL,
  CorpoClinicoID INT NOT NULL,
  PRIMARY KEY (HospitalID, CorpoClinicoID),
  FOREIGN KEY (HospitalID) REFERENCES Hospital(ID),
  FOREIGN KEY (CorpoClinicoID) REFERENCES CorpoClinico(ID)
);

CREATE TABLE CorpoClinico_Medico (
  CorpoClinicoID INT NOT NULL,
  MedicoID INT NOT NULL,
  PRIMARY KEY (CorpoClinicoID, MedicoID),
  FOREIGN KEY (CorpoClinicoID) REFERENCES CorpoClinico(ID),
  FOREIGN KEY (MedicoID) REFERENCES Medico(ID)
);

CREATE TABLE Medico_Procedimento (
  MedicoID INT NOT NULL,
  ProcedimentoID INT NOT NULL,
  PRIMARY KEY (MedicoID, ProcedimentoID),
  FOREIGN KEY (MedicoID) REFERENCES Medico(ID),
  FOREIGN KEY (ProcedimentoID) REFERENCES Procedimento(ID)
);


CREATE TABLE Hospital_Procedimento (
  HospitalID INT NOT NULL,
  ProcedimentoID INT NOT NULL,
  PRIMARY KEY (HospitalID, ProcedimentoID),
  FOREIGN KEY (HospitalID) REFERENCES Hospital(ID),
  FOREIGN KEY (ProcedimentoID) REFERENCES Procedimento(ID)
);

