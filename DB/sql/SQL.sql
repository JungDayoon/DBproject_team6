CREATE TABLE department(
  did INT,  /*�а��� �ĺ���(PRIMARY KEY)*/
  dname VARCHAR(45), /*�а��� �̸�*/
  
  PRIMARY KEY (did)
  );

CREATE TABLE users(
  uuid INT,  /*������� �ĺ���(PRIMARY KEY)*/
  uname VARCHAR(45), /*������� �̸�*/
  pwd VARCHAR(45), /*������� ��й�ȣ*/
  admin INT, /*������� admin ����(1 = admin, 0 = user)*/
  did INT NULL, /*������� �а� �ĺ��� (FOREIGN KEY)*/
  
  PRIMARY KEY (uuid),
  CONSTRAINT users_ref1
    FOREIGN KEY (did)
    REFERENCES department (did)
    );

CREATE TABLE category(
  cid INT, /*ī�װ��� �ĺ���(PRIMARY KEY)*/
  cname VARCHAR(45) UNIQUE, /*ī�װ��� �̸� (UNIQUE)*/
  
  PRIMARY KEY (cid)
  );

CREATE TABLE item(
  iid INT,  /*�������� �ĺ���(PRIMARY KEY)*/
  iname VARCHAR(45), /*�������� �̸�*/
  category_cid INT not null, /*�������� ī�װ� �ĺ���(FOREIGN KEY)*/
  remain_count INT, /*�������� ���� ����*/
  did INT, /*�������� �Ҽ� �а� �ĺ���(FOREIGN KEY)*/
  
  PRIMARY KEY (iid),
  CONSTRAINT item_ref1
    FOREIGN KEY (did)
    REFERENCES department(did),
  CONSTRAINT item_ref2
    FOREIGN KEY (category_cid)
    REFERENCES category (cid)
 );

CREATE TABLE borrow(
  borrow_uuid INT, /*�� ������ ������ ��� �ĺ���(FOREIGN KEY)*/
  borrow_iid INT, /*�� ������ ������ �ĺ���*/
  count INT, /*�� ���������� ����*/
  start_date VARCHAR(45), /*�� ������ ���� ��¥*/
  end_date VARCHAR(45), /*�� ������ �ݳ� ��¥*/
  
  CONSTRAINT borrow_ref2
    FOREIGN KEY (borrow_iid)
    REFERENCES item (iid),
  CONSTRAINT borrow_ref3
    FOREIGN KEY (borrow_uuid)
    REFERENCES users (uuid),
  PRIMARY KEY (borrow_iid, borrow_uuid)
    );
    
CREATE SEQUENCE AUTO_PK_DEPARTMENT START WITH 1 INCREMENT BY 1; /*DEPARTMENT primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_CATEGORY START WITH 1 INCREMENT BY 1; /*CATEGORY primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_ITEM START WITH 1 INCREMENT BY 1; /*ITEM primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_ADMIN START WITH 1 INCREMENT BY 1; /*USER(ADMIN) primary key �ڵ� ���� ������*/
    
/*DEPARTMENT(�а�)���̺� �ʱ�ȭ*/
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '��ǻ���к�'); 
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '���ڰ��к�');
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '������а�');

/*CATEGORY(ī�װ�)���̺� �ʱ�ȭ*/
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '���������');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '�Ƶ��̳�');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '����');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '������');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '���');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '��Ÿ');

/*USERS(����)���̺� �ʱ�ȭ (����)*/
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'admin','admin', 1 , null);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'��ǻ���к�','��ǻ���к�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '��ǻ���к�')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'���ڰ��к�','���ڰ��к�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '���ڰ��к�')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'������а�','������а�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '������а�')
);

/*USERS(����)���̺� �ʱ�ȭ (�����)*/
INSERT INTO USERS VALUES(2015114398,'�̿�ȣ','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '��ǻ���к�')
);

/*ITEM(������)���̺� �ʱ�ȭ*/
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3A+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 4B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ���', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����������', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ���', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����������', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);

/*ī�װ����� ������ ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='���������';

/*�а������� ������ ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '���ڰ��к�';

/*�����۸����� �а� ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and i.iname = '��������� 3B+';


CREATE TABLE department(
  did INT,  /*�а��� �ĺ���(PRIMARY KEY)*/
  dname VARCHAR(45), /*�а��� �̸�*/
  
  PRIMARY KEY (did)
  );

CREATE TABLE users(
  uuid INT,  /*������� �ĺ���(PRIMARY KEY)*/
  uname VARCHAR(45), /*������� �̸�*/
  pwd VARCHAR(45), /*������� ��й�ȣ*/
  admin INT, /*������� admin ����(1 = admin, 0 = user)*/
  did INT NULL, /*������� �а� �ĺ��� (FOREIGN KEY)*/
  
  PRIMARY KEY (uuid),
  CONSTRAINT users_ref1
    FOREIGN KEY (did)
    REFERENCES department (did)
    );

CREATE TABLE category(
  cid INT, /*ī�װ��� �ĺ���(PRIMARY KEY)*/
  cname VARCHAR(45) UNIQUE, /*ī�װ��� �̸� (UNIQUE)*/
  
  PRIMARY KEY (cid)
  );

CREATE TABLE item(
  iid INT,  /*�������� �ĺ���(PRIMARY KEY)*/
  iname VARCHAR(45), /*�������� �̸�*/
  category_cid INT, /*�������� ī�װ� �ĺ���(FOREIGN KEY)*/
  remain_count INT, /*�������� ���� ����*/
  did INT, /*�������� �Ҽ� �а� �ĺ���(FOREIGN KEY)*/
  
  PRIMARY KEY (iid),
  CONSTRAINT item_ref1
    FOREIGN KEY (did)
    REFERENCES department(did),
  CONSTRAINT item_ref2
    FOREIGN KEY (category_cid)
    REFERENCES category (cid)
 );

CREATE TABLE borrow(
  borrow_uuid INT, /*�� ������ ������ ��� �ĺ���(FOREIGN KEY)*/
  borrow_iid INT, /*�� ������ ������ �ĺ���*/
  count INT, /*�� ���������� ����*/
  start_date VARCHAR(45), /*�� ������ ���� ��¥*/
  end_date VARCHAR(45), /*�� ������ �ݳ� ��¥*/
  
  CONSTRAINT borrow_ref2
    FOREIGN KEY (borrow_iid)
    REFERENCES item (iid),
  CONSTRAINT borrow_ref3
    FOREIGN KEY (borrow_uuid)
    REFERENCES users (uuid),
  PRIMARY KEY (borrow_iid, borrow_uuid)
    );
    
CREATE SEQUENCE AUTO_PK_DEPARTMENT START WITH 1 INCREMENT BY 1; /*DEPARTMENT primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_CATEGORY START WITH 1 INCREMENT BY 1; /*CATEGORY primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_ITEM START WITH 1 INCREMENT BY 1; /*ITEM primary key �ڵ� ���� ������*/
CREATE SEQUENCE AUTO_PK_ADMIN START WITH 1 INCREMENT BY 1; /*USER(ADMIN) primary key �ڵ� ���� ������*/
    
/*DEPARTMENT(�а�)���̺� �ʱ�ȭ*/
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '��ǻ���к�'); 
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '���ڰ��к�');
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '������а�');

/*CATEGORY(ī�װ�)���̺� �ʱ�ȭ*/
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '���������');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '�Ƶ��̳�');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '����');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '������');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '���');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '��Ÿ');

/*USERS(����)���̺� �ʱ�ȭ (����)*/
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'admin','admin', 1 , null);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'��ǻ���к�','��ǻ���к�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '��ǻ���к�')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'���ڰ��к�','���ڰ��к�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '���ڰ��к�')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'������а�','������а�', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '������а�')
);

/*USERS(����)���̺� �ʱ�ȭ (�����)*/
INSERT INTO USERS VALUES(2015114398,'�̿�ȣ','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '��ǻ���к�')
);

/*ITEM(������)���̺� �ʱ�ȭ*/
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3A+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 4B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� �� Zero', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� �� Zero W/WH', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, 'LCD 1602 ���', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ���', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����������', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� 101', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� �κ�', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ESPLORA', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����ũ��', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� �̴�', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '��ǻ���к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B+', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '��������� 3B', 
    (SELECT cid FROM category where cname = '���������'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ���', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '�Ƶ��̳� ����������', 
    (SELECT cid FROM category where cname = '�Ƶ��̳�'),
    10, 
    (SELECT did FROM department WHERE dname = '���ڰ��к�')
);

/*-------------------------------Query��--------------------------------------*/

/*ī�װ����� ������ ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='���������';

/*�а������� ������ ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '���ڰ��к�';

/*�����۸����� �а� ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and i.iname = '��������� 3B+';

/*ī�װ��� ��ǰ�� �����ϴ� �а� ���*/
SELECT d.dname
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='���������'
group by d.dname;

/*ī�װ� �� �а� ������ ������ ������ ���� ����*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '��ǻ���к�' and c.cname = '���������';

/*����� �߰�*/
INSERT INTO USERS VALUES(2015114398,'�̿�ȣ','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '��ǻ���к�')
);

/*������ ������ ����(user�� uid, item�� iid, ���� ����, ���۳�¥(YY-MM-DDŸ��), �ݳ���¥(YY-MM-DDŸ��)) // �ڵ����� item�� remain_count ����*/
INSERT INTO borrow VALUES(2015114398, 1, 10, '19-12-20', '19-12-29');

/*������ ���ȴ� �������� ����, stat_date�� end_date�� ����*/
update borrow set count = 0 where borrow_uuid = 2015114398 and borrow_iid = 2;

/*������ ���� �ݳ� �Ϸ� // �ڵ����� item�� remain_count ����*/
delete from borrow where borrow_uuid = 2015114398 and borrow_iid = 1;

/*��ǰ�� ���� ����, �̹� �����ϴ� Item�̶�� Remain_count Update, ���ο� Item�̶�� Insert*/
exec update_item('�Ƶ��̳� ����ũ��', 100, '��ǻ���к�', '�Ƶ��̳�');   
exec update_item('�׽�Ʈ�׽�Ʈ', 100, '��ǻ���к�', '�Ƶ��̳�');