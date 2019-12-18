--------------------------------------------------------
--  ������ ������ - �����-12��-19-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence AUTO_PK_ADMIN
--------------------------------------------------------

   CREATE SEQUENCE  "KDHONG"."AUTO_PK_ADMIN"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_PK_BORROW
--------------------------------------------------------

   CREATE SEQUENCE  "KDHONG"."AUTO_PK_BORROW"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_PK_CATEGORY
--------------------------------------------------------

   CREATE SEQUENCE  "KDHONG"."AUTO_PK_CATEGORY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_PK_DEPARTMENT
--------------------------------------------------------

   CREATE SEQUENCE  "KDHONG"."AUTO_PK_DEPARTMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence AUTO_PK_ITEM
--------------------------------------------------------

   CREATE SEQUENCE  "KDHONG"."AUTO_PK_ITEM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 201 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BORROW
--------------------------------------------------------

  CREATE TABLE "KDHONG"."BORROW" 
   (	"BORROW_UUID" NUMBER(*,0), 
	"BORROW_IID" NUMBER(*,0), 
	"COUNT" NUMBER(*,0), 
	"START_DATE" VARCHAR2(45 BYTE), 
	"END_DATE" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "KDHONG"."CATEGORY" 
   (	"CID" NUMBER(*,0), 
	"CNAME" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "KDHONG"."DEPARTMENT" 
   (	"DID" NUMBER(*,0), 
	"DNAME" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ITEM
--------------------------------------------------------

  CREATE TABLE "KDHONG"."ITEM" 
   (	"IID" NUMBER(*,0), 
	"INAME" VARCHAR2(45 BYTE), 
	"CATEGORY_CID" NUMBER(*,0), 
	"REMAIN_COUNT" NUMBER(*,0), 
	"DID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMO
--------------------------------------------------------

  CREATE TABLE "KDHONG"."MEMO" 
   (	"TIME" DATE, 
	"FUNC" VARCHAR2(45 BYTE), 
	"U_DNAME" VARCHAR2(45 BYTE), 
	"UNAME" VARCHAR2(45 BYTE), 
	"I_DNAME" VARCHAR2(45 BYTE), 
	"INAME" VARCHAR2(45 BYTE), 
	"COUNT" NUMBER(*,0), 
	"START_DATE" VARCHAR2(45 BYTE), 
	"END_DATE" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "KDHONG"."USERS" 
   (	"UUID" NUMBER(*,0), 
	"UNAME" VARCHAR2(45 BYTE), 
	"PWD" VARCHAR2(45 BYTE), 
	"DID" NUMBER(*,0), 
	"ADMIN" NUMBER(*,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into KDHONG.BORROW
SET DEFINE OFF;
Insert into KDHONG.BORROW (BORROW_UUID,BORROW_IID,COUNT,START_DATE,END_DATE) values (2015114398,161,1,'19-12-19','19-12-26');
Insert into KDHONG.BORROW (BORROW_UUID,BORROW_IID,COUNT,START_DATE,END_DATE) values (567,103,5,'19-12-19','19-12-26');
REM INSERTING into KDHONG.CATEGORY
SET DEFINE OFF;
Insert into KDHONG.CATEGORY (CID,CNAME) values (1,'���������');
Insert into KDHONG.CATEGORY (CID,CNAME) values (2,'�Ƶ��̳�');
Insert into KDHONG.CATEGORY (CID,CNAME) values (3,'����');
Insert into KDHONG.CATEGORY (CID,CNAME) values (4,'������');
Insert into KDHONG.CATEGORY (CID,CNAME) values (5,'���');
Insert into KDHONG.CATEGORY (CID,CNAME) values (6,'��Ÿ');
Insert into KDHONG.CATEGORY (CID,CNAME) values (7,'test');
REM INSERTING into KDHONG.DEPARTMENT
SET DEFINE OFF;
Insert into KDHONG.DEPARTMENT (DID,DNAME) values (1,'��ǻ���к�');
Insert into KDHONG.DEPARTMENT (DID,DNAME) values (2,'���ڰ��к�');
Insert into KDHONG.DEPARTMENT (DID,DNAME) values (3,'������а�');
Insert into KDHONG.DEPARTMENT (DID,DNAME) values (21,'test');
REM INSERTING into KDHONG.ITEM
SET DEFINE OFF;
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (1,'��������� 3B+',1,10,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (2,'��������� 3B',1,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (3,'��������� 3A+',1,5,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (4,'��������� 4B',1,4,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (5,'�Ƶ��̳� ���',2,4,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (6,'�Ƶ��̳� ����������',2,3,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (64,'��������� 3B',1,5,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (65,'��������� 3A+',1,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (161,'�Ƶ��̳� ����',2,3,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (67,'��������� �� Zero',1,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (21,'��������� �� Zero',1,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (23,'��������� �� Zero W/WH',1,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (25,'�Ƶ��̳� �κ�',2,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (26,'�Ƶ��̳� 101',2,4,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (27,'�Ƶ��̳� ESPLORA',2,5,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (28,'�Ƶ��̳� ����ũ��',2,6,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (29,'�Ƶ��̳� ����',2,6,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (30,'�Ƶ��̳� �̴�',2,5,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (31,'�Ƶ��̳� ����',2,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (43,'����',3,19,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (44,'õ��',3,3,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (46,'40W ��Ƽ�� ����Ŀ',4,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (47,'200W �нú� ����Ŀ',4,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (48,'����ũ',4,7,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (49,'10�� �ͼ�',4,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (50,'����9ȣ�� �ǽ���A',5,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (51,'����9ȣ�� �ǽ���B',5,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (52,'����9ȣ�� ������ �ǽ���',5,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (53,'�����հ� B-101',5,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (54,'�����հ� B-102',5,1,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (55,'������',6,15,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (56,'Ű����',6,18,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (57,'���콺',6,16,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (58,'�����',6,12,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (62,'�ð�',6,3,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (63,'��������� 3B+',1,13,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (61,'����',6,2,1);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (68,'��������� �� Zero W/WH',1,3,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (69,'LCD 1602 ���',1,2,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (70,'�Ƶ��̳� ���',2,17,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (71,'�Ƶ��̳� ����������',2,7,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (72,'�Ƶ��̳� 101',2,2,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (73,'�Ƶ��̳� �κ�',2,9,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (74,'�Ƶ��̳� ESPLORA',2,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (75,'�Ƶ��̳� ����ũ��',2,12,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (76,'�Ƶ��̳� ����',2,21,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (77,'�Ƶ��̳� �̴�',2,18,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (78,'�Ƶ��̳� ����',2,2,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (80,'å��',3,17,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (81,'����',3,35,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (82,'õ��',3,10,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (83,'ȭ��Ʈ����',3,4,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (84,'40W ��Ƽ�� ����Ŀ',4,2,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (85,'200W �нú� ����Ŀ',4,4,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (86,'����ũ',4,8,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (87,'10�� �ͼ�',4,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (88,'IT1ȣ�� �ǽ���A',5,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (89,'IT1ȣ�� �ǽ���B',5,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (90,'IT1ȣ�� �ǽ���C',5,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (91,'IT1ȣ�� 302ȣ',5,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (92,'IT1ȣ�� 804ȣ',5,1,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (93,'������',6,21,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (94,'Ű����',6,12,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (95,'���콺',6,3,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (96,'�����',6,9,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (97,'����',6,7,2);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (99,'��������� 3B+',1,7,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (100,'��������� 3B',1,4,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (101,'��������� 3A+',1,2,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (103,'��������� �� Zero',1,2,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (107,'�Ƶ��̳� ����������',2,14,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (108,'�Ƶ��̳� 101',2,4,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (109,'�Ƶ��̳� �κ�',2,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (110,'�Ƶ��̳� ESPLORA',2,2,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (111,'�Ƶ��̳� ����ũ��',2,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (112,'�Ƶ��̳� ����',2,2,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (113,'�Ƶ��̳� �̴�',2,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (116,'å��',3,11,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (117,'����',3,21,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (118,'õ��',3,11,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (120,'40W ��Ƽ�� ����Ŀ',4,4,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (121,'200W �нú� ����Ŀ',4,2,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (122,'����ũ',4,4,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (124,'����8ȣ�� �ǽ���A',5,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (125,'����8ȣ�� �ǽ���B',5,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (126,'����8ȣ�� �ǽ���C',5,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (127,'IT3ȣ�� 201ȣ',5,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (128,'IT3ȣ�� 307ȣ',5,1,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (129,'������',6,8,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (130,'Ű����',6,12,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (131,'���콺',6,17,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (132,'�����',6,7,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (133,'����',6,7,3);
Insert into KDHONG.ITEM (IID,INAME,CATEGORY_CID,REMAIN_COUNT,DID) values (134,'�ð�',6,9,3);
REM INSERTING into KDHONG.MEMO
SET DEFINE OFF;
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'����','��ǻ���к�','user','������а�','��������� �� Zero',5,'19-12-19','19-12-26');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'�ݳ�','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'�ݳ�','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'�ݳ�','��ǻ���к�','������','��ǻ���к�','��������� 3B+',12,'19-12-19','19-12-20');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','user','������а�','õ��',3,'19-12-19','19-12-26');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'�ݳ�','��ǻ���к�','user','������а�','õ��',3,'19-12-19','19-12-26');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','�̿�ȣ','������а�','�Ƶ��̳� ����',1,'19-12-19','19-12-26');
Insert into KDHONG.MEMO (TIME,FUNC,U_DNAME,UNAME,I_DNAME,INAME,COUNT,START_DATE,END_DATE) values (to_date('19/12/19','RR/MM/DD'),'��û','��ǻ���к�','user','������а�','��������� �� Zero',3,'19-12-19','19-12-26');
REM INSERTING into KDHONG.USERS
SET DEFINE OFF;
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (1,'��ǻ���к�','21232f297a57a5a743894a0e4a801fc3',1,1);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (2,'���ڰ��к�','21232f297a57a5a743894a0e4a801fc3',2,1);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (3,'������а�','21232f297a57a5a743894a0e4a801fc3',3,1);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (2017111620,'������','65cc2c8205a05d7379fa3a6386f710e1',1,0);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (2015114398,'�̿�ȣ','098f6bcd4621d373cade4e832627b4f6',1,0);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (567,'user','47bce5c74f589f4867dbd57e9ca9f808',1,0);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (123,'test','098f6bcd4621d373cade4e832627b4f6',1,0);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (950911,'������','1c824be2be6ac655657c6bc78527dfd7',1,1);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (234,'admin','202cb962ac59075b964b07152d234b70',1,1);
Insert into KDHONG.USERS (UUID,UNAME,PWD,DID,ADMIN) values (0,'admin','21232f297a57a5a743894a0e4a801fc3',1,1);
--------------------------------------------------------
--  DDL for Index SYS_C006987
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006987" ON "KDHONG"."DEPARTMENT" ("DID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006988
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006988" ON "KDHONG"."USERS" ("UUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006990
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006990" ON "KDHONG"."CATEGORY" ("CID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006991
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006991" ON "KDHONG"."CATEGORY" ("CNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006992
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006992" ON "KDHONG"."ITEM" ("IID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C006995
--------------------------------------------------------

  CREATE UNIQUE INDEX "KDHONG"."SYS_C006995" ON "KDHONG"."BORROW" ("BORROW_IID", "BORROW_UUID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger BORROW_LOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KDHONG"."BORROW_LOG" 
after insert or delete or update of count on borrow
for each row
declare
    v_u_dname varchar2(45);
    v_uname   varchar2(45);
    v_i_dname   varchar2(45);
    v_iname varchar2(45);
    v_count   int;
    v_start_date  varchar2(45);
    v_end_date    varchar2(45);
begin
    if inserting then
        select dname into v_u_dname from department where did = (select did from users where uuid = :new.borrow_uuid);
        select uname into v_uname from users where uuid = :new.borrow_uuid;
        select dname into v_i_dname from department where did = (select did from item where iid = :new.borrow_iid);
        select iname into v_iname from item where iid = :new.borrow_iid;
        v_count := :new.count;
        v_start_date := :new.start_date;
        v_end_date := :new.end_date;

        insert into memo values(sysdate,'��û',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    elsif updating then
        select dname into v_u_dname from department where did = (select did from users where uuid = :new.borrow_uuid);
        select uname into v_uname from users where uuid = :new.borrow_uuid;
        select dname into v_i_dname from department where did = (select did from item where iid = :new.borrow_iid);
        select iname into v_iname from item where iid = :new.borrow_iid;
        v_count := :new.count;
        v_start_date := :new.start_date;
        v_end_date := :new.end_date;

        insert into memo values(sysdate,'����',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    else
        select dname into v_u_dname from department where did = (select did from users where uuid = :old.borrow_uuid);
        select uname into v_uname from users where uuid = :old.borrow_uuid;
        select dname into v_i_dname from department where did = (select did from item where iid = :old.borrow_iid);
        select iname into v_iname from item where iid = :old.borrow_iid;
        v_count := :old.count;
        v_start_date := :old.start_date;
        v_end_date := :old.end_date;

        insert into memo values(sysdate,'�ݳ�',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    end if;
end;
/
ALTER TRIGGER "KDHONG"."BORROW_LOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ITEM_BORROW
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KDHONG"."ITEM_BORROW" 
before insert or delete or update of count ON borrow
for each row
DECLARE
    v_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF :new.count > v_count THEN
            raise_application_error(-20001,'���� ����');
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count where IID = :new.BORROW_IID;
        END IF;
    ELSIF DELETING THEN
        SELECT REMAIN_COUNT into v_count FROM ITEM where :old.BORROW_IID = IID;
        update ITEM set REMAIN_COUNT = REMAIN_COUNT + :old.count where IID = :old.BORROW_IID;
    ELSE
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF  :new.count > v_count + :old.count THEN
            raise_application_error(-20001,'���� ����');
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count + :old.count where IID = :new.BORROW_IID;
        END IF;
    END IF;
END;

/
ALTER TRIGGER "KDHONG"."ITEM_BORROW" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_BORROW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "KDHONG"."ADD_BORROW" (p_uuid IN int, p_iid IN int, p_count IN int)
IS
    CURSOR c_cursor IS select borrow_uuid, borrow_iid from borrow where borrow_uuid = p_uuid and borrow_iid = p_iid;
    v_uuid  borrow.borrow_uuid%type;
    v_iid   borrow.borrow_iid%type;
BEGIN
    OPEN c_cursor;
    FETCH c_cursor INTO v_uuid, v_iid;
    IF(c_cursor%FOUND)THEN
        update borrow set count = count + p_count where borrow_uuid = p_uuid and borrow_iid = p_iid;
    ELSE
        insert into borrow  values(p_uuid, p_iid, p_count, to_char(sysdate,'YY-MM-DD'), to_char(sysdate+7,'YY-MM-DD'));
    END IF;
    CLOSE c_cursor;
END;

/
--------------------------------------------------------
--  DDL for Procedure ADD_ITEM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "KDHONG"."ADD_ITEM" (item_name IN varchar2,item_count IN INT, item_dept IN varchar2, item_category IN varchar2)
IS
    v_iid INT;
BEGIN
    BEGIN
        SELECT i.iid into v_iid from ITEM i, DEPARTMENT d where i.did = d.did and d.dname = item_dept and i.iname = item_name;
        UPDATE ITEM set remain_count = remain_count + item_count where iid = v_iid;
        DBMS_OUTPUT.PUT_LINE('UPDATE �Ϸ�');

        EXCEPTION
            WHEN NO_DATA_FOUND THEN v_iid := 0;
    END;

    IF v_iid = 0 THEN
        INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, item_name, 
            (SELECT cid FROM category where cname = item_category),
            item_count, 
            (SELECT did FROM department WHERE dname = item_dept)
            );
        DBMS_OUTPUT.PUT_LINE('INSERT �Ϸ�');
    END IF;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_ITEM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "KDHONG"."UPDATE_ITEM" (item_iid IN INT,item_count IN INT)
IS
    v_remain INT;
    v_count INT;
BEGIN
    IF item_count < 0 THEN
        raise_application_error(-20001,'���� ����');
    ELSIF item_count = 0 THEN
        SELECT count(*) into v_count from borrow where borrow_iid = item_iid;
        IF v_count = 0 THEN
            delete from item where iid = item_iid;
        ELSE
            UPDATE ITEM set remain_count = item_count where iid = item_iid;
        END IF;
    ELSE
        UPDATE ITEM set remain_count = item_count where iid = item_iid;
    END IF;
END;

/
--------------------------------------------------------
--  DDL for Function FUNC_MD5_ENCRYPTION
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "KDHONG"."FUNC_MD5_ENCRYPTION" (V_INPUT_STRING IN VARCHAR2) 
RETURN VARCHAR2
IS
ENCRYPTED_STRING    VARCHAR2(128);

        BEGIN
        IF V_INPUT_STRING IS NOT NULL THEN
                ENCRYPTED_STRING := LOWER(RAWTOHEX(UTL_RAW.CAST_TO_RAW(DBMS_OBFUSCATION_TOOLKIT.MD5(input_string=>V_INPUT_STRING)))); 
        END IF;



        RETURN ENCRYPTED_STRING;
 END FUNC_MD5_ENCRYPTION;

/
--------------------------------------------------------
--  DDL for Function TIME_LIMIT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "KDHONG"."TIME_LIMIT" (uid int)
return int
is 
    cnt int;
begin
    select count(*) into cnt
    from borrow
    where (borrow_uuid = uid and end_date < SYSDATE);
    return cnt;
end;

--



/
--------------------------------------------------------
--  DDL for Function USERS_BORROW_COUNT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "KDHONG"."USERS_BORROW_COUNT" (uid int)
return int
is
    cnt int;   
begin
    select count(*) into cnt 
    from borrow 
    where (borrow_uuid = uid);
    return cnt;
end;

/
--------------------------------------------------------
--  Constraints for Table BORROW
--------------------------------------------------------

  ALTER TABLE "KDHONG"."BORROW" ADD PRIMARY KEY ("BORROW_IID", "BORROW_UUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "KDHONG"."CATEGORY" ADD UNIQUE ("CNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KDHONG"."CATEGORY" ADD PRIMARY KEY ("CID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "KDHONG"."DEPARTMENT" ADD PRIMARY KEY ("DID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ITEM
--------------------------------------------------------

  ALTER TABLE "KDHONG"."ITEM" MODIFY ("CATEGORY_CID" NOT NULL ENABLE);
  ALTER TABLE "KDHONG"."ITEM" ADD PRIMARY KEY ("IID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "KDHONG"."USERS" ADD PRIMARY KEY ("UUID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BORROW
--------------------------------------------------------

  ALTER TABLE "KDHONG"."BORROW" ADD CONSTRAINT "BORROW_REF2" FOREIGN KEY ("BORROW_IID")
	  REFERENCES "KDHONG"."ITEM" ("IID") ENABLE;
  ALTER TABLE "KDHONG"."BORROW" ADD CONSTRAINT "BORROW_REF3" FOREIGN KEY ("BORROW_UUID")
	  REFERENCES "KDHONG"."USERS" ("UUID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ITEM
--------------------------------------------------------

  ALTER TABLE "KDHONG"."ITEM" ADD CONSTRAINT "ITEM_REF1" FOREIGN KEY ("DID")
	  REFERENCES "KDHONG"."DEPARTMENT" ("DID") ENABLE;
  ALTER TABLE "KDHONG"."ITEM" ADD CONSTRAINT "ITEM_REF2" FOREIGN KEY ("CATEGORY_CID")
	  REFERENCES "KDHONG"."CATEGORY" ("CID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "KDHONG"."USERS" ADD CONSTRAINT "USERS_REF1" FOREIGN KEY ("DID")
	  REFERENCES "KDHONG"."DEPARTMENT" ("DID") ENABLE;
