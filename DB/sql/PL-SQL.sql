/*user가 물품을 빌리거나 반납했을때 item 의 remain_count를 감소, 증가, 범위에 맞지않는 개수일때 error 처리*/
/
create or replace trigger item_borrow
before insert or delete or update of count ON borrow
for each row
DECLARE
    v_count NUMBER;
BEGIN
    IF INSERTING THEN
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF :new.count > v_count THEN
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count where IID = :new.BORROW_IID;
        END IF;
    ELSIF DELETING THEN
        SELECT REMAIN_COUNT into v_count FROM ITEM where :old.BORROW_IID = IID;
        update ITEM set REMAIN_COUNT = REMAIN_COUNT + :old.count where IID = :old.BORROW_IID;
    ELSE
        SELECT REMAIN_COUNT into v_count FROM ITEM where :new.BORROW_IID = IID;
        IF  :new.count > v_count + :old.count THEN
        ELSE
            update ITEM set REMAIN_COUNT = REMAIN_COUNT - :new.count + :old.count where IID = :new.BORROW_IID;
        END IF;
    END IF;
END;
/

/*item update 프로시저, item이 이미 존재한다면 remain_count만 Update, item이 존재하지 않는다면 Insert*/
/
create or replace procedure add_item(item_name IN varchar2,item_count IN INT, item_dept IN varchar2, item_category IN varchar2)
IS
    v_iid INT;
BEGIN
    BEGIN
        SELECT i.iid into v_iid from ITEM i, DEPARTMENT d where i.did = d.did and d.dname = item_dept and i.iname = item_name;
        UPDATE ITEM set remain_count = remain_count + item_count where iid = v_iid;
        DBMS_OUTPUT.PUT_LINE('UPDATE 완료');
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN v_iid := 0;
    END;
    
    IF v_iid = 0 THEN
        INSERT INTO ITEM VALUES(AUTO_PK_ITEM.NEXTVAL, item_name, 
            (SELECT cid FROM category where cname = item_category),
            item_count, 
            (SELECT did FROM department WHERE dname = item_dept)
            );
        DBMS_OUTPUT.PUT_LINE('INSERT 완료');
    END IF;
END;
/

-- 사용자가 몇 개의 물건을 빌려갔는지 검사
create or replace function users_borrow_count(uid int)
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

-- 반납기간이 지난 물건이 있는지 검사
create or replace function time_limit(uid int)
return int
is 
    cnt int;
begin
    select count(*) into cnt
    from borrow
    where (borrow_uuid = uid and end_date < SYSDATE);
    return cnt;
end;
/


/*MD5암호화를 통한 비밀번호 저장*/
CREATE OR REPLACE FUNCTION FUNC_MD5_ENCRYPTION(V_INPUT_STRING IN VARCHAR2) RETURN VARCHAR2
IS
ENCRYPTED_STRING    VARCHAR2(128);

        BEGIN
        IF V_INPUT_STRING IS NOT NULL THEN
                ENCRYPTED_STRING := LOWER(RAWTOHEX(UTL_RAW.CAST_TO_RAW(DBMS_OBFUSCATION_TOOLKIT.MD5(input_string=>V_INPUT_STRING)))); 
        END IF;
        
        RETURN ENCRYPTED_STRING;
 END FUNC_MD5_ENCRYPTION;

/*borrow table에 변화가 있을때 마다 MEMO table에 로그 저장*/
create or replace trigger borrow_log
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
        
        insert into memo values(sysdate,'신청',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    elsif updating then
        select dname into v_u_dname from department where did = (select did from users where uuid = :new.borrow_uuid);
        select uname into v_uname from users where uuid = :new.borrow_uuid;
        select dname into v_i_dname from department where did = (select did from item where iid = :new.borrow_iid);
        select iname into v_iname from item where iid = :new.borrow_iid;
        v_count := :new.count;
        v_start_date := :new.start_date;
        v_end_date := :new.end_date;
        
        insert into memo values(sysdate,'수정',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    else
        select dname into v_u_dname from department where did = (select did from users where uuid = :old.borrow_uuid);
        select uname into v_uname from users where uuid = :old.borrow_uuid;
        select dname into v_i_dname from department where did = (select did from item where iid = :old.borrow_iid);
        select iname into v_iname from item where iid = :old.borrow_iid;
        v_count := :old.count;
        v_start_date := :old.start_date;
        v_end_date := :old.end_date;
        
        insert into memo values(sysdate,'반납',v_u_dname,v_uname,v_i_dname,v_iname,v_count,v_start_date,v_end_date);
    end if;
end;


/*물건을 빌릴떄 borrow 테이블 isnert를 위한 프로시저*/
create or replace procedure add_borrow (p_uuid IN int, p_iid IN int, p_count IN int)
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

/*item 의 수량을 수정할때 음수면 에러, 양수면 수정, 0이면 빌려간사람이 있다면 0 빌려간 사람이 없다면 삭제*/
create or replace procedure modify_item(item_iid IN INT,item_count IN INT)
IS
    v_remain INT;
    v_count INT;
BEGIN
    IF item_count < 0 THEN
        raise_application_error(-20001,'범위 에러');
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