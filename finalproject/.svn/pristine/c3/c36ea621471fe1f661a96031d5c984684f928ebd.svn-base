select * from pcharge;
delete from movPay where email='tree@hash.tag';

select * from exmovie where myComm is not null and commDel = 'n';

select s.* from (select * from hashtag order by dbms_random.value)s;


select * from (select e.movNum, writeDate, movNameKo, myComm ,hashNum1, hashNum2, hashNum3, rowNum rn from 
(select * from exmovie order by writeDate)e, movie m
where e.movNum = m.movNum and email='1@1.1') where rn between 1 and 5;

select count(*) from exmovie;

alter table exmovie DROP COLUMN spoiler;
ALTER TABLE exmovie ADD (spoiler varchar2(5) default 'n');
select * from EXMOVIE;

select email, movNum, myComm, hashNum1, hashNum2, hashNum3, spoiler from exmovie;

select * from tab;

	select * from (select c.*, rowNum rn
	from (select email, pChargeDate, pChargedAmm, null price, null movNameKo
	from pcharge where email='tree@hash.tag' union 
	select email, movPayDate,null, price, movNameKo
	from movPay mp, movie m where m.movNum=mp.movNum and email='tree@hash.tag' order by pChargeDate desc)c)
     where (rn between 1 and 5);
     
commit;