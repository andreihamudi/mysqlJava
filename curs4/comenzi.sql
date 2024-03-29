-- 1.
SELECT NOW();
SELECT CURDATE();
SELECT CURDATE() as 'azi este in';

-- 2.
SELECT * FROM studenti;

-- 3.
SELECT titlu_curs FROM cursuri;
-- 4.
SELECT nume, prenume FROM studenti;
-- 5.
SELECT * FROM studenti WHERE an between '1' AND '3';
SELECT * FROM studenti WHERE an IN('1','2','3');
SELECT * FROM studenti WHERE an='1' OR an='2' OR an='3';

-- 6.
SELECT SUM(bursa) FROM studenti WHERE an='1';
--7.
UPDATE studenti SET status='bursier' WHERE bursa IS NOT NULL;

-- ap3 1.
SELECT nume as 'Nume Profesor' FROM profesori;
-- ATENTIE
SELECT nume,prenume  FROM profesori;
SELECT nume prenume  FROM profesori;
-- ap3 2.
SELECT an, count(id) as nr  FROM studenti  GROUP BY an;

-- ap4
select * from student WHERE
         DATE_FORMAT(data_nastere,'%m-%d') ='09-11';

--ap4  8
SELECT * FROM `student` where bursa * 12 >4000 ;

SELECT c.id_curs, c.titlu_curs, n.valoare FROM `cursuri` c NATURAL JOIN note n;
SELECT * FROM studenti CROSS JOIN note;
SELECT * FROM studenti JOIN note;
SELECT * FROM studenti INNER JOIN note;
SELECT * FROM studenti , note;
SELECT * FROM studenti CROSS JOIN note WHERE prenume='Andrei';
SELECT * FROM studenti CROSS JOIN note CROSS JOIN cursuri;
SELECT * FROM cursuri INNER JOIN note USING (id_curs);
SELECT * FROM cursuri c INNER JOIN note n on c.id_curs= n.id_curs;
