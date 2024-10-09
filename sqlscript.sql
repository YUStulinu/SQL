REM   Script: Implementare Oracle Prodan Constantin Iustin
REM   Tema PBD

CREATE TABLE Banca ( 
    NumeBanca VARCHAR(50) PRIMARY KEY, 
    IDManager INT UNIQUE, 
    Adresa VARCHAR(100), 
    NumarSucursale INT 
);

CREATE TABLE Manager ( 
    IDManager INT PRIMARY KEY, 
    IDBanca VARCHAR(50) REFERENCES Banca(NumeBanca), 
    IDPersoana INT UNIQUE, 
    Nume VARCHAR(50), 
    Prenume VARCHAR(50), 
    Email VARCHAR(100), 
    Adresa VARCHAR(100) 
);

CREATE TABLE Sucursala ( 
    NumeSucursala VARCHAR(50) PRIMARY KEY, 
    NumeBanca VARCHAR(50) REFERENCES Banca(NumeBanca), 
    IDClient INT UNIQUE, 
    Adresa VARCHAR(100), 
    NumarATMuri INT 
);

CREATE TABLE ATM ( 
    IDATM INT PRIMARY KEY, 
    NumeSucursala VARCHAR(50) REFERENCES Sucursala(NumeSucursala), 
    Locatie VARCHAR(100), 
    Status VARCHAR(20) 
);

CREATE TABLE Angajat ( 
    IDAngajat INT PRIMARY KEY, 
    IDPersoana INT UNIQUE, 
    NumeBanca VARCHAR(50) REFERENCES Banca(NumeBanca), 
    Nume VARCHAR(50), 
    Prenume VARCHAR(50), 
    Email VARCHAR(100) 
);

ALTER TABLE Angajat 
ADD Adresa VARCHAR(100);

CREATE TABLE Client ( 
    IDClient INT PRIMARY KEY, 
    NumeSucursala VARCHAR(50) REFERENCES Sucursala(NumeSucursala), 
    IDPersoana INT UNIQUE, 
    Nume VARCHAR(50), 
    Prenume VARCHAR(50), 
    Email VARCHAR(100), 
    Adresa VARCHAR(100) 
);

CREATE TABLE Persoana ( 
    IDPersoana INT PRIMARY KEY, 
    Nume VARCHAR(50), 
    Prenume VARCHAR(50), 
    Email VARCHAR(100), 
    Adresa VARCHAR(100) 
);

CREATE TABLE Card ( 
    NumarCard VARCHAR(16) PRIMARY KEY, 
    IDClient INT REFERENCES Client(IDClient), 
    NumarCont VARCHAR(20), 
    Tip VARCHAR(50), 
    Descriere VARCHAR(255) 
);

CREATE TABLE Cont ( 
    NumarCont VARCHAR(20) PRIMARY KEY, 
    IDClient INT REFERENCES Client(IDClient), 
    Suma DECIMAL(18, 2) 
);

CREATE TABLE Tranzactie ( 
    NumarTranzactie VARCHAR(50) PRIMARY KEY, 
    NumarCont VARCHAR(20) REFERENCES Cont(NumarCont), 
    Depunere DECIMAL(18, 4), 
    Retragere DECIMAL(18, 4), 
    Transfer DECIMAL(18, 4) 
);

CREATE TABLE Credit ( 
    NumarCredit VARCHAR(50) PRIMARY KEY, 
    NumarCont VARCHAR(20) REFERENCES Cont(NumarCont), 
    SumaImprumutata DECIMAL(18, 4), 
    RataDobanda DECIMAL(18, 4), 
    DetaliiRambursare VARCHAR(255) 
);

ALTER TABLE Banca 
ADD CONSTRAINT FK_Banca_Manager 
FOREIGN KEY (IDManager) 
REFERENCES Manager(IDManager);

ALTER TABLE Sucursala 
ADD CONSTRAINT FK_Sucursala_Client 
FOREIGN KEY (IDClient) 
REFERENCES Client(IDClient);

ALTER TABLE Manager 
ADD CONSTRAINT FK_Manager_Persoana 
FOREIGN KEY (IDPersoana) 
REFERENCES Persoana(IDPersoana);

ALTER TABLE Angajat 
ADD CONSTRAINT FK_Angajat_Persoana 
FOREIGN KEY (IDPersoana) 
REFERENCES Persoana(IDPersoana);

ALTER TABLE Client 
ADD CONSTRAINT FK_Client_Persoana 
FOREIGN KEY (IDPersoana) 
REFERENCES Persoana(IDPersoana);

ALTER TABLE Card 
ADD CONSTRAINT FK_Card_Cont 
FOREIGN KEY (NumarCont) 
REFERENCES Cont(NumarCont);

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (201, 'Persoana1', 'Prenume1', 'persoana1@email.com', 'Adresa1');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (202, 'Persoana2', 'Prenume2', 'persoana2@email.com', 'Adresa2');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (203, 'Persoana3', 'Prenume3', 'persoana3@email.com', 'Adresa3');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (205, 'Persoana5', 'Prenume5', 'persoana5@email.com', 'Adresa5');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (204, 'Persoana4', 'Prenume4', 'persoana4@email.com', 'Adresa4');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (206, 'Persoana6', 'Prenume6', 'persoana6@email.com', 'Adresa6');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (207, 'Persoana7', 'Prenume7', 'persoana7@email.com', 'Adresa7');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (208, 'Persoana8', 'Prenume8', 'persoana8@email.com', 'Adresa8');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (209, 'Persoana9', 'Prenume9', 'persoana9@email.com', 'Adresa9');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (210, 'Persoana10', 'Prenume10', 'persoana10@email.com', 'Adresa10');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (211, 'Persoana11', 'Prenume11', 'persoana11@email.com', 'Adresa11');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (212, 'Persoana12', 'Prenume12', 'persoana12@email.com', 'Adresa12');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (213, 'Persoana13', 'Prenume13', 'persoana13@email.com', 'Adresa13');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (214, 'Persoana14', 'Prenume14', 'persoana14@email.com', 'Adresa14');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (215, 'Persoana15', 'Prenume15', 'persoana15@email.com', 'Adresa15');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (216, 'Persoana16', 'Prenume16', 'persoana16@email.com', 'Adresa16');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (217, 'Persoana17', 'Prenume17', 'persoana17@email.com', 'Adresa17');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (218, 'Persoana18', 'Prenume18', 'persoana18@email.com', 'Adresa18');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (220, 'Persoana20', 'Prenume20', 'persoana20@email.com', 'Adresa20');

INSERT INTO Persoana (IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (219, 'Persoana19', 'Prenume19', 'persoana19@email.com', 'Adresa19');

SELECT * FROM Persoana;

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (101, 201, 'Nume1', 'Prenume1', 'email1@banca.com', 'Adresa1');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (102, 202, 'Nume2', 'Prenume2', 'email2@banca.com', 'Adresa2');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (103, 203, 'Nume3', 'Prenume3', 'email3@banca.com', 'Adresa3');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (104, 204, 'Nume4', 'Prenume4', 'email4@banca.com', 'Adresa4');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (105, 205, 'Nume5', 'Prenume5', 'email5@banca.com', 'Adresa5');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (106, 206, 'Nume6', 'Prenume6', 'email6@banca.com', 'Adresa6');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (107, 207, 'Nume7', 'Prenume7', 'email7@banca.com', 'Adresa7');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (108, 208, 'Nume8', 'Prenume8', 'email8@banca.com', 'Adresa8');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (109, 209, 'Nume9', 'Prenume9', 'email9@banca.com', 'Adresa9');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (110, 210, 'Nume10', 'Prenume10', 'email10@banca.com', 'Adresa10');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (111, 211, 'Nume11', 'Prenume11', 'email11@banca.com', 'Adresa11');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (112, 212, 'Nume12', 'Prenume12', 'email12@banca.com', 'Adresa12');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (113, 213, 'Nume13', 'Prenume13', 'email13@banca.com', 'Adresa13');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (116, 216, 'Nume16', 'Prenume16', 'email16@banca.com', 'Adresa16');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (117, 217, 'Nume17', 'Prenume17', 'email17@banca.com', 'Adresa17');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (114, 214, 'Nume14', 'Prenume14', 'email14@banca.com', 'Adresa14');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (115, 215, 'Nume15', 'Prenume15', 'email15@banca.com', 'Adresa15');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (118, 218, 'Nume18', 'Prenume18', 'email18@banca.com', 'Adresa18');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (119, 219, 'Nume19', 'Prenume19', 'email19@banca.com', 'Adresa19');

INSERT INTO Manager (IDManager, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (120, 220, 'Nume20', 'Prenume20', 'email20@banca.com', 'Adresa20');

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca1', 101, 'Adresa1', 5);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca2', 102, 'Adresa2', 8);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca3', 103, 'Adresa3', 6);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca4', 104, 'Adresa4', 10);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca5', 105, 'Adresa5', 7);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca7', 107, 'Adresa7', 9);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca8', 108, 'Adresa8', 3);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca6', 106, 'Adresa6', 4);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca9', 109, 'Adresa9', 12);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca10', 110, 'Adresa10', 11);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca11', 111, 'Adresa11', 8);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca12', 112, 'Adresa12', 5);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca14', 114, 'Adresa14', 6);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca16', 116, 'Adresa16', 4);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca13', 113, 'Adresa13', 7);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca15', 115, 'Adresa15', 9);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca17', 117, 'Adresa17', 10);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca18', 118, 'Adresa18', 3);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca20', 120, 'Adresa20', 7);

INSERT INTO Banca (NumeBanca, IDManager, Adresa, NumarSucursale) 
VALUES 
  ('Banca19', 119, 'Adresa19', 6);

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (301, 201, 'Banca1', 'Angajat1', 'Prenume1', 'angajat1@banca.com', 'AdresaAngajat1');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (302, 202, 'Banca2', 'Angajat2', 'Prenume2', 'angajat2@banca.com', 'AdresaAngajat2');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (303, 203, 'Banca3', 'Angajat3', 'Prenume3', 'angajat3@banca.com', 'AdresaAngajat3');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (304, 204, 'Banca4', 'Angajat4', 'Prenume4', 'angajat4@banca.com', 'AdresaAngajat4');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (305, 205, 'Banca5', 'Angajat5', 'Prenume5', 'angajat5@banca.com', 'AdresaAngajat5');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (306, 206, 'Banca6', 'Angajat6', 'Prenume6', 'angajat6@banca.com', 'AdresaAngajat6');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (307, 207, 'Banca7', 'Angajat7', 'Prenume7', 'angajat7@banca.com', 'AdresaAngajat7');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (308, 208, 'Banca8', 'Angajat8', 'Prenume8', 'angajat8@banca.com', 'AdresaAngajat8');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (309, 209, 'Banca9', 'Angajat9', 'Prenume9', 'angajat9@banca.com', 'AdresaAngajat9');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (310, 210, 'Banca10', 'Angajat10', 'Prenume10', 'angajat10@banca.com', 'AdresaAngajat10');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (311, 211, 'Banca11', 'Angajat11', 'Prenume11', 'angajat11@banca.com', 'AdresaAngajat11');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (312, 212, 'Banca12', 'Angajat12', 'Prenume12', 'angajat12@banca.com', 'AdresaAngajat12');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (313, 213, 'Banca13', 'Angajat13', 'Prenume13', 'angajat13@banca.com', 'AdresaAngajat13');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (314, 214, 'Banca14', 'Angajat14', 'Prenume14', 'angajat14@banca.com', 'AdresaAngajat14');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (316, 216, 'Banca16', 'Angajat16', 'Prenume16', 'angajat16@banca.com', 'AdresaAngajat16');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (315, 215, 'Banca15', 'Angajat15', 'Prenume15', 'angajat15@banca.com', 'AdresaAngajat15');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (318, 218, 'Banca18', 'Angajat18', 'Prenume18', 'angajat18@banca.com', 'AdresaAngajat18');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (317, 217, 'Banca17', 'Angajat17', 'Prenume17', 'angajat17@banca.com', 'AdresaAngajat17');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (319, 219, 'Banca19', 'Angajat19', 'Prenume19', 'angajat19@banca.com', 'AdresaAngajat19');

INSERT INTO Angajat (IDAngajat, IDPersoana, NumeBanca, Nume, Prenume, Email, Adresa) 
VALUES 
  (320, 220, 'Banca20', 'Angajat20', 'Prenume20', 'angajat20@banca.com', 'AdresaAngajat20');

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala1', 'Banca1','AdresaSucursala1', 5);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala2', 'Banca2','AdresaSucursala2', 8);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala3', 'Banca3', 'AdresaSucursala3', 6);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala4', 'Banca4','AdresaSucursala4', 10);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala5', 'Banca5', 'AdresaSucursala5', 7);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala6', 'Banca6', 'AdresaSucursala6', 4);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala7', 'Banca7', 'AdresaSucursala7', 9);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala8', 'Banca8', 'AdresaSucursala8', 3);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala9', 'Banca9', 'AdresaSucursala9', 12);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala10', 'Banca10', 'AdresaSucursala10', 11);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala11', 'Banca11', 'AdresaSucursala11', 8);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala13', 'Banca13', 'AdresaSucursala13', 7);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala12', 'Banca12', 'AdresaSucursala12', 5);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala14', 'Banca14', 'AdresaSucursala14', 6);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala15', 'Banca15', 'AdresaSucursala15', 9);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala16', 'Banca16', 'AdresaSucursala16', 4);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala19', 'Banca19', 'AdresaSucursala19', 6);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala17', 'Banca17', 'AdresaSucursala17', 10);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala18', 'Banca18', 'AdresaSucursala18', 3);

INSERT INTO Sucursala (NumeSucursala, NumeBanca, Adresa, NumarATMuri) 
VALUES 
  ('Sucursala20', 'Banca20', 'AdresaSucursala20', 7);

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (401, 'Sucursala1', 'LocatieATM1', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (402, 'Sucursala2', 'LocatieATM2', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (403, 'Sucursala3', 'LocatieATM3', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (404, 'Sucursala4', 'LocatieATM4', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (405, 'Sucursala5', 'LocatieATM5', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (406, 'Sucursala6', 'LocatieATM6', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (407, 'Sucursala7', 'LocatieATM7', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (408, 'Sucursala8', 'LocatieATM8', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (409, 'Sucursala9', 'LocatieATM9', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (410, 'Sucursala10', 'LocatieATM10', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (411, 'Sucursala11', 'LocatieATM11', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (412, 'Sucursala12', 'LocatieATM12', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (413, 'Sucursala13', 'LocatieATM13', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (415, 'Sucursala15', 'LocatieATM15', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (417, 'Sucursala17', 'LocatieATM17', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (418, 'Sucursala18', 'LocatieATM18', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (414, 'Sucursala14', 'LocatieATM14', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (416, 'Sucursala16', 'LocatieATM16', 'Activ');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (419, 'Sucursala19', 'LocatieATM19', 'Inactiv');

INSERT INTO ATM (IDATM, NumeSucursala, Locatie, Status) 
VALUES 
  (420, 'Sucursala20', 'LocatieATM20', 'Activ');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (501, 'Sucursala1', 201, 'Client1', 'Prenume1', 'client1@email.com', 'AdresaClient1');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (502, 'Sucursala2', 202, 'Client2', 'Prenume2', 'client2@email.com', 'AdresaClient2');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (503, 'Sucursala3', 203, 'Client3', 'Prenume3', 'client3@email.com', 'AdresaClient3');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (504, 'Sucursala4', 204, 'Client4', 'Prenume4', 'client4@email.com', 'AdresaClient4');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (505, 'Sucursala5', 205, 'Client5', 'Prenume5', 'client5@email.com', 'AdresaClient5');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (506, 'Sucursala6', 206, 'Client6', 'Prenume6', 'client6@email.com', 'AdresaClient6');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (507, 'Sucursala7', 207, 'Client7', 'Prenume7', 'client7@email.com', 'AdresaClient7');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (508, 'Sucursala8', 208, 'Client8', 'Prenume8', 'client8@email.com', 'AdresaClient8');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (509, 'Sucursala9', 209, 'Client9', 'Prenume9', 'client9@email.com', 'AdresaClient9');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (510, 'Sucursala10', 210, 'Client10', 'Prenume10', 'client10@email.com', 'AdresaClient10');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (511, 'Sucursala11', 211, 'Client11', 'Prenume11', 'client11@email.com', 'AdresaClient11');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (513, 'Sucursala13', 213, 'Client13', 'Prenume13', 'client13@email.com', 'AdresaClient13');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (515, 'Sucursala15', 215, 'Client15', 'Prenume15', 'client15@email.com', 'AdresaClient15');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (517, 'Sucursala17', 217, 'Client17', 'Prenume17', 'client17@email.com', 'AdresaClient17');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (512, 'Sucursala12', 212, 'Client12', 'Prenume12', 'client12@email.com', 'AdresaClient12');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (514, 'Sucursala14', 214, 'Client14', 'Prenume14', 'client14@email.com', 'AdresaClient14');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (516, 'Sucursala16', 216, 'Client16', 'Prenume16', 'client16@email.com', 'AdresaClient16');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (518, 'Sucursala18', 218, 'Client18', 'Prenume18', 'client18@email.com', 'AdresaClient18');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (519, 'Sucursala19', 219, 'Client19', 'Prenume19', 'client19@email.com', 'AdresaClient19');

INSERT INTO Client (IDClient, NumeSucursala, IDPersoana, Nume, Prenume, Email, Adresa) 
VALUES 
  (520, 'Sucursala20', 220, 'Client20', 'Prenume20', 'client20@email.com', 'AdresaClient20');

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('222222', 502, 15000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('111111', 501, 10000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('88888', 508, 30000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('333333', 503, 20000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('444444', 504, 12000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('555555', 505, 18000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('666666', 506, 25000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('777777', 507, 30000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('999999', 509, 17000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('101010', 510, 22000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1111111', 511, 13000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1212121', 512, 19000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1313131', 513, 16000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1414141', 514, 24000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1515151', 515, 27000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1616161', 516, 14000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1717171', 517, 23000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1818181', 518, 7000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('1919191', 519, 11000.00);

INSERT INTO Cont (NumarCont, IDClient, Suma) 
VALUES 
  ('2020202', 520, 2000.00);

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('6666777788889999', 506, '666666', 'Debit', 'CardDebit6');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1111222233334444', 501, '111111', 'Credit', 'CardCredit1');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('2222333344445555', 502, '222222', 'Debit', 'CardDebit2');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('3333444455556666', 503, '333333', 'Credit', 'CardCredit3');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('4444555566667777', 504, '444444', 'Debit', 'CardDebit4');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('5555666677778888', 505, '555555', 'Credit', 'CardCredit5');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('7777888899990000', 507, '777777', 'Credit', 'CardCredit7');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('8888999900001111', 508, '88888', 'Debit', 'CardDebit8');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('9999000011112222', 509, '999999', 'Credit', 'CardCredit9');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1010101010101010', 510, '101010', 'Debit', 'CardDebit10');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1212333444555666', 512, '1212121', 'Debit', 'CardDebit12');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1313444555666777', 513, '1313131', 'Credit', 'CardCredit13');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1414555666777888', 514, '1414141', 'Debit', 'CardDebit14');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1515666777888999', 515, '1515151', 'Credit', 'CardCredit15');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1616777888999000', 516, '1616161', 'Debit', 'CardDebit16');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1717888999000111', 517, '1717171', 'Credit', 'CardCredit17');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1919000111222333', 519, '1919191', 'Credit', 'CardCredit19');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('1818999000111222', 518, '1818181', 'Debit', 'CardDebit18');

INSERT INTO Card (NumarCard, IDClient, NumarCont, Tip, Descriere) 
VALUES 
  ('2020111222333444', 520, '2020202', 'Debit', 'CardDebit20');

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1003, '333333', 1000.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1007, '777777', 2000.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1001, '111111', 500.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1002, '222222', NULL, 200.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1004, '444444', NULL, 300.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1005, '555555', 150.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1006, '666666', NULL, 700.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1008, '88888', NULL, 100.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1010, '101010', NULL, 3000.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1009, '999999', 500.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1013, '1313131', 1200.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1014, '1414141', NULL, 700.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1011, '1111111', 800.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1012, '1212121', NULL, 400.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1016, '1616161', NULL, 1500.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1017, '1717171', 1000.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1015, '1515151', 300.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1018, '1818181', NULL, 200.00, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1019, '1919191', 600.00, NULL, NULL);

INSERT INTO Tranzactie (NumarTranzactie, NumarCont, Depunere, Retragere, Transfer) 
VALUES 
  (1020, '2020202', NULL, 800.00, NULL);

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2001, '111111', 3000.00, 5.0, 'Rata lunara, 12 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2002, '222222', 5000.00, 6.0, 'Rata lunara, 24 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2003, '333333', 8000.00, 4.5, 'Rata lunara, 18 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2004, '444444', 2000.00, 7.0, 'Rata lunara, 6 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2005, '555555', 6000.00, 5.5, 'Rata lunara, 36 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2006, '666666', 4000.00, 6.5, 'Rata lunara, 24 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2007, '777777', 10000.00, 4.0, 'Rata lunara, 48 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2009, '999999', 7000.00, 5.0, 'Rata lunara, 30 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2010, '101010', 9000.00, 6.5, 'Rata lunara, 24 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2008, '88888', 1500.00, 8.0, 'Rata lunara, 12 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2011, '1111111', 1200.00, 7.0, 'Rata lunara, 12 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2012, '1212121', 4500.00, 5.5, 'Rata lunara, 18 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2013, '1313131', 5500.00, 6.0, 'Rata lunara, 24 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2014, '1414141', 3000.00, 7.5, 'Rata lunara, 12 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2015, '1515151', 8000.00, 4.0, 'Rata lunara, 36 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2017, '1717171', 9500.00, 5.0, 'Rata lunara, 42 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2016, '1616161', 6000.00, 5.5, 'Rata lunara, 24 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2018, '1818181', 2000.00, 6.0, 'Rata lunara, 12 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2019, '1919191', 3500.00, 7.0, 'Rata lunara, 18 luni');

INSERT INTO Credit (NumarCredit, NumarCont, SumaImprumutata, RataDobanda, DetaliiRambursare) 
VALUES 
  (2020, '2020202', 1800.00, 8.0, 'Rata lunara, 12 luni');

CREATE INDEX idx_nume_persoana ON Persoana(Nume);

SELECT Nume, Prenume FROM Persoana WHERE IDPersoana < 215;

SELECT C.NumarCard, P.Nume, P.Prenume 
FROM Card C 
JOIN Client Cl ON C.IDClient = Cl.IDClient 
JOIN Persoana P ON Cl.IDPersoana = P.IDPersoana;

UPDATE Persoana SET Email = 'nou@email.com' WHERE IDPersoana = 213;

DELETE FROM Client WHERE IDClient = 1001;

CREATE OR REPLACE FUNCTION CalculSumaTotalaSoldurilor RETURN NUMBER AS 
  total_sum NUMBER; 
BEGIN 
  SELECT SUM(Suma) INTO total_sum FROM Cont; 
  RETURN total_sum; 
END;
/

CREATE OR REPLACE PROCEDURE ActualizeazaAdresaClient( 
  p_IDClient IN NUMBER, 
  p_AdresaNoua IN VARCHAR2 
) AS 
BEGIN 
  UPDATE Client SET Adresa = p_AdresaNoua WHERE IDClient = p_IDClient; 
  COMMIT; 
END;
/

SELECT C.NumarCont, P.Nume, P.Prenume, C.Suma 
FROM Cont C 
JOIN Client Cl ON C.IDClient = Cl.IDClient 
JOIN Persoana P ON Cl.IDPersoana = P.IDPersoana 
WHERE C.Suma > 5000;

CREATE OR REPLACE FUNCTION NumarTotalClienti RETURN NUMBER AS 
  total_clienti NUMBER; 
BEGIN 
  SELECT COUNT(*) INTO total_clienti FROM Client; 
  RETURN total_clienti; 
END;
/

CREATE OR REPLACE PROCEDURE ActualizeazaAdresaClient( 
  p_IDClient IN NUMBER, 
  p_AdresaNoua IN VARCHAR2 
) AS 
BEGIN 
  UPDATE Client SET Adresa = p_AdresaNoua WHERE IDClient = p_IDClient; 
  COMMIT; 
END;
/

CREATE OR REPLACE FUNCTION ClientiCuSoldMaiMare( 
  p_ValoareSold IN NUMBER 
) RETURN SYS_REFCURSOR AS 
  v_cursor SYS_REFCURSOR; 
BEGIN 
  OPEN v_cursor FOR 
    SELECT C.Nume, C.Prenume, C.Email, C.Adresa 
    FROM Client C 
    JOIN Cont Co ON C.IDClient = Co.IDClient 
    WHERE Co.Suma > p_ValoareSold; 
 
  RETURN v_cursor; 
END;
/

CREATE OR REPLACE PROCEDURE ActualizeazaSoldCont( 
  p_NumarCont IN VARCHAR2, 
  p_NumarTranzactii IN NUMBER, 
  p_ValoareTranzactii IN NUMBER 
) AS 
BEGIN 
  UPDATE Cont 
  SET Suma = Suma + (p_NumarTranzactii * p_ValoareTranzactii) 
  WHERE NumarCont = p_NumarCont; 
 
  COMMIT; 
END;
/

SELECT IDClient, SUM(Suma) AS SumaTotala 
FROM Cont 
GROUP BY IDClient;

CREATE VIEW VederClienti AS 
SELECT Nume, Adresa 
FROM Client;

