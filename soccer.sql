




SELECT * FROM TAB;
DROP VIEW TEAM;
DESC TEAM
CREATE VIEW TE AS
    SELECT TEAM_ID TID,
    REGION_NAME RNAME,
    TEAM_NAME TNAME,
    E_TEAM_NAME ETNAME,
    ORIG_YYYY OYYY,
    STADIUM_ID SID,
    ZIP_CODE1 ZCODE1,
    ZIP_CODE2 ZCODE2,
    ADDRESS ADDRESS,
    DDD DDD,
    TEL TEL,
    FAX FAX,
    HOMEPAGE HPAGE,
    OWNER OWNER
FROM TEAM;

DROP VIEW PL;
DESC PLAYER
CREATE VIEW PL AS    
    SELECT WEIGHT WEIGHT,
    SOLAR SOLAR,
    POSITION POSITION,
    PLAYER_NAME PNAME,
    PLAYER_ID PID,
    NICKNAME NNAME,
    NATION NATION,
    JOIN_YYYY JYYYY,
    HEIGHT HEIGHT,
    E_PLAYER_NAME EPNAME,
    BIRTH_DATE BDATE,
    BACK_NO BNO,
    TEAM_ID TID
FROM PLAYER;

DESC STADIUM
CREATE VIEW ST AS
    SELECT STADIUM_NAME SNAME,
    STADIUM_ID SID,
    SEAT_COUNT SCOUNT,
    HOMETEAM_ID HID,
    DDD DDD,
    ADDRESS ADDRESS
FROM STADIUM;

DESC SCHEDULE
CREATE VIEW SC AS
    SELECT STADIUM_ID SID,
    SCHE_DATE SDATE,
    HOMETEAM_ID HID,
    HOME_SCORE HSCORE,
    GUBUN GUBUN,
    AWAYTEAM_ID AID,
    AWAY_SCORE ASCORE
FROM SCHEDULE;   



-- SQL_TEST_001
-- ��ü �౸�� ���. �̸� ��������
SELECT T.TNAME "��ü �౸�� ���"
FROM TE T
ORDER BY T.TNAME ASC;

-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����)
SELECT DISTINCT POSITION ������
FROM PL P;


-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()���
SELECT DISTINCT NVL2(P.POSITION, P.POSITION, '����')
FROM PL P;

SELECT * FROM PLAYER;
SELECT * FROM TEAM;
SELECT * FROM STADIUM;
SELECT * FROM SCHEDULE;

-- SQL_TEST_004
-- ������(ID: K02)��Ű��
SELECT P.PNAME �̸�
FROM PL P
WHERE P.TID LIKE 'K02' AND P.POSITION LIKE 'GK'
ORDER BY P.PNAME;

-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����
SELECT P.POSITION ������, P.PNAME �̸�
FROM PL P
WHERE P.TID LIKE 'K02' AND P.HEIGHT >= 170 AND P.PNAME LIKE '��%';

-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������
SELECT CONCAT(P.PNAME,'����')�̸�,
    TO_CHAR(NVL2(P.HEIGHT,P.HEIGHT,0)||'cm')Ű,
    TO_CHAR(NVL2(P.WEIGHT,P.HEIGHT,0)||'kg')������ 
FROM PL P
WHERE P.TID LIKE 'K02'
ORDER BY P.HEIGHT DESC;

-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������
SELECT * FROM PLAYER;
SELECT CONCAT(PNAME,'����')�̸�,
    TO_CHAR(NVL2(HEIGHT,HEIGHT,0)||'cm')Ű,
    TO_CHAR(NVL2(WEIGHT,WEIGHT,0)||'kg')������,
    ROUND(WEIGHT/(HEIGHT*HEIGHT)*10000,2) "BIM ����"
FROM (SELECT PNAME, HEIGHT, WEIGHT
      FROM PL P
      WHERE P.TID LIKE 'K02') 
ORDER BY HEIGHT DESC;

-- SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ �� 
--  �������� GK ��  ����
-- ����, ����� ��������
SELECT T.TNAME, P.POSITION, P.PNAME
FROM PL P
    JOIN TE T
ON P.TID LIKE T.TID
WHERE P.TID IN ('K02', 'K10') AND P.POSITION LIKE 'GK'
ORDER BY T.TNAME, P.PNAME ASC;

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������
SELECT P.HEIGHT, T.TNAME, P.PNAME
FROM PL P
    JOIN TE T
ON P.TID LIKE T.TID
WHERE P.TID IN('K02','K10') AND P.HEIGHT BETWEEN 180 AND 183
ORDER BY P.HEIGHT, T.TNAME, P.PNAME;

SELECT * FROM PLAYER;
-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������
SELECT T.TEAM_NAME ����, P.PLAYER_NAME �̸�
FROM (SELECT P.TEAM_ID,P.PLAYER_NAME 
        FROM PLAYER P WHERE P.POSITION IS NULL) P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
ORDER BY T.TEAM_NAME, P.PLAYER_NAME;

--------------------------------------------------------
SELECT * FROM PLAYER;
SELECT * FROM TEAM;
--------------------------------------------------------

SELECT T.TNAME ����, P.PNAME �̸�
FROM PL P
    JOIN TE T
    ON P.TID LIKE T.TID
WHERE P.POSITION IS NULL
ORDER BY T.TNAME, P.PNAME;

-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���

SELECT T.TEAM_NAME ����, S.STADIUM_NAME
FROM TEAM T
    JOIN STADIUM S
    ON T.STADIUM_ID LIKE S.STADIUM_ID
ORDER BY T.TEAM_NAME;

-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�

SELECT TE.TNAME ����, ST.SNAME ��Ÿ���, SC.AID ������ID, SC.SDATE �����ٳ�¥ 
FROM ST
    JOIN TE
    ON ST.SID LIKE TE.SID
    JOIN SC
    ON  ST.SID LIKE SC.SID
WHERE SC.SDATE LIKE '20120317'
ORDER BY TE.TNAME;
-------------------------------------------------------------------------------
SELECT TE.TNAME ����, ST.SNAME ��Ÿ���, SC.AID ������ID, SC.SDATE �����ٳ�¥ 
FROM ST
    JOIN TE
    ON ST.SID LIKE TE.SID
    JOIN SC
    ON  ST.SID LIKE SC.SID
WHERE SC.SDATE LIKE '20120317'
ORDER BY TE.TNAME;


-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�

SELECT PL.PNAME ������, PL.POSITION ������, CONCAT('���� ',TE.TNAME)����, ST.SNAME ��Ÿ���,  SC.SDATE �����ٳ�¥
FROM ST
    JOIN TE
    ON ST.SID LIKE TE.SID
    JOIN SC
    ON ST.SID LIKE SC.SID
    JOIN PL
    ON TE.TID LIKE PL.TID
WHERE SC.SDATE LIKE '20120317' AND TE.TID LIKE 'K03' AND PL.POSITION LIKE 'GK'
ORDER BY PL.PNAME;
-------------------------------------------------------------------------------
SELECT * FROM TEAM;
SELECT PL.PLAYER_NAME ������,
       PL.POSITION ������,
       CONCAT('���� ',T.TEAM_NAME)����,
       ST.SNAME ��Ÿ���,
        SC.SCHE_DATE �����ٳ�¥
FROM ST
    JOIN (SELECT T.TEAM_NAME, T.TEAM_ID, T.STADIUM_ID
          FROM TEAM T
          WHERE T.TEAM_ID LIKE 'K03')T
    ON ST.SID LIKE T.STADIUM_ID
    JOIN (SELECT SC.STADIUM_ID, SC.SCHE_DATE
          FROM SCHEDULE SC
          WHERE SC.SCHE_DATE LIKE '20120317')SC
    ON ST.SID LIKE SC.STADIUM_ID
    JOIN (SELECT PL.POSITION, PL.TEAM_ID, PL.PLAYER_NAME
          FROM PLAYER PL
          WHERE PL.POSITION LIKE 'GK')PL
    ON T.TEAM_ID LIKE PL.TEAM_ID
ORDER BY PL.PLAYER_NAME;

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�
SELECT * FROM TEAM;
SELECT * FROM STADIUM;
SELECT * FROM SCHEDULE;
SELECT * FROM PLAYER;
SELECT ST.STADIUM_NAME ��Ÿ���,
       SC.SDATE ��⳯¥,
       TEA.REGION_NAME||' '||TEA.TEAM_NAME Ȩ��,
       TEB.REGION_NAME||' '||TEB.TEAM_NAME ������,
       SC.HSCORE "Ȩ�� ����",
       SC.ASCORE "������ ����"
FROM SC
    JOIN (SELECT ST.STADIUM_NAME,
                 ST.STADIUM_ID
          FROM STADIUM ST)ST
    ON SC.SID LIKE ST.STADIUM_ID
    JOIN (SELECT TEA.REGION_NAME,
                 TEA.STADIUM_ID,
                 TEA.TEAM_NAME
          FROM TEAM TEA) TEA
    ON SC.SID LIKE TEA.STADIUM_ID
    JOIN (SELECT TEB.REGION_NAME,
                 TEB.STADIUM_ID,
                 TEB.TEAM_NAME
          FROM TEAM TEB)TEB
    ON SC.SID LIKE TEB.STADIUM_ID
WHERE SC.HSCORE>=SC.ASCORE +3
ORDER BY SC.HSCORE DESC;


-------------------------------------------------------------------------------


-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20 

SELECT S.SNAME, S.SID, S.SCOUNT, S.HID, T.ETNAME
FROM ST S
    JOIN TE T
    ON S.SID LIKE T.SID
ORDER BY S.HID;

-- SOCCER_SQL_016
-- ���Ű�� ��õ ������Ƽ������ ���Ű ���� ���� ���� 
-- ��ID, ����, ���Ű ����
SELECT * FROM TEAM;
SELECT * FROM STADIUM;
SELECT * FROM SCHEDULE;
SELECT * FROM PLAYER;

SELECT TE.TEAM_ID ,
       TE.TEAM_NAME,
       ROUND(AVG(PL.HEIGHT),2)���Ű
    FROM TEAM TE
        JOIN PLAYER PL
        ON TE.TEAM_ID LIKE PL.TEAM_ID
GROUP BY TE.TEAM_ID, TE.TEAM_NAME
HAVING AVG(PL.HEIGHT) < (SELECT AVG(PL.HEIGHT)
                         FROM TEAM TE
                            JOIN PLAYER PL
                            ON TE.TEAM_ID LIKE PL.TEAM_ID
                         WHERE TE.TEAM_NAME LIKE '������Ƽ��')
ORDER BY ���Ű;
        
   
-- SOCCER_SQL_017
-- �������� MF �� ��������  �Ҽ����� �� ������, ��ѹ� ���
SELECT TE.TEAM_NAME ����, PL.PLAYER_NAME ������, PL.BACK_NO ��ѹ�
FROM PLAYER PL
    JOIN TEAM TE
    ON PL.TEAM_ID LIKE TE.TEAM_ID
WHERE PL.POSITION LIKE 'MF'
ORDER BY PL.PLAYER_NAME;

-- SOCCER_SQL_018
-- ���� Űū ���� 5 ����, ����Ŭ, �� Ű ���� ������ ����
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
SELECT * FROM SCHEDULE;
SELECT * FROM PLAYER;

SELECT PL.PLAYER_NAME ������,
       PL.BACK_NO ��ѹ�,
       PL.POSITION ������,
       PL.HEIGHT Ű
    FROM (SELECT PL.HEIGHT,
                 PL.PLAYER_NAME,
                 PL.BACK_NO,
                 PL.POSITION
            FROM PLAYER PL
          WHERE PL.HEIGHT IS NOT NULL
          ORDER BY PL.HEIGHT DESC)PL
WHERE ROWNUM BETWEEN 1 AND 5;

-- SOCCER_SQL_019
-- ���� �ڽ��� ���� ���� ���Ű���� ���� ���� ���� ���


SELECT TE.TEAM_NAME ����,
       PL.PLAYER_NAME ������,
       PL.POSITION ������,
       PL.BACK_NO ��ѹ�,
       PL.HEIGHT Ű
    FROM PLAYER PL
        JOIN TEAM TE
    ON PL.TEAM_ID LIKE TE.TEAM_ID
WHERE PL.HEIGHT < (SELECT AVG(PL2.HEIGHT)
                   FROM PLAYER PL2
                   WHERE PL2.TEAM_ID LIKE PL.TEAM_ID)
ORDER BY PL.PLAYER_NAME;

-- SOCCER_SQL_020
-- 2012�� 5�� �Ѵް� ��Ⱑ �ִ� ����� ��ȸ
-- EXISTS ������ �׻� ���������� ����Ѵ�.
-- ���� �ƹ��� ������ �����ϴ� ���� ���� ���̶�
-- ������ �����ϴ� 1�Ǹ� ã���� �߰����� �˻��� �������� �ʴ´�.


SELECT STADIUM_ID, STADIUM_NAME
FROM STADIUM ST
WHERE EXISTS(SELECT 1
            FROM SCHEDULE SC
            WHERE SC.STADIUM_ID LIKE ST.STADIUM_ID)
;

-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���


SELECT PL.PLAYER_NAME ������, PL.POSITION ������ , PL.BACK_NO ��ѹ�
FROM PLAYER PL
    JOIN TEAM TE
    ON PL.TEAM_ID LIKE TE.TEAM_ID
WHERE TE.TEAM_ID LIKE 'K04'
ORDER BY PL.PLAYER_NAME ASC;

-- SOCCER_SQL_022
-- NULL ó���� �־�
-- SUM(NVL(SAL,0)) �� ��������
-- NVL(SUM(SAL),0) ���� �ؾ� �ڿ����� �پ���
 
-- ���� �����Ǻ� �ο����� ���� ��ü �ο��� ���
 
-- Oracle, Simple Case Expr
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
SELECT * FROM SCHEDULE;
SELECT * FROM PLAYER;

SELECT TEAM_ID,
    NVL(SUM(CASE POSITION WHEN 'FW' THEN 1 END),0)FW,
    NVL(SUM(CASE POSITION WHEN 'MF' THEN 1 END),0)MF,
    NVL(SUM(CASE POSITION WHEN 'DF' THEN 1 END),0)DF,
    NVL(SUM(CASE POSITION WHEN 'GK' THEN 1 END),0)GK,
COUNT(*) SUM
FROM PLAYER PL
GROUP BY TEAM_ID
;


    





