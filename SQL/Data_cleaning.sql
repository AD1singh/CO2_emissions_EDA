create database co2_project;
use co2_project;
SELECT * FROM raw_emissions LIMIT 10;
create table emissions_clean(
country varchar(100),
iso2 varchar(5),
iso3 varchar(5),
industry varchar(200),
indicator varchar(100),
year int,
value double);
insert into emissions_clean ( country, iso2, iso3, industry, indicator, year, value)
select Country, ISO2, ISO3, Industry, Indicator, 1995, f1995 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1996, f1996 from raw_emissions 
union all 
select Country, ISO2, ISO3, Industry, Indicator, 1997, f1997 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1998, f1998 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1999, f1999 from raw_emissions
union all 
select Country, ISO2, ISO3, Industry, Indicator, 2000, f2000 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2001, f2001 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2002, f2002 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2003, f2003 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2004, f2004 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2005, f2005 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2006, f2006 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2008, f2007 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2008, f2008 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2009, f2009 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2010, f2010 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2011, f2011 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2012, f2012 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2013, f2013 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2014, f2014 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2015, f2015 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2016, f2016 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2017, f2017 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2018, f2018 from raw_emissions;
update emissions_clean ec
join raw_emissions rd
on ec.country= rd.country
and ec.industry= rd.industry
and ec.indicator= rd.indicator
set ec.value = ec.value * rd.scale;
set SQL_SAFE_UPDATES = 0;
update emissions_clean ec
join raw_emissions rd
on ec.country= rd.country
and ec.industry= rd.industry
and ec.indicator= rd.indicator
set ec.value = ec.value * rd.scale;
DROP TABLE emissions_clean;
use co2_project;
DROP TABLE emissions_clean;
create table emissions_clean_v2(
country varchar(100),
iso2 varchar(5),
iso3 varchar(5),
industry varchar(200),
indicator varchar(100),
year int,
value double);
insert into emissions_clean_v2 ( country, iso2, iso3, industry, indicator, year, value)
select Country, ISO2, ISO3, Industry, Indicator, 1995, f1995 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1996, f1996 * Scale from raw_emissions 
union all 
select Country, ISO2, ISO3, Industry, Indicator, 1997, f1997 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1998, f1998 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1999, f1999 * Scale from raw_emissions
union all 
select Country, ISO2, ISO3, Industry, Indicator, 2000, f2000 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2001, f2001 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2002, f2002 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2003, f2003 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2004, f2004 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2005, f2005 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2006, f2006 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2008, f2007 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2008, f2008 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2009, f2009 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2010, f2010 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2011, f2011 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2012, f2012 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2013, f2013 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2014, f2014 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2015, f2015 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2016, f2016 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2017, f2017 * Scale from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2018, f2018 * Scale from raw_emissions;
SELECT MIN(year), MAX(year) FROM emissions_clean_v2;
select min(year), max(year) from emissions_clean_v2;
select count(*) from emissions_clean_v2;
SELECT * FROM emissions_clean_v2 LIMIT 10;
SELECT industry,
       SUM(value) AS total_emissions
FROM emissions_clean_v2
WHERE indicator = 'CO2 emissions'
  AND year = 2018
GROUP BY industry
ORDER BY total_emissions DESC;
select f1995, scale from raw_emissions limit 10;
SELECT * FROM emissions_clean LIMIT 10;
CREATE TABLE emissions_clean_v3 (
    country VARCHAR(100),
    iso2 VARCHAR(5),
    iso3 VARCHAR(5),
    industry VARCHAR(200),
    indicator VARCHAR(100),
    year INT,
    value DOUBLE
);
insert into emissions_clean_v3 ( country, iso2, iso3, industry, indicator, year, value)
select Country, ISO2, ISO3, Industry, Indicator, 1995, f1995 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1996, f1996 from raw_emissions 
union all 
select Country, ISO2, ISO3, Industry, Indicator, 1997, f1997 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1998, f1998 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 1999, f1999 from raw_emissions
union all 
select Country, ISO2, ISO3, Industry, Indicator, 2000, f2000 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2001, f2001 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2002, f2002 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2003, f2003 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2004, f2004 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2005, f2005 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2006, f2006 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2007, f2007 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2008, f2008 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2009, f2009 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2010, f2010 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2011, f2011 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2012, f2012 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2013, f2013 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2014, f2014 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2015, f2015 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2016, f2016 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2017, f2017 from raw_emissions
union all
select Country, ISO2, ISO3, Industry, Indicator, 2018, f2018 from raw_emissions;
SELECT * FROM emissions_clean_v3 LIMIT 10;
SELECT MIN(year), MAX(year) FROM emissions_clean_v3;
SELECT industry,
       SUM(value) AS total_emissions
FROM emissions_clean_v3
WHERE indicator = 'CO2 emissions'
  AND year = 2018
GROUP BY industry
ORDER BY total_emissions DESC;
SELECT country,
       SUM(value) AS emissions
FROM emissions_clean_v3
WHERE indicator = 'CO2 emissions'
  AND year = 2018
GROUP BY country
ORDER BY emissions DESC;
SELECT year,
       SUM(value) AS total_emissions
FROM emissions_clean_v3
WHERE indicator = 'CO2 emissions'
GROUP BY year
ORDER BY year;
SELECT industry, year,
       SUM(value) AS emissions
FROM emissions_clean_v3
WHERE indicator = 'CO2 emissions'
GROUP BY industry, year;
SELECT industry,
       AVG(value) AS avg_intensity
FROM emissions_clean_v3
WHERE indicator = 'CO2 emissions intensity'
GROUP BY industry
ORDER BY avg_intensity DESC;
select distinct indicator from emissions_clean_v3;
SELECT industry,
       AVG(value) AS avg_intensity
FROM emissions_clean_v3
WHERE indicator LIKE '%intens%'
GROUP BY industry
ORDER BY avg_intensity DESC;
SELECT industry,
       AVG(value) AS avg_multiplier
FROM emissions_clean_v3
WHERE LOWER(indicator) LIKE '%mult%'
GROUP BY industry
ORDER BY avg_multiplier DESC;
SELECT DISTINCT indicator FROM emissions_clean_v3;
select industry, sum(value) as total_emissions
from emissions_clean_v3
where lower(indicator) like '%emission%'
and year= 2018
group by industry
order by total_emissions desc;
SELECT country,
       SUM(value) AS emissions
FROM emissions_clean_v3
WHERE LOWER(indicator) LIKE '%emission%'
  AND year = 2018
GROUP BY country
ORDER BY emissions DESC;
SELECT country,
       SUM(value) AS emissions
FROM emissions_clean_v3
WHERE LOWER(indicator) = 'co2 emissions'
  AND year = 2018
GROUP BY country
ORDER BY emissions DESC;
SELECT year,
       SUM(value) AS total_emissions
FROM emissions_clean_v3
WHERE LOWER(indicator) = 'co2 emissions'
GROUP BY year
ORDER BY year;
SELECT industry,
       AVG(value) AS avg_intensity
FROM emissions_clean_v3
WHERE LOWER(indicator) LIKE '%intens%'
GROUP BY industry
ORDER BY avg_intensity DESC;
SELECT industry,
       AVG(value) AS avg_multiplier
FROM emissions_clean_v3
WHERE LOWER(indicator) LIKE '%mult%'
GROUP BY industry
ORDER BY avg_multiplier DESC;
select * from emissions_clean_v3;
select * from emissions_clean_v3;
select count(*) from emissions_clean_v3;
select distinct year from emissions_clean_v3 order by year;
select * from emissions_clean_v3;
use co2_project;
select * from emissions_clean_v3;
use co2_project;
select *from emissions_clean_v3;
use co2_project;
SELECT *
INTO OUTFILE 'C:\Users\Aditya\Desktop\DataSet\CO2 emission\emissions_2018.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM emissions_clean_v3
WHERE year = 2018;
SHOW VARIABLES LIKE 'secure_file_priv';
SELECT *
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/emissions_2018.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM emissions_clean_v3
WHERE year = 2018;