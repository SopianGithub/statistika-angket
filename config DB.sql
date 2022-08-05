-- angket_gita.rekap_x source

CREATE OR REPLACE ALGORITHM = UNDEFINED VIEW `angket_gita`.`rekap_x` AS select `angket_gita`.`nilai_angket`.`RESPONDEN` AS `RESPONDEN`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '1'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P1`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '2'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P2`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '3'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P3`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '4'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P4`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '5'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P5`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '6'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P6`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '7'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P7`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '8'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P8`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '9'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P9`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '10'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P10`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '11'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P11`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '12'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P12`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '13'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P13`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '14'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P14`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '15'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P15`, sum(`angket_gita`.`nilai_angket`.`NILAI`) AS `TOTAL`
from `angket_gita`.`nilai_angket`
where(`angket_gita`.`nilai_angket`.`VARIABLE` = 'X')
group by `angket_gita`.`nilai_angket`.`RESPONDEN`;


-- angket_gita.rekap_y source

CREATE OR REPLACE ALGORITHM = UNDEFINED VIEW `angket_gita`.`rekap_y` AS select `angket_gita`.`nilai_angket`.`RESPONDEN` AS `RESPONDEN`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '1'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P1`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '2'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P2`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '3'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P3`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '4'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P4`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '5'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P5`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '6'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P6`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '7'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P7`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '8'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P8`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '9'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P9`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '10'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P10`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '11'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P11`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '12'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P12`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '13'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P13`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '14'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P14`, sum(if((`angket_gita`.`nilai_angket`.`PARAMETERS` = '15'), `angket_gita`.`nilai_angket`.`NILAI`, 0)) AS `P15`, sum(`angket_gita`.`nilai_angket`.`NILAI`) AS `TOTAL`
from `angket_gita`.`nilai_angket`
where(`angket_gita`.`nilai_angket`.`VARIABLE` = 'Y')
group by `angket_gita`.`nilai_angket`.`RESPONDEN`;

-- angket_gita.simpangan_avg_x source

CREATE OR REPLACE ALGORITHM = UNDEFINED VIEW `angket_gita`.`simpangan_avg_x` AS select `angket_gita`.`distribusi_x`.`TOTAL` AS `TOTAL`, `angket_gita`.`distribusi_x`.`JML_RES` AS `JML_RES`, `angket_gita`.`distribusi_x`.`RATA_RATA` AS `RATA_RATA`, round(`F_RATA_RATA`('X'), 1) AS `X`,(`angket_gita`.`distribusi_x`.`RATA_RATA` - `F_RATA_RATA`('X')) AS `XIX`, abs((`angket_gita`.`distribusi_x`.`RATA_RATA` - `F_RATA_RATA`('X'))) AS `ABS_XIX`,(`angket_gita`.`distribusi_x`.`JML_RES` * abs((`angket_gita`.`distribusi_x`.`RATA_RATA` - `F_RATA_RATA`('X')))) AS `FI_RATA`
from `angket_gita`.`distribusi_x`;

-- angket_gita.simpangan_avg_y source

CREATE OR REPLACE ALGORITHM = UNDEFINED VIEW `angket_gita`.`simpangan_avg_y` AS select `angket_gita`.`distribusi_y`.`TOTAL` AS `TOTAL`, `angket_gita`.`distribusi_y`.`JML_RES` AS `JML_RES`, `angket_gita`.`distribusi_y`.`RATA_RATA` AS `RATA_RATA`, round(`F_RATA_RATA`('X'), 1) AS `X`,(`angket_gita`.`distribusi_y`.`RATA_RATA` - `F_RATA_RATA`('X')) AS `XIX`, abs((`angket_gita`.`distribusi_y`.`RATA_RATA` - `F_RATA_RATA`('X'))) AS `ABS_XIX`,(`angket_gita`.`distribusi_y`.`JML_RES` * abs((`angket_gita`.`distribusi_y`.`RATA_RATA` - `F_RATA_RATA`('X')))) AS `FI_RATA`
from `angket_gita`.`distribusi_y`;

-- angket_gita.simpangan_avg_y2 source

CREATE OR REPLACE ALGORITHM = UNDEFINED VIEW `angket_gita`.`simpangan_avg_y2` AS select `angket_gita`.`distribusi_y2`.`TOTAL` AS `TOTAL`, `angket_gita`.`distribusi_y2`.`JML_RES` AS `JML_RES`, `angket_gita`.`distribusi_y2`.`RATA_RATA` AS `RATA_RATA`, round(`F_RATA_RATA`('X'), 1) AS `X`,(`angket_gita`.`distribusi_y2`.`RATA_RATA` - `F_RATA_RATA`('X')) AS `XIX`, abs((`angket_gita`.`distribusi_y2`.`RATA_RATA` - `F_RATA_RATA`('X'))) AS `ABS_XIX`,(`angket_gita`.`distribusi_y2`.`JML_RES` * abs((`angket_gita`.`distribusi_y2`.`RATA_RATA` - `F_RATA_RATA`('X')))) AS `FI_RATA`
from `angket_gita`.`distribusi_y2`;


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_COUNTINTERVAL`(VARRES VARCHAR(2)) RETURNS double
BEGIN
	
	DECLARE INTERVAL_COUNT DOUBLE;
	DECLARE JUM_RESPON INTEGER;
	
	IF VARRES = 'X' THEN
		SELECT COUNT(RESPONDEN)
		INTO JUM_RESPON
		FROM rekap_x;
	ELSE
		SELECT COUNT(RESPONDEN)
		INTO JUM_RESPON
		FROM rekap_y;
	END IF;
	
	SET INTERVAL_COUNT = 1 + 3.3 * Log(10, JUM_RESPON);
	
	RETURN INTERVAL_COUNT;
END



CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_HIPOTESIS`() RETURNS double
BEGIN
	
	DECLARE T DOUBLE;
	DECLARE RS DOUBLE;
	DECLARE N INTEGER;

	SELECT F_KORELASI()
	INTO RS;

	SELECT COUNT(RESPONDEN)
	INTO N
	FROM BEDA_RANGKING;

	SET T = RS * ( SQRT(N - 2) / (1 - POW(RS, 2)) );

	RETURN T;
END


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_IMBUHAN`(VARRES VARCHAR(2), JML_PRM INTEGER) RETURNS double
BEGIN
	DECLARE COUNT_PRM DOUBLE;
	
	IF VARRES = 'X' THEN
		SELECT 1/COUNT(RESPONDEN)
		INTO COUNT_PRM
		FROM rekap_x
		WHERE TOTAL = JML_PRM;
	ELSE
		SELECT 1/COUNT(RESPONDEN)
		INTO COUNT_PRM
		FROM rekap_Y
		WHERE TOTAL = JML_PRM;
	END IF;

	RETURN COUNT_PRM;
END


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_KORELASI`() RETURNS double
BEGIN
	
	DECLARE JUM_BR DOUBLE;
	DECLARE JUM_RS INTEGER;
	DECLARE RS DOUBLE;
	
	SELECT SUM(DI2)
	INTO JUM_BR
	FROM BEDA_RANGKING;

	SELECT COUNT(RESPONDEN)
	INTO JUM_RS
	FROM BEDA_RANGKING;

	
	SET RS = 1 - ( (6 * JUM_BR)/(POW(JUM_RS, 3) - JUM_RS) );
	
	RETURN RS;
	
END


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_LENGTHINTERVAL`(VARRES VARCHAR(2)) RETURNS double
BEGIN
	
	DECLARE LENGIT DOUBLE;
	
	SELECT F_RENTANG(VARRES) / F_COUNTINTERVAL(VARRES)
	INTO LENGIT;
	
	RETURN LENGIT;
	
END

CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_RATA_RATA`(VARRES VARCHAR(2)) RETURNS double
BEGIN
	
	DECLARE RATA DOUBLE;
	
	IF VARRES = 'X' THEN
		SELECT SUM(JML_RATA_RATA) / SUM(JML_RES)
		INTO RATA
		FROM DISTRIBUSI_X;
	ELSE 
		SELECT SUM(JML_RATA_RATA) / SUM(JML_RES)
		INTO RATA
		FROM DISTRIBUSI_Y;
	END IF;
	
	RETURN RATA;

END


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_RENTANG`(VARRES VARCHAR(2)) RETURNS int(11)
BEGIN
	DECLARE V_MAX_P INTEGER;
    DECLARE V_MIN_P INTEGER;
   
   	IF VARRES = 'X' THEN
	    SELECT MAX(TOTAL) MAX_P
	    INTO V_MAX_P
	    FROM rekap_x R;
	   
	   	SELECT MIN(TOTAL) MIN_P
	    INTO V_MIN_P
	    FROM rekap_x R;
   	ELSE
	   	SELECT MAX(TOTAL) MAX_P
	    INTO V_MAX_P
	    FROM rekap_y R;
	   	
	   	SELECT MIN(TOTAL) MIN_P
	    INTO V_MIN_P
	    FROM rekap_y R;
	end if;

  
   RETURN V_MAX_P - V_MIN_P;
  
END


CREATE DEFINER=`root`@`localhost` FUNCTION `angket_gita`.`F_SIMPANGAN`(VARRES VARCHAR(2)) RETURNS double
BEGIN
	DECLARE RATA DOUBLE;
	
	IF VARRES = 'X' THEN
		SELECT SUM(FI_RATA) / SUM(JML_RES)
		INTO RATA
		FROM SIMPANGAN_AVG_X;
	ELSE 
		SELECT SUM(FI_RATA) / SUM(JML_RES)
		INTO RATA
		FROM SIMPANGAN_AVG_Y;
	END IF;
	
	RETURN RATA;
	
END


CREATE DEFINER=`root`@`localhost` PROCEDURE `angket_gita`.`PROC_DISTRIBUSI`(VARRES VARCHAR(2))
BEGIN
	
	DECLARE INTERVALUE INTEGER;
	DECLARE MAXVALUES INTEGER;
	DECLARE MINVALUES INTEGER;
	
	SELECT CEIL(F_LENGTHINTERVAL(VARRES)) 
	INTO INTERVALUE;

	IF VARRES = 'X' THEN
		SELECT MAX(TOTAL)
		INTO MAXVALUES
		FROM rekap_x;
	
		SELECT MIN(TOTAL) - 1
		INTO MINVALUES
		FROM rekap_x;
		
		TRUNCATE TABLE distribusi_x;
		
		COMMIT;
	
		loop_label:  LOOP
			INSERT INTO distribusi_x
			SELECT CONCAT(MINVALUES + 1, '-', MINVALUES + INTERVALUE)  TOTAL, COUNT(RESPONDEN) JML_RES, ROUND(AVG(TOTAL)) RATA_RATA
								, ROUND(count(RESPONDEN) * ROUND(avg(TOTAL))) AS JML_RATA_RATA
			FROM rekap_x ry 
			WHERE TOTAL BETWEEN MINVALUES + 1 AND (MINVALUES + INTERVALUE);
			
			SET MINVALUES = MINVALUES + INTERVALUE;
		
			IF (MINVALUES < MAXVALUES) THEN
				ITERATE loop_label;
			ELSE
				LEAVE  loop_label;	
			END IF;
			
		END LOOP;
	
		COMMIT;
	
	ELSEIF VARRES = 'Y' THEN
		SELECT MAX(TOTAL)
		INTO MAXVALUES
		FROM rekap_y;
	
		SELECT MIN(TOTAL) - 1
		INTO MINVALUES
		FROM rekap_y;
		
		TRUNCATE TABLE distribusi_y;
		
		COMMIT;
	
		loop_label:  LOOP
			INSERT INTO distribusi_y
			SELECT CONCAT(MINVALUES + 1, '-', MINVALUES + INTERVALUE)  TOTAL, COUNT(RESPONDEN) JML_RES, ROUND(AVG(TOTAL)) RATA_RATA
								, ROUND(count(RESPONDEN) * ROUND(avg(TOTAL))) AS JML_RATA_RATA
			FROM rekap_y ry 
			WHERE TOTAL BETWEEN MINVALUES + 1 AND (MINVALUES + INTERVALUE);
			
			SET MINVALUES = MINVALUES + INTERVALUE;
		
			IF (MINVALUES < MAXVALUES) THEN
				ITERATE loop_label;
			ELSE
				LEAVE  loop_label;	
			END IF;
			
		END LOOP;
	
		COMMIT;
	
	END IF;

	

END


CREATE DEFINER=`root`@`localhost` PROCEDURE `angket_gita`.`PROC_RANGKING`()
BEGIN
	
	TRUNCATE TABLE TMP_RANGKING_X;

	COMMIT;
	
	SET @row_number = 0;

	INSERT INTO TMP_RANGKING_X(POSISI, TOTAL, IMBUHAN, RESPONDEN) 
	SELECT (@row_number:=@row_number + 1) AS POSISI, TOTAL, F_IMBUHAN('X', TOTAL) IMBUHAN, RESPONDEN 
	FROM rekap_x
	ORDER BY TOTAL ASC;

	COMMIT;


	TRUNCATE TABLE TMP_RANGKING_Y;

	COMMIT;
	
	SET @row_number = 0;

	INSERT INTO TMP_RANGKING_Y(POSISI, TOTAL, IMBUHAN, RESPONDEN) 
	SELECT (@row_number:=@row_number + 1) AS POSISI, TOTAL, F_IMBUHAN('Y', TOTAL) IMBUHAN, RESPONDEN 
	FROM rekap_y
	ORDER BY TOTAL ASC;

	COMMIT;


	-- PROSES RANGKING

	TRUNCATE TABLE RANGKING_X;

	COMMIT;

	INSERT INTO RANGKING_X
	SELECT A.*, 
			CASE 
				WHEN IMBUHAN = 1 THEN POSISI
				ELSE B.M_POSISI + IMBUHAN
			END RANGKING
	FROM (
			SELECT POSISI, TOTAL, IMBUHAN, RESPONDEN
			FROM TMP_RANGKING_X
		 ) A,
		 (
		 	SELECT TOTAL, MIN(POSISI) M_POSISI
			FROM TMP_RANGKING_X 
			GROUP BY TOTAL
		 ) B
	WHERE A.TOTAL = B.TOTAL;

	COMMIT;

	
	TRUNCATE TABLE RANGKING_Y;

	COMMIT;

	INSERT INTO RANGKING_Y
	SELECT A.*, 
			CASE 
				WHEN IMBUHAN = 1 THEN POSISI
				ELSE B.M_POSISI + IMBUHAN
			END RANGKING
	FROM (
			SELECT POSISI, TOTAL, IMBUHAN, RESPONDEN
			FROM TMP_RANGKING_Y
		 ) A,
		 (
		 	SELECT TOTAL, MIN(POSISI) M_POSISI
			FROM TMP_RANGKING_Y
			GROUP BY TOTAL
		 ) B
	WHERE A.TOTAL = B.TOTAL;

	COMMIT;

	-- BEDA RANGKING
	TRUNCATE TABLE BEDA_RANGKING;

	COMMIT;

	INSERT INTO BEDA_RANGKING 
	SELECT X.RESPONDEN, X.TOTAL X, Y.TOTAL Y, X.RANGKING RX, Y.RANGKING RY, X.RANGKING-Y.RANGKING DI, POW(X.RANGKING-Y.RANGKING, 2) DI2
	FROM RANGKING_X X, RANGKING_Y Y
	WHERE X.RESPONDEN = Y.RESPONDEN
	ORDER BY RESPONDEN ASC;

	COMMIT;

END


CREATE DEFINER=`root`@`localhost` PROCEDURE `angket_gita`.`PROC_REFRESH`()
BEGIN
	
	CALL PROC_DISTRIBUSI('X');

	CALL PROC_DISTRIBUSI('Y');
	
	CALL PROC_RANGKING();
END
