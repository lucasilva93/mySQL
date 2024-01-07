CREATE TABLE STUDENTE (
    Matricola DOUBLE PRIMARY KEY,
    NomeStudente VARCHAR(50),
    AnnoLaurea YEAR,
    TitoloStudio VARCHAR(100),
    VotoLaurea DOUBLE
);

CREATE TABLE DIPARTIMENTO (
    CodiceDipartimento DOUBLE,
    NomeDipartimento VARCHAR (100),
    SettoreScientifico VARCHAR (100),
    NumDocenti DOUBLE
 );

CREATE TABLE CONCORSOMASTER (
    CodiceMaster DOUBLE,
    CodiceDipartimento DOUBLE,
    DataPubblicazione DATE,
    DataScadenza DATE,
    NumPostiDisponibili DOUBLE
    );

CREATE TABLE PARTECIPACONCORSOMASTER (
    CodiceDipartimento DOUBLE,
    CodiceMaster DOUBLE,
    Matricola DOUBLE,
    DataInvioDomanda DATE
    );

INSERT INTO STUDENTE (Matricola, NomeStudente, AnnoLaurea, TitoloStudio, VotoLaurea) VALUES 
    (1010, "FRANCESCO", "2021", "ECONOMIA AZIENDALE", 95),
    (1011, "GIANNI", "2021", "ECOMOMIA FINANZIARIA", 103),
    (1012, "ALBERTO", "2021", "BIOLOGIA MARINA", 90),
    (1013, "LUCA", "2022", "BIOCHIMICA", 88),
    (1014, "GIULIA", "2022", "ANATOMIA", 108),
    (1015, "KALLY", "2022", "MUSICA", 102),
    (1016, "ROBERTA", "2022", "PROGRAMMAZIONE",98)
    ;
INSERT INTO DIPARTIMENTO (CodiceDipartimento, NomeDipartimento, SettoreScientifico, NumDocenti) VALUES 
(1, "MARKETING", "ECONOMICO",6),
(2, "BIOLOGIA", "BIO-INGEGNERIA",7),
(3, "CHIRURGIA", "MEDICINA", 13),
(4, "CONSERVATORIO", "MUSICALE",4),
(5, "INFORMATICA","INGENGNERIA" ,17)
;

INSERT INTO CONCORSOMASTER (CodiceMaster,CodiceDipartimento,DataPubblicazione,DataScadenza,NumPostiDisponibili) VALUES 
(11, 1, "2023-01-10", "2023-02-10", 20),
(22, 2, "2023-02-25", "2023-03-25", 30),
(33, 3, "2023-04-12", "2023-04-12", 5),
(44, 4, "2023-04-12", "2023-06-22", 3),
(55, 5, "2023-06-01", "2023-07-01", 9),
(22, 2, "2023-06-01", "2023-08-01", 12),
(33, 3, "2023-04-12", "2023-04-12", 5)
;

INSERT INTO PARTECIPACONCORSOMASTER (CodiceDipartimento,CodiceMaster,Matricola,DataInvioDomanda) VALUES 
(1,11, 1010, "2023-01-24"),
(2,22, 1011, "2023-03-03"),
(3,33, 1012, "2023-04-27"),
(4,44, 1012,"2023-04-30"),
(5,55,1013, "2023-06-23"),
(2,22,1013, "2023-02-02"),
(5,55,1014, "2023-06-22"),
(2,22, 1015,"2023-06-22"),
(2,22,1012, "2023-03-04"),
(4,44,1013, "2023-04-29"),
(5,55, 1015, "2023-06-24")
    
;

SELECT S.NomeStudente, D.SettoreScientifico FROM STUDENTE S JOIN PARTECIPACONCORSOMASTER P ON S.Matricola = P.Matricola
JOIN CONCORSOMASTER C ON P.CodiceMaster = C.CodiceMaster AND P.CodiceDipartimento = C.CodiceDipartimento
JOIN DIPARTIMENTO D ON C.CodiceDipartimento = D.CodiceDipartimento 
WHERE S.Matricola IN (SELECT P.Matricola FROM PARTECIPACONCORSOMASTER P GROUP BY P.Matricola
HAVING COUNT(P.CodiceMaster) = 3) ORDER BY S.NomeStudente;
SELECT D.NomeDipartimento, D.SettoreScientifico, COUNT(C.CodiceMaster) AS CONTI FROM DIPARTIMENTO D
JOIN CONCORSOMASTER C  ON D.CodiceDipartimento = C.CodiceDipartimento WHERE C.NumPostiDisponibili > 7 GROUP BY D.NomeDipartimento, D.SettoreScientifico
ORDER BY D.NomeDipartimento, D.SettoreScientifico;
SELECT S.NomeStudente, S.Matricola, COUNT(*) AS PARTECIPAZIONI FROM STUDENTE S 
JOIN PARTECIPACONCORSOMASTER P ON S.Matricola = P.Matricola 
WHERE S.VotoLaurea > 100 GROUP BY S.Matricola HAVING COUNT(*) >=2;




#Per ogni studente che ha partecipato a 3 concorsi di master, visualizzare il nome dello studente e il settore scientifico per cui ha partecipato a tutti i concorsi. 
#Ordinare per Nome dello studente; 2) Per i dipartimenti in cui sono stati effettuati solo concorsi di master aventi ciascuno un numero di posti disponibili superiore a 7, 
#visualizzare il nome del dipartimento, il settore scientifico di afferenza e il numero di concorsi di master. Ordinare per nome del dipartimento e settore scientifico 3. 
#Visualizzare la matricola e il nome degli studenti che hanno conseguito un voto di laurea superiore a 100 ed hanno partecipato ad almeno due concorsi di master con la stessa data di pubblicazione