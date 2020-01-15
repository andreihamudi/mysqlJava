		/* 	8.011	Definirea procedurii - apelarea */
    
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

USE test;

CREATE PROCEDURE mesaj(nume TEXT) 

	SELECT CONCAT('Salut ', nume, '!') AS Salut;
    
call mesaj('Cristi');

CALL mesaj('Stefan'); -- Referinta relativa

USE PAUL;	-- Schimbam baza se date

CALL mesaj('Ioana'); -- procedura nu este cunoscuta

CALL test.mesaj('Ioana'); -- referinta absoluta OK

USE test;


	    /* 8.012	Cu o instructiune compusa (block)*/
    
DELIMITER /
CREATE PROCEDURE block() DETERMINISTIC
BEGIN 
		-- RAPORT 1
    SELECT continent, COUNT(*) AS Nr_Tari 
		FROM world.country 
        GROUP BY continent;
		-- RAPORT 2
    SELECT continent, SUM(population) AS Populatie 
		FROM world.country 
        GROUP BY continent;
		-- RAPORT 3
    SELECT @x+@y+@z AS suma;
    
END/
DELIMITER ;

SET @X = 10, @Y = 90, @Z = 900;

CALL block();

DROP PROCEDURE IF EXISTS block;


		/* 8.013 Blocuri de instructiuni imbricate */
        
DROP PROCEDURE IF EXISTS exemplu;

delimiter $

select database()$


CREATE PROCEDURE exemplu(pre VARCHAR(50), h1   INT, h2 INT, g1 INT, g2 INT)
COMMENT 'Returneaza persoana cu prenumele dat, orasul in care locuieste si de cand'

Unu: BEGIN
						-- selectam locuitorul si data nasterii
SELECT CONCAT_WS(' ', prenumele, numele), datan FROM paul.people1 WHERE prenumele = pre 
    AND inaltime BETWEEN h1 AND h2 
    AND greutate BETWEEN g1 AND g2 ORDER BY inaltime LIMIT 1 INTO @locuitorul, @datan;
    
    Doi: BEGIN			-- selectam orasul
		SELECT `name` FROM world.city ORDER BY RAND() LIMIT 1 INTO @orasul;
        
        Trei: BEGIN		-- selectam anul
			SET @anul = YEAR(@datan) + 5;
		END Trei;
	
    END Doi;

SELECT CONCAT_WS(' ', @locuitorul, 'traieste in', @orasul, 'din anul', @anul);

END$
		
CALL EXEMPLU('John', 170, 180, 70, 90)$



		/* 8.021	Parametrii unei proceduri 1*/
    
DELIMITER $

CREATE PROCEDURE test1(
	IN a INT,
    OUT b INT,
    INOUT c INT)
BEGIN 
	SELECT a,b,c; 		    -- result set
    
    SET a=1, b=2, c=3;	    -- setam valori initiale parametri
END $

DELIMITER ;

SET @X=100, @Y=200, @Z=300; 
	-- definim variabile

CALL test1(@X, @Y, @Z); -- apelam procedura

	-- pentru IN si INOUT au fost preluate 
    -- valorile variabilelor
    -- pentru OUT s-a returnat NULL

SELECT @X, @Y, @Z; 
	-- cum au fost influentate variabilele de procedura?
	-- a modificat valorile  variabilelor cu parametrii OUT si INOUT, NU si pe cel al parametrului IN
    
DROP PROCEDURE IF EXISTS test1;


		/* 8.022	Parametrii unei proceduri */ -- ACASA
    
DELIMITER $

CREATE PROCEDURE test2(
	IN a INT,
    OUT b INT,
    INOUT c INT)
BEGIN 
	SELECT a,b,c;	-- result set
    SET b=(a+c)*2+20;	-- setam param de iesire
END $

DELIMITER ;

SET @X=10, @Y=20, @Z=30; -- definim variabile

CALL test2(@X, @Y, @Z); -- apelam procedura

	-- pentru IN si INOUT au fost preluate 
    -- valorile variabilelor
    -- pentru OUT s-a returnat NULL

SELECT @X, @Y, @Z; 

	-- procedura a modificat valorile 
    -- variabilei cu parametrii OUT
    -- NU si pe cel al parametrului IN si INOUT
    
DROP PROCEDURE IF EXISTS test2;

