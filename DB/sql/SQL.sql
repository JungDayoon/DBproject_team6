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

/*-------------------------------Query문--------------------------------------*/

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

/*카테고리에 물품이 존재하는 학과 출력*/
SELECT d.dname
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and c.cname='라즈베리파이'
group by d.dname;

/*카테고리 및 학과 마다의 아이템 종류와 남은 개수*/
SELECT d.dname, c.cname, i.iname , i.remain_count
FROM DEPARTMENT d, CATEGORY c, ITEM i
where c.cid = i.category_cid and i.did = d.did and d.dname = '컴퓨터학부' and c.cname = '라즈베리파이';

/*사용자 추가*/
INSERT INTO USERS VALUES(2015114398,'이용호','test', 0 , 
    (SELECT did 
    FROM DEPARTMENT
    WHERE dname = '컴퓨터학부')
);

/*유저가 물건을 빌림(user의 uid, item의 iid, 빌릴 개수, 시작날짜(YY-MM-DD타입), 반납날짜(YY-MM-DD타입)) // 자동으로 item의 remain_count 수정*/
INSERT INTO borrow VALUES(2015114398, 1, 10, '19-12-20', '19-12-29');

/*유저가 빌렸던 물건을더 빌림, stat_date와 end_date는 고정*/
update borrow set count = 0 where borrow_uuid = 2015114398 and borrow_iid = 2;

/*유저의 물건 반납 완료 // 자동으로 item의 remain_count 수정*/
delete from borrow where borrow_uuid = 2015114398 and borrow_iid = 1;

/*물품의 수량 수정, 이미 존재하는 Item이라면 Remain_count Update, 새로운 Item이라면 Insert*/
exec update_item('아두이노 마이크로', 100, '컴퓨터학부', '아두이노');   
exec update_item('테스트테스트', 100, '컴퓨터학부', '아두이노');