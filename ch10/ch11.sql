create table USER(
    USERID   varchar(255) NOT NULL,
    USERNAME varchar(255) NOT NULL
);

출처: https://chldnals.tistory.com/18 [안되면 될 때까지]

create table replyBoard (
rno number primary key,
bno number not null references board(num),
replytext varchar2(500) not null,
replyer varchar2(50) not null,
regdate date not null,
updatedate date not null,
del char(1)
);
alter table replyboard add(del char(1));
select * from board order by num desc;
insert into REPLYBOARD values(3, 229, '11', '철수',sysdate, sysdate);
insert into REPLYBOARD values(4, 229, '11', '길동',sysdate, sysdate);
insert into REPLYBOARD values(5, 229, '1123', '길동',sysdate, sysdate,'n');
insert into REPLYBOARD values(6, 229, '1123', '민수',sysdate, sysdate,'n');
select * from replyboard;