update review1 set reviewLike=0 where reviewNum=3;
update movie1 set movpic='15The Beauty Inside.jpg' where movNum=27; 
-- 칼럼 데이터 타입 수정
alter table movie Modify (act1Ko varchar2(40));