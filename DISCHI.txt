CREATE TABLE DISCO (
    NroSerie FLOAT NOT NULL,
    TitoloAlbum TEXT (100),
    Anno DOUBLE,
    Prezzo TEXT (100)
);

INSERT INTO DISCO (NroSerie, TitoloAlbum, Anno, Prezzo) VALUES
    (1, 'Suonare', 2020, '15€'),
    (2, 'Volare', 2015, '25€'),
    (3, 'Sale', NULL, '10€');

CREATE TABLE CONTIENE (
    NroSerieDisco FLOAT NOT NULL,
    CodiceReg FLOAT NOT NULL,
    NroProg FLOAT PRIMARY KEY
);

INSERT INTO CONTIENE (NroSerieDisco, CodiceReg, NroProg) VALUES
    (33, 4400,1),
    (5, 3300, 2),
    (7, 5500, 3);

CREATE TABLE ESECUZIONE (
    CodiceReg DOUBLE,
    TitoloCanz TEXT (100) NOT NULL,
    Anno DOUBLE
);

INSERT INTO ESECUZIONE (CodiceReg, TitoloCanz, Anno) VALUES
    (4400, 'GLORIA', 2020),
    (3300, 'Dipinto', 2015),
    (5500, 'Sapore', NULL);

CREATE TABLE AUTORE (
    Nome TEXT (100),
    TitoloCanz TEXT (100) NOT NULL,
    Anno DOUBLE 
);
INSERT INTO AUTORE (Nome, TitoloCanz, Anno) VALUES
    ("TOZZI","GLORIA", 2020),
    ("Modugno", "Dipinto", 2015),
    ("Paoli", "Sapore", NULL);
-- create a table
CREATE TABLE CANTANTE (
    NomeCantante TEXT(100) NOT NULL,
    CodiceReg FLOAT NOT NULL
);

INSERT INTO CANTANTE (NomeCantante, CodiceReg) VALUES
("TOZZI", 4400 ),
("Modugno", 3300),
("Gino", 5500);

#SCRITTO E CANTATO  D
SELECT A.Nome  FROM AUTORE A JOIN ESECUZIONE E ON A.TitoloCanz = E.TitoloCanz WHERE A.Nome LIKE "%D%";
#I titoli dei dischi che contengono canzoni di cui non si conosce l'anno di registrazione;
SELECT D.TitoloAlbum FROM DISCO D JOIN CONTIENE C ON D.NroSerie = C.NroProg JOIN ESECUZIONE E ON C.CodiceReg = E.CodiceReg WHERE D.Anno IS NULL; 
#I cantanti che hanno sempre registrato canzoni come solisti
SELECT C.NomeCantante FROM CANTANTE C JOIN AUTORE A ON C.NomeCantante = A.NOME GROUP BY C.NomeCantante HAVING COUNT(*) <= 1;

