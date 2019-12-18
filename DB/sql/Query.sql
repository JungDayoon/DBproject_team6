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
INSERT INTO USERS VALUES(2015114398,'이용호','ID', FUNC_MD5_ENCRYPTION('PASSWORD') , 
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

/*유저 ID를 주었을때 빌린 물건 정보 출력*/
Select i.iname, d.dname ,b.count, b.start_date, b.end_date from borrow b, item i, department d where b.borrow_uuid = 567 and b.borrow_iid = i.iid and d.did = i.did;
