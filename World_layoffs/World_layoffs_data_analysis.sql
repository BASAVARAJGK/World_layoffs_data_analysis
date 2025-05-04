select *
from layoffs
;
-- creating temp table layoffs_staging to avoid messing with the raw data
create table layoffs_staging
select *
from layoffs
;

select*
from layoffs_staging
;

-- deleting the  duplicate data by creating the additional column as num_row to count the repetation of the data and later on deleted the duplicate data
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `num_row` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
;

insert into layoffs_staging2
select *,
row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as num_row
from layoffs_staging;

select *
from layoffs_staging2
where num_row > 1
;

delete 
from layoffs_staging2
where num_row > 1
;

-- standardizing data to make uniform and good looking data for easy understanding and presentable data 
select company
from layoffs_staging2
;
select trim(company)
from layoffs_staging2
;
update layoffs_staging2
set company = trim(company)
;

select industry
from layoffs_staging2 
where industry like 'Crypto%'
;

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%'
;

select distinct country
from layoffs_staging2
;

update layoffs_staging2
set country = 'United States'
where country like ('United States%')
;

-- Changing the date from string to date type 

select `date`,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_staging2
;

update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y')
;

select date
from layoffs_staging2
;

alter table layoffs_staging2
modify column `date` date;

select *
from layoffs_staging2
;


-- Deleteing the unwanted null values & blank values

select *
from layoffs_staging2
where industry is null
or industry = ''
;

select *
from layoffs_staging2
where company like "Bally's %"
;


update layoffs_staging2
set industry = null
where industry = ''
;

-- joining the same table with common data to store the data where every is possible 
-- like here the some companies having the industy details in some country but every where but operating industy of the company is same so we are adding the same industry to match things
select *
from layoffs_staging2 as t1
join layoffs_staging2 as t2
	on t1.company = t2.company
    and t1.location = t2.location
where t1.industry is null 
and t2.industry is not null
;

update layoffs_staging2 as t1
join layoffs_staging2 as t2 
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null
;

-- deleting the null values

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2
where total_laid_off is null
;

delete
from layoffs_staging2
where total_laid_off is null
;

select *
from layoffs_staging2
where percentage_laid_off is null
;

delete
from layoffs_staging2
where percentage_laid_off is null
;

-- dropping the num_row column which is having no use in this stage

alter table layoffs_staging2
drop column num_row;

select *
from layoffs_staging2
;

select distinct company,funds_raised_millions
from layoffs_staging2
;

select *
from layoffs_staging2
where funds_raised_millions is null;

delete
from layoffs_staging2
where funds_raised_millions is null;