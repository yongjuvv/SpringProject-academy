create table movie1 (
	movNum			number			primary key,
	movName			varchar2(200),
	movDirNum		number,
	movTime			number,
	movDate			date,
	prod			varchar2(50),
	movGrade		varchar2(20),
	movPic			varchar2(100),
	movDesc			varchar2(4000),
	movGenre1		varchar2(20),
	movGenre2		varchar2(20),
  	movPrice		number,
  	movVid			varchar2(200),
  	movTrailer		varchar2(200),
  	actNum1			number,
  	actNum2			number,
  	actNum3			number,
  	actNum4			number,
  	actNum5			number,
  	actNum6			number,
  	actNum7			number,
  	movClick		number
	);

create table TV1 (
	tvNum			number			primary key,
	tvName			varchar2(500),
	tvDirNum		number,
	tvDate			date,
	channel			varchar2(30),
	tvGrade			varchar2(20),
	tvPic			varchar2(100),
	tvDesc			varchar2(4000),
  	totEp			number,
  	tvGenre			varchar2(100),
  	actNum1			number,
  	actNum2			number,
  	actNum3			number,
  	actNum4			number,
  	actNum5			number,
  	actNum6			number,
  	actNum7			number,
  	tvClick			number
	);

create table tvEp1 (
	tvNum			number,
	tvEpNum			number,
	tvEpVid			varchar2(200),
	tvEpPrice		number,
  	primary key		(tvNum, tvEpNum)
);

create table person1 (
	personNum		number			primary key,
	personName		varchar2(100),
	personPic		varchar2(100)
);
	
create table pMember1 (
	email			varchar2(50)	primary key,
	pass			varchar2(20)	not null,
	memName			varchar2(20)	not null,
	nickName		varchar2(20),
	memPic			varchar2(200),
	memBirth		date,
	memPoint		number			default 0,
	regDate			date,
	memDel			varchar2(5) 	default 'n'
	);

create table review1 (
	reviewNum		number			PRIMARY KEY,
	email			varchar2(50),
  	movNum			number,
  	tvNum			number,
	hashNum1		number			not null,
  	hashNum2		number,
  	hashNum3		number,
	reviewComm		varchar2(1000),
  	reviewDate		date,
  	reviewUpdate	date,
  	reviewFirstChk	number,
  	reviewSpoiler	varchar2(5)		default 'n',
	reviewRate		number,
	reviewLike		number
);

-- review1 테이블 먼저 만들고 coReply1 테이블 생성할 것 (f.k 지정 때문)
create table coReply1 (
	coReplyNum		number			primary key,
	reviewNum		number,
	email			varchar2(50),
	coReEmail		varchar2(50),
	coReDate		date,
	coReUpdate		date,
	coReCont		varchar2(1000),
	coReDel			varchar2(5)		default 'n',
	FOREIGN KEY (reviewNum) REFERENCES review1 (reviewNum)
);

-- review1 테이블 먼저 만들고 like1 테이블 생성할 것 (f.k 지정 때문)
create table like1(
	reviewNum		number,
	email			varchar2(50),
	likeChk			number			default 0,
	primary key		(reviewNum, email),
	FOREIGN KEY (reviewNum) REFERENCES review1 (reviewNum),
	FOREIGN KEY (email) 	REFERENCES pmember1 (email)
);

create table hashtag1 (
	hashNum			number			primary key,
	clickCount 		number,
	hashName		varchar2(500)
);

create table pProduct1 (
	pProductNum			number			primary key,
	pProductPrice		number,
	pDesc				varchar2(100),
	pProductPoint		number
);

-- pProduct1 테이블 먼저 만들고 pCharge1 테이블 생성할 것 (f.k 지정 때문)
create table pCharge1 (
	pChargeNum			number			primary key,
	pProductNum			number,
	email				varchar2(50),
	pChargeDate			date,
	FOREIGN KEY (email) REFERENCES pmember1 (email),
	FOREIGN KEY (pProductNum) REFERENCES pProduct1 (pProductNum)
);

create table pay1 (
	payNum			number				primary key,
	email			varchar2(50),
	tvNum			number,
	tvEpNum			number,
	movNum			number,
	payDate			date,
	payState		varchar2(5)		default 'n',
	FOREIGN KEY (email) REFERENCES pmember1 (email)
);

create table bankList1 (
	bank varchar2(20) primary key,
	account varchar2(50) not null,
	comName varchar2(30) not null
);

create table faList1 (
	faNum number primary key,
	email varchar2(50),
	faName varchar2(50),
	faDesc varchar2(1000),
	faDate date,
	faLike number,
	faVidNum varchar2(4000)
);

create table faListReply1 (
	faReplyNum number primary key,
	faNum number,
	faReEmail varchar2(50),
	faReDate date,
	faReUpdate date,
	faReCont varchar2(1000),
	faReDel varchar2(5) default 'n'
);


create table collect1 (
   collNum number primary key,
   email varchar2(50),
   collName varchar2(50),
   collDesc varchar2(1000),
   collDate date
);
drop table collect1;
create sequence collVideo1_seq;
select * from cart1;
select * from collect1;
select * from COLLVIDEO1;

create table collVideo1 (
   collVidNum number primary key,
   collNum number,
   movNum number,
   tvNum number
);
create table cart1 (
   cartNum number,
   email varchar2(50),
   movNum number,
   tvNum number,
   primary key(cartNum, email)
);
