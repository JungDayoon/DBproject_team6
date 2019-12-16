CREATE TABLE department(
  did INT,  /*학과의 식별자(PRIMARY KEY)*/
  dname VARCHAR(45), /*학과의 이름*/
  
  PRIMARY KEY (did)
  );

CREATE TABLE users(
  uuid INT,  /*사용자의 식별자(PRIMARY KEY)*/
  uname VARCHAR(45), /*사용자의 이름*/
  pwd VARCHAR(45), /*사용자의 비밀번호*/
  admin INT, /*사용자의 admin 유뮤(1 = admin, 0 = user)*/
  did INT NULL, /*사용자의 학과 식별자 (FOREIGN KEY)*/
  
  PRIMARY KEY (uuid),
  CONSTRAINT users_ref1
    FOREIGN KEY (did)
    REFERENCES department (did)
    );

CREATE TABLE category(
  cid INT, /*카테고리의 식별자(PRIMARY KEY)*/
  cname VARCHAR(45) UNIQUE, /*카테고리의 이름 (UNIQUE)*/
  
  PRIMARY KEY (cid)
  );

CREATE TABLE item(
  iid INT,  /*아이템의 식별자(PRIMARY KEY)*/
  iname VARCHAR(45), /*아이템의 이름*/
  category_cid INT not null, /*아이템의 카테고리 식별자(FOREIGN KEY)*/
  remain_count INT, /*아이템의 남은 수량*/
  did INT, /*아이템의 소속 학과 식별자(FOREIGN KEY)*/
  
  PRIMARY KEY (iid),
  CONSTRAINT item_ref1
    FOREIGN KEY (did)
    REFERENCES department(did),
  CONSTRAINT item_ref2
    FOREIGN KEY (category_cid)
    REFERENCES category (cid)
 );

CREATE TABLE borrow(
  borrow_uuid INT, /*각 공유의 빌려간 사람 식별자(FOREIGN KEY)*/
  borrow_iid INT, /*각 공유의 아이템 식별자*/
  count INT, /*각 공유물건의 개수*/
  start_date VARCHAR(45), /*각 공유의 시작 날짜*/
  end_date VARCHAR(45), /*각 공유의 반납 날짜*/
  
  CONSTRAINT borrow_ref2
    FOREIGN KEY (borrow_iid)
    REFERENCES item (iid),
  CONSTRAINT borrow_ref3
    FOREIGN KEY (borrow_uuid)
    REFERENCES users (uuid),
  PRIMARY KEY (borrow_iid, borrow_uuid)
    );
    
CREATE SEQUENCE AUTO_PK_DEPARTMENT START WITH 1 INCREMENT BY 1; /*DEPARTMENT primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_CATEGORY START WITH 1 INCREMENT BY 1; /*CATEGORY primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_ITEM START WITH 1 INCREMENT BY 1; /*ITEM primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_ADMIN START WITH 1 INCREMENT BY 1; /*USER(ADMIN) primary key 자동 증가 시퀸스*/
    
/*DEPARTMENT(학과)테이블 초기화*/
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '컴퓨터학부'); 
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '전자공학부');
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '전기공학과');

/*CATEGORY(카테고리)테이블 초기화*/
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '라즈베리파이');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '아두이노');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '가구');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '음향기기');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '장소');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '기타');

/*USERS(유저)테이블 초기화 (어드민)*/
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'admin','admin', 1 , null);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'컴퓨터학부','컴퓨터학부', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'전자공학부','전자공학부', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '전자공학부')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'전기공학과','전기공학과', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '전기공학과')
);

/*USERS(유저)테이블 초기화 (사용자)*/
INSERT INTO USERS VALUES(2015114398,'이용호','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);

/*ITEM(아이템)테이블 초기화*/
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3A+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 4B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 우노', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 레오나르도', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 우노', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 레오나르도', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);

/*카테고리마다 아이템 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='라즈베리파이';

/*학과마다의 아이템 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '전자공학부';

/*아이템마다의 학과 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and i.iname = '라즈베리파이 3B+';


CREATE TABLE department(
  did INT,  /*학과의 식별자(PRIMARY KEY)*/
  dname VARCHAR(45), /*학과의 이름*/
  
  PRIMARY KEY (did)
  );

CREATE TABLE users(
  uuid INT,  /*사용자의 식별자(PRIMARY KEY)*/
  uname VARCHAR(45), /*사용자의 이름*/
  pwd VARCHAR(45), /*사용자의 비밀번호*/
  admin INT, /*사용자의 admin 유뮤(1 = admin, 0 = user)*/
  did INT NULL, /*사용자의 학과 식별자 (FOREIGN KEY)*/
  
  PRIMARY KEY (uuid),
  CONSTRAINT users_ref1
    FOREIGN KEY (did)
    REFERENCES department (did)
    );

CREATE TABLE category(
  cid INT, /*카테고리의 식별자(PRIMARY KEY)*/
  cname VARCHAR(45) UNIQUE, /*카테고리의 이름 (UNIQUE)*/
  
  PRIMARY KEY (cid)
  );

CREATE TABLE item(
  iid INT,  /*아이템의 식별자(PRIMARY KEY)*/
  iname VARCHAR(45), /*아이템의 이름*/
  category_cid INT, /*아이템의 카테고리 식별자(FOREIGN KEY)*/
  remain_count INT, /*아이템의 남은 수량*/
  did INT, /*아이템의 소속 학과 식별자(FOREIGN KEY)*/
  
  PRIMARY KEY (iid),
  CONSTRAINT item_ref1
    FOREIGN KEY (did)
    REFERENCES department(did),
  CONSTRAINT item_ref2
    FOREIGN KEY (category_cid)
    REFERENCES category (cid)
 );

CREATE TABLE borrow(
  borrow_uuid INT, /*각 공유의 빌려간 사람 식별자(FOREIGN KEY)*/
  borrow_iid INT, /*각 공유의 아이템 식별자*/
  count INT, /*각 공유물건의 개수*/
  start_date VARCHAR(45), /*각 공유의 시작 날짜*/
  end_date VARCHAR(45), /*각 공유의 반납 날짜*/
  
  CONSTRAINT borrow_ref2
    FOREIGN KEY (borrow_iid)
    REFERENCES item (iid),
  CONSTRAINT borrow_ref3
    FOREIGN KEY (borrow_uuid)
    REFERENCES users (uuid),
  PRIMARY KEY (borrow_iid, borrow_uuid)
    );
    
CREATE SEQUENCE AUTO_PK_DEPARTMENT START WITH 1 INCREMENT BY 1; /*DEPARTMENT primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_CATEGORY START WITH 1 INCREMENT BY 1; /*CATEGORY primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_ITEM START WITH 1 INCREMENT BY 1; /*ITEM primary key 자동 증가 시퀸스*/
CREATE SEQUENCE AUTO_PK_ADMIN START WITH 1 INCREMENT BY 1; /*USER(ADMIN) primary key 자동 증가 시퀸스*/
    
/*DEPARTMENT(학과)테이블 초기화*/
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '컴퓨터학부'); 
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '전자공학부');
INSERT INTO DEPARTMENT VALUES(AUTO_PK_DEPARTMENT.NEXTVAL, '전기공학과');

/*CATEGORY(카테고리)테이블 초기화*/
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '라즈베리파이');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '아두이노');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '가구');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '음향기기');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '장소');
INSERT INTO CATEGORY VALUES(AUTO_PK_CATEGORY.NEXTVAL, '기타');

/*USERS(유저)테이블 초기화 (어드민)*/
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'admin','admin', 1 , null);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'컴퓨터학부','컴퓨터학부', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'전자공학부','전자공학부', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '전자공학부')
);
INSERT INTO USERS VALUES(AUTO_PK_ADMIN.NEXTVAL,'전기공학과','전기공학과', 1 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '전기공학과')
);

/*USERS(유저)테이블 초기화 (사용자)*/
INSERT INTO USERS VALUES(2015114398,'이용호','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);

/*ITEM(아이템)테이블 초기화*/
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3A+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 4B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 모델 Zero', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 모델 Zero W/WH', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, 'LCD 1602 모듈', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 우노', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 레오나르도', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 101', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 로봇', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 ESPLORA', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 마이크로', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 나노', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 미니', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 제로', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '컴퓨터학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B+', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '라즈베리파이 3B', 
    (SELECT cid FROM category where cname = '라즈베리파이'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 우노', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);
INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, '아두이노 레오나르도', 
    (SELECT cid FROM category where cname = '아두이노'),
    10, 
    (SELECT did FROM department WHERE dname = '전자공학부')
);


/*Borrow Table에서 count에 대해 수정사항이 있을때 마다 */
/
create or replace trigger item_borrow
before insert or delete or update of count ON borrow
for each row
DECLARE
    v_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('트리거 시작~~');
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('INSERT 처리 시작');
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF :new.count > v_count THEN
            raise_application_error(-20001,'범위 에러');
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count where IID = :new.BORROW_IID;
            DBMS_OUTPUT.PUT_LINE('INSERT 정상 처리');
        END IF;
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('DELETE 처리 시작');
        SELECT REMAIN_COUNT into v_count FROM ITEM where :old.BORROW_IID = IID;
        update ITEM set REMAIN_COUNT = REMAIN_COUNT + :old.count where IID = :old.BORROW_IID;
        DBMS_OUTPUT.PUT_LINE('DELETE 정상 처리');
    ELSE
        DBMS_OUTPUT.PUT_LINE('UPDATE 처리 시작');
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF  :new.count > v_count + :old.count THEN
            raise_application_error(-20001,'범위 에러');
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count + :old.count where IID = :new.BORROW_IID;
            DBMS_OUTPUT.PUT_LINE('INSERT 정상 처리');
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('트리거 종료~~');
END;
/

insert into borrow values(2015114398, 2, 5, '19-12-16', '19-12-19');

update borrow set count = 0 where borrow_iid=2;

delete from borrow where borrow_iid = 2;

/*---------------------------------------------------------------------*/

/*카테고리마다 아이템 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='라즈베리파이';

/*학과마다의 아이템 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '전자공학부';

/*아이템마다의 학과 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and i.iname = '라즈베리파이 3B+';

/*사용자 추가*/
/*USERS(유저)테이블 초기화 (사용자)*/
INSERT INTO USERS VALUES(2015114398,'이용호','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);
