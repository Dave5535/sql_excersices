create database exercise;

use exercise;

create table printHello(
id int not null,
message varchar(255) not null
);
select * from printHello;

-- 1
insert into printHello(ID , MESSAGE) value (123, 'Hello World' );

use world;

-- 2
select * from city;
select * from Country;
select * from CountryLanguage;

-- 3
select * from city where District like '%aceh%';
-- 4
select * from city where countrycode like '%bfa';
-- 5
select * from city where countrycode like '%tto%';
-- 6 ?
select * from city where CountryCode like '%arm%';
-- 7
select * from city where Name like 'bor%';
-- 8
select * from city where Name like '%orto%';
-- 9
select * from city where Population  < (1000);
-- 10
select DISTINCT CountryCode from city where Population  < (1000);
-- 11
select * from city where CountryCode like 'UKR' and Population > (1000000);
-- 12
select * from city where Population <(200) and Population >(9500000);
-- 13
select * from city where CountryCode in('TJK', 'MRT', 'PNG', 'SJM');
-- 14
select * from city where Population <= (700) and Population >= (200);
-- 15
select * from city where Population <= (20000) and Population >= (8000);
-- 16
select * from country where IndepYear < (0);
-- 17
select * from country where Population > (1000000) and IndepYear is null ;
-- 18
select * from country where SurfaceArea < (10);

-- SQL_2_join

-- 1
select * from city where Name like 'ping%' and Population order by Population Asc;
-- 2
select * from city where Name like 'ran%' and Population order by Population desc;
-- 3
select count(*) from city;
-- 4
select avg(Population) from city;
-- 5
select max(Population) from city;
-- 6
select min(Population) from city;
-- 7
select sum(Population) from city where Population < (10000);
-- 8
select count(*) from city where CountryCode in('MOZ','VNM');
-- 9
select (select count(*) from city where CountryCode in('MOZ'))as MOZ,
(select count(*) from city where CountryCode in('VNM')) as VNM;
-- 10
select avg(Population) from city where CountryCode in ('MOZ','VNM');
-- 11
select CountryCode, count(CountryCode)
from city
group by CountryCode
having count(CountryCode)> 200
-- 12
select CountryCode, count(CountryCode)
from city
group by CountryCode
having count(CountryCode)>= 200
Order by count(countrycode) Desc;
-- 13
select t.Language,t.CountryCode,Population<(500) and Population>(400)
from countrylanguage t inner join city p
 on p.CountryCode = t.CountryCode and Population<(500) and Population>(400);
 -- 14
 select Name,t.Language,t.CountryCode,Population<(600) and Population>(500)
from countrylanguage t inner join city p
 on Name = Name and p.CountryCode = t.CountryCode and Population<(600) and Population>(500);
 -- 15
SELECT c2.name FROM city c1,city c2
WHERE c1.countrycode=c2.countrycode AND c1.population=122199;
-- 16
select c2.name from city c1,city c2 where c1.CountryCode=c2.CountryCode and c1.Population = 122199
and c2.Population<> 122199;
-- 17 c1 = list of city.name c2 used as filter and country c is conferming capital
 SELECT c1.name FROM city c2,country c,city c1
 WHERE c2.name="luanda" AND c2.id=c.capital AND c.code=c1.countrycode;
 -- 18 cf and f are used as filters
 select cn.name from city cn, country cc, country cf , city f
 where f.name = 'Yaren'
 and f.id = cf.Capital
 and cf.Region = cc.Region
 and cc.Capital =cn.id;
 -- 19 distinct is used becaus many cities speak the same languages in the same region.
 select distinct language from city cn, countrylanguage cl, country cc, country cf, city f
 where f.name = 'Riga'
 and f.CountryCode = cf.Code
 and cf.Region = cc.Region
 and cc.Code = cl.CountryCode;
 -- 20 () can be a filter then that is being done first and get the number for the largest populated city
 select Name from city tc
 where tc.Population = (select max(Population) from city);
