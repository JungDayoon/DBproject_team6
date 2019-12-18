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
create or replace procedure update_item(item_name IN varchar2,item_count IN INT, item_dept IN varchar2, item_category IN varchar2)
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
