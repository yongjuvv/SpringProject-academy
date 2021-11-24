-- 테이블 삭제
drop table movie1;
drop table pCharge1;
drop table pay1;
drop table pProduct1;
drop table review1;
-- coReply1, like1 테이블 먼저 삭제하고 review1 테이블 삭제할 것 (f.k 지정 때문)
drop table coReply1;
drop table like1;
drop table pmember1;
drop table hashtag1;
drop table bankList1;
drop table tv1;
drop table tvEp1;

-- 테이블 데이터 지우기
delete from coReply1 where reviewNum=4;
delete from like1 where reviewNum=4;
delete from review1 where reviewNum=4;
delete from movie1 where movNum=3;
delete from pmember1;
delete from movie1;
delete from movPay1;
delete from person1;
delete from movie1;
delete from tv1;