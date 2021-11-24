create table pj_customer(
	id varchar2(20),
	password varchar2(20),
	name varchar2(20),
	sex char(1),
	address varchar2(20),
	class varchar2(20),
	email varchar2(20),
	phoneNumber varchar2(20),
	joindate date,
	del char(1)
);
select * from tab;

create table pj_product(
p_Num number(10),
p_Company varchar2(20),
p_Name varchar2(20),
p_Price number(10),
p_Quantity number(10),
p_Regdate varchar2(20),
p_Color varchar2(20));

create table pj_order(
or_Number number(10),
or_Date date,
or_TotalCost number(10),
or_DeliveryState char(1));

create table pj_pet(
pet_Number number(10),
pet_Name varchar2(20),
pet_Sex char(1),
pet_Type varchar2(20),
pet_Age number(10));

create table pj_basket(
ba_Num number(10),
ba_Quantity number(10),
ba_TotalPrice number(10),
ba_Date date);

create table pj_productCompany(
pc_Name varchar2(20),
pc_Address varchar2(20),
pc_PhoneNumber varchar2(20));

create TABLE pj_productBoard(
   pb_Num number(10),
   pb_Title varchar2(20),
   pb_Content varchar2(500),
   pb_Image varchar(50),
   pb_Readcount number(10),
   pb_Like number(10),
   pb_Ip varchar2(10),
   pb_Regdate date,
   pb_Del char(1) default 'n'
);

create table pj_heal(
	pet_Health varchar2(100)
);

create table pj_petloc(
	pet_Location varchar2(20)
);

drop table pj_helpBoard();
create table pj_helpBoard(
	hb_number number primary key, --key
	hb_writer varchar2(20) not null, -- 작성자
	hb_subject varchar2(50) not null, -- 제목
	hb_content varchar2(500) not null, -- 본문
	hb_email varchar2(30), --이메일
	hb_readcount number default 0, --읽은 횟수
	hb_password varchar2(12) not null, --암호
	hb_ref number not null, --답변들끼리 그룹
	hb_re_step number not null, -- ref내의 순서
	hb_re_level number not null, -- 들여쓰기
	hb_ip varchar2(20) not null, -- 작성자ip
	hb_reg_date date not null, -- 작성일
	hb_del char(1)
);

insert into PJ_HELPBOARD
values(1,'asd','test','asdasd','asd@naver.com',0,'123',1,1,1,'1',sysdate,'n');