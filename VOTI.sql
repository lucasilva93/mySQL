CREATE TABLE STUDENTE (
    Matricola FLOAT,
    Nome TEXT (50),
    Citta TEXT (50)
);
CREATE TABLE CORSO (
    Codice FLOAT,
    Nome TEXT (50),
    MatricolaDocente FLOAT

    );
CREATE TABLE DOCENTE (
    Matricola FLOAT NOT NULL,
    Nome TEXT (50) NOT NULL
);

CREATE TABLE ESAME (
    Codice FLOAT NOT NULL,
    MatricolaStudente FLOAT,
    DATA DATE,
    Voto FLOAT,
    SettoreScientifico TEXT(50) 
    );

INSERT INTO STUDENTE (Matricola,Nome, Citta) VALUES
    (1577, "Luca", "Parma"),
    (2766, 'Giovanni',"Genova"),
    (2299, "Martina", "Mantova");
INSERT INTO CORSO (Codice, Nome, MatricolaDocente) VALUES
(1, "MATEMATICA", 3300),
(2, "GEOMETRIA", 4400),  
(3, "SCIENZA", 5500);
INSERT INTO DOCENTE (Matricola, Nome) VALUES
(3300, "GIACOMO"),
(4400, "FRANCESCO"),
(5500, "ANNA");
INSERT INTO ESAME (Codice, MatricolaStudente, DATA, Voto, SettoreScientifico) VALUES
(1, 1577, "2023-01-20",29,"ANALISI"),
(1, 1577, "2023-06-19",28,"ANALISI2"),
(2, 2766, "2023-05-08",30,"TRIGONOMETRIA"),
(3, 2299, "2023-09-30",30,"CHIMICA"),
(3, 2766, "2022-09-30",22,"BIOLOGIA"),
(3, 2766, "2021-09-30",28,"ROCCE"),
(3, 2299, "2023-06-30",26,"CHIMICA"),
(3, 2299, "2023-07-20",27,"FISICA"),
(3, 2299, "2023-08-12",28,"ASTROLOGIA"),
(3, 2299, "2023-05-06",29,"ASTRONOMIA"),
(3, 2299, "2023-05-07",26,"TERRA"),
(2, 2299, "2023-05-07",27,"ANALITICA"),
(2, 2299, "2023-05-07",26,"PIANA"),
(3, 2299, "2023-05-07",25,"FISICA"),
(3, 2299, "2023-010-09",28,"SUOLO");

SELECT E.MatricolaStudente, E.SettoreScientifico AS ESAMI, D.Nome AS DOCENTE
FROM DOCENTE D JOIN CORSO C ON D.Matricola = C.MatricolaDocente JOIN ESAME E 
ON C.Codice = E.Codice WHERE E.Voto >= 28;
SELECT D.Nome AS DOCENTE, C.Nome AS SETTORE, E.SettoreScientifico AS MATERIE
FROM DOCENTE D JOIN CORSO C ON D.Matricola = C.MatricolaDocente JOIN ESAME E ON C.Codice = E.Codice ;
#Visualizzare per ogni studente la matricola, il nome, il voto massimo, minimo e medio conseguito negli esami 
#Visualizzare - per ogni studente con media voti maggiore di 25 e che ha sostenuto esami in almeno 10 date
#la matricola, il nome, il voto massimo, minimo e medio conseguito negli esami. Ordinare per voto.
SELECT S.Matricola, S.Nome, MAX(E.Voto) AS VotoMigliore, MIN(E.Voto) AS VotoPeggiore, AVG(E.Voto) AS VotoMedio
FROM STUDENTE S JOIN ESAME E ON S.Matricola = E.MatricolaStudente GROUP BY S.Matricola, S.Nome
HAVING AVG(E.Voto) > 25  ORDER BY VotoMedio DESC;
SELECT S.Matricola, S.Nome, MAX(E.Voto) AS VotoMigliore, MIN(E.Voto) AS VotoPeggiore, AVG(E.Voto) AS VotoMedio
FROM STUDENTE S JOIN ESAME E ON S.Matricola = E.MatricolaStudente GROUP BY S.Matricola, S.Nome
HAVING AVG(E.Voto) >25 AND COUNT(E.DATA) >= 10 ORDER BY VotoMedio DESC;



