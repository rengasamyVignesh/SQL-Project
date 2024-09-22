use myproject;
with data as(
select gender, count(`Patient ID`) as patient_count ,round( avg(`Y-BOCS Score (Obsessions)`),2) as avg_obse_score 
 from  ocd_patient_dataset  group by gender)
 select 
     sum(case when gender='female' then patient_count else 0 end ) as female_count,
     sum(case when gender='male' then patient_count else 0 end ) as male_count,
 
 round(sum(case when gender='female' then patient_count else 0 end ) / (sum(case when gender='female' then patient_count else 0 end ) +sum(case when gender='male' then patient_count else 0 end ))*100,2)
 as pct_female,
 
  round(sum(case when gender='male' then patient_count else 0 end ) / (sum(case when gender='male' then patient_count else 0 end ) +sum(case when gender='female' then patient_count else 0 end ))*100,2)
 as pct_male
 
 
 from data
 ;
 
 
 select Ethnicity ,count(`Patient ID`) as patient_count , round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obs  from  ocd_patient_dataset group by 1
order by 2 ;

alter table ocd_patient_dataset modify `OCD Diagnosis Date` date;

select
 date_format(`OCD Diagnosis Date`, '%y-%m-01 00:00:00') as month , 
 
 count(`Patient ID`)  as patient_count from  ocd_patient_dataset
 group by 1
 order by 1 ;
 
 select 
 `Compulsion Type`, count(`Patient ID`) as patient_count , round(avg(`Y-BOCS Score (Obsessions)`),2) as avg_obc 
 from  ocd_patient_dataset 
 group by 1
 order by 2;
 
 select
date_format(`OCD Diagnosis Date`, '%Y-%m-01 00:00:00') as month,
-- `OCD Diagnosis Date`
count(`Patient ID`) patient_count
from ocd_patient_dataset
group by 1
Order by 1
;
 

