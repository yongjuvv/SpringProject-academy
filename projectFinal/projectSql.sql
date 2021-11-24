drop table pj_customer;

select * from pj_customer;

create table pj_customer(
id varchar(20) primary key,
password varchar(20) not null,
name varchar(20) not null,
sex char(1) not null,
address varchar(20) not null,
email varchar(20) not null,
phoneNumber varchar(20) not null,
joindate date not null,
del char(1));

select * from PJ_PRODUCT;
select * from pj_product;

drop table pj_product;

create table pj_product(
p_Number number(10) primary key,
p_Name varchar(20),
p_Price number(10),
p_Quantity number(10),
p_Regdate DATE,
p_Color varchar(20),
p_pcName varchar(20));

drop table pj_order;

delete from pj_order;

select * from pj_order;

create table pj_order(
orNumber number(20) primary key,
or_name varchar(30),
or_date date,
or_totalCost number(10),
or_deliveryState varchar(20),
or_deliveryLocation varchar(100),
or_buyType varchar(20),
or_color varchar(20),
or_count number(10),
id varchar2(20) constraint pj_order_id_fk references pj_customer
);

select * from PJ_ORDER;


alter table pj_pet drop column petheartbeat;
alter table pj_pet drop column pettemp;

select * from pj_pet;

drop table pj_pet;



create table pj_pet(
petNumber number(10) primary key,
pet_name varchar(20) not null,
pet_sex char(1) not null,
pet_type varchar(20) not null,
pet_age number(10) not null,
id varchar2(20) constraint pj_pet_id_fk references pj_customer);


drop table pj_productBoard;

create TABLE pj_productBoard(
   pbLike number(10) not null,
   pbIp varchar(10) not null,
   pbRegdate date not null,
   pbDel char(1) default 'n'
);

drop table pj_my;

create table pj_my(
    pNum varchar(20) primary key,
    petNumber number constraint pj_my_petNumber_fk references pj_pet,
    id varchar(20) constraint pj_my_id_fk references pj_customer,
    orNumber number(20) constraint pj_my_orNumber_fk references pj_order
);

insert into pj_my values('d',12341234,'minsu',202011238236);

drop table pet_health;

select * from pet_health;

insert into PET_HEALTH values ("양호","minsu","d",12341234,30,38);
select * from pj_customer;

create table pet_health(
	petHealth varchar(100) not null,
    id varchar(20) constraint pet_health_id_fk references pj_customer,
    pNum varchar(20) constraint pet_health_pNum_fk references pj_my,
    petNumber number(10) constraint pet_health_petNumber_fk references pj_pet,
    petHeartBeat number(20) not null,
    petTemp number(20) not null
);


insert into pet_health (petHealth, id, pNum, petNumber, petHeartBeat, petTemp)
values ('양호','minsu','d',12341234,30,38);
insert into pj_my values('d',12341234,'kurt7191',202011239799);

drop table pj_petloc;

create table pj_petloc(
	petLocation varchar(20) not null,
    id varchar(20) constraint pet_petloc_id_fk references pj_customer,
    pNum varchar(20) constraint pj_petloc_pNum_fk references pj_my,
    petNumber number(10) constraint pj_petloc_petNumber_fk references pj_pet
);

drop table pj_productCompany;

create table pj_productCompany(
pcName varchar(20),
pcAddress varchar(20),
pcPhoneNumber varchar(20));

drop table pj_helpBoard;

create table pj_helpBoard(
     id varchar2(20) constraint pet_helpBoard_id_fk references pj_customer,
   hb_writer varchar2(20) not null,
   hb_number number primary key,
   hb_subject varchar2(50) not null,
   hb_content varchar2(500) not null,
   hb_readcount number default 0,
   hb_ref number not null,
   hb_re_step number not null,
   hb_re_level number not null,
   hb_reg_date date not null,
   hb_del char(1)
);
 
 drop table pj_Board;

 select * from PJ_BOARD;
 
 alter table pj_Board rename column bNumber to b_num;
 
create table pj_Board (
b_num number primary key,
id varchar(20) constraint pj_Board_id_fk references pj_customer,
b_subject varchar(50) not null,
b_content varchar(500) not null,
b_readcount number default 0,
b_ip varchar(20) not null,
b_reg_date date not null,
b_del char(3)
);

create table replyBoard(
rno number primary key,
b_num number(10) constraint replyBoard_b_num_fk references pj_Board,
id varchar(20) constraint replyBoard_id_fk references pj_customer,
r_content varchar2(500),
r_regdate date not null,
r_updatedate date not null,
r_del char(3)
);
 
drop table replyBoard;

delete from REPLYBOARD;
select * from REPLYBOARD;
select * from PBreplyBoard;

select * from replyBoard where b_num=1 order by rno desc;

drop table PBreplyBoard;

create table PBreplyBoard(
pbrno number primary key,
pNumber number(10),
pbr_writer varchar(20),
id varchar(20) constraint PBreplyBoard_id_fk references pj_customer,
pbr_content varchar(500),
pbr_regdate date not null,
pbr_updatedate date not null,
pbr_del char(3)
 );
 

 
alter table pj_pet modify(petNumber number(36));
alter table pj_pet modify(pet_name varchar(20));
alter table pj_pet modify(pet_sex varchar(20));
alter table pj_pet modify(pet_type varchar(30));
alter table pj_pet modify(pet_age number(36));
 
alter table pj_customer modify(id varchar(100));
alter table pj_customer modify(password varchar(100));
alter table pj_customer modify(sex varchar(20));
alter table pj_customer modify(address varchar(100));
alter table pj_customer modify(email varchar(100));
alter table pj_customer modify(phoneNumber varchar(100));
