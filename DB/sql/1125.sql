CREATE TABLE department(
  did INT,
  dname VARCHAR(45),
  PRIMARY KEY (did)
  );

CREATE TABLE users(
  user_id INT,
  uname VARCHAR(45),
  pwd VARCHAR(45),
  admin INT,
  did INT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT users_ref1
    FOREIGN KEY (did)
    REFERENCES department (did)
    );

CREATE TABLE category(
  cid INT,
  cname VARCHAR(45) UNIQUE,
  PRIMARY KEY (cid)
  );

CREATE TABLE item(
  iid INT,
  iname VARCHAR(45) UNIQUE,
  category VARCHAR(45),
  remain_count INT,
  did INT,
  PRIMARY KEY (iid),
  CONSTRAINT item_ref1
    FOREIGN KEY (did)
    REFERENCES department(did),
    
  CONSTRAINT item_ref2
    FOREIGN KEY (category)
    REFERENCES category (cname)
 );

CREATE TABLE borrow(
  bid INT,
  bname VARCHAR(45),
  did INT NULL,
  item_name VARCHAR(45),
  count INT,
  start_date VARCHAR(45),
  end_date VARCHAR(45),
  PRIMARY KEY (bid),
  
  CONSTRAINT borrow_ref1
    FOREIGN KEY (did)
    REFERENCES department (did),
    
  CONSTRAINT borrow_ref2
    FOREIGN KEY (item_name)
    REFERENCES item (iname),
   
  CONSTRAINT borrow_ref3
    FOREIGN KEY (bid)
    REFERENCES users (user_id)
    );