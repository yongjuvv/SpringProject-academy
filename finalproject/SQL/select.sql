select * from MOVIE1;
select * from tv1;
select * from tvEp1;
select * from pmember1;
select * from review1;
select * from hashtag1;
select * from pCharge1;
select * from pProduct1;
select * from movPay1;
select * from person1;
select * from coReply1;
select * from like1;
select * from pay1;
select * from pCharge1;

-- 해당 리뷰에 대한 세션 이메일의 likeChk 여부 조회
select * from review1 r, LIKE1 l where r.reviewNum=l.reviewNum and ;

--전체 테이블 조회
select * from tab;
select count(*) from (select reviewRate from review1 where movNum=2);

select reviewRate/2 from
	(select reviewRate,count(reviewRate) cnt from review1
		where email='na@a.com' and reviewRate > 0 
		group by reviewRate order by cnt desc) a
		where rownum =1;
			