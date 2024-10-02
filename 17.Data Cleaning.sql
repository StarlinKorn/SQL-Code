-- Data Cleaning

SELECT * 
FROM layoffs ;

-- Remove the Duplicate 
-- Standardize the Data
-- Null Values or Blank Values
-- Remove any Columns or Rows

CREATE TABLE layoffs_starlin
LIKE layoffs;

SELECT *
FROM layoffs_starlin;

INSERT layoffs_starlin
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_starlin;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_starlin
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1 ;


CREATE TABLE `layoffs_starlin2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_starlin2;

INSERT INTO layoffs_starlin2
SELECT *,
ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_starlin;

DELETE
FROM layoffs_starlin2
WHERE row_num > 1 ;

SELECT *
FROM layoffs_starlin2
WHERE company LIKE 'Oda%' ;

SELECT company, TRIM(company)
FROM layoffs_starlin2;

UPDATE layoffs_starlin2
SET company = TRIM(company);

SELECT DISTINCT *
FROM layoffs_starlin2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_starlin2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM layoffs_starlin2 ;

SELECT DISTINCT country
FROM layoffs_starlin2
WHERE country LIKE 'United S%' ;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_starlin2
WHERE country LIKE 'United S%' ;

UPDATE layoffs_starlin2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`, STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_starlin2;

UPDATE layoffs_starlin2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_starlin2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_starlin2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE  layoffs_starlin2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_starlin2
WHERE industry IS NULL
OR industry = '' ;

SELECT *
FROM layoffs_starlin2
WHERE company LIKE 'Bally%' ;


SELECT t1.industry, t2.industry
FROM layoffs_starlin2 t1
JOIN layoffs_starlin2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL ;

UPDATE layoffs_starlin2 t1
JOIN layoffs_starlin2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE ( t1.industry IS NULL OR t1.industry = '' )
AND t2.industry IS NOT NULL ;

-- SET SQL_SAFE_UPDATES = 0;

SELECT *
FROM layoffs_starlin2
WHERE (total_laid_off IS NULL OR total_laid_off = '')
AND (percentage_laid_off IS NULL OR percentage_laid_off = '') ;

DELETE
FROM layoffs_starlin2
WHERE (total_laid_off IS NULL OR total_laid_off = '')
AND (percentage_laid_off IS NULL OR percentage_laid_off = '') ;


ALTER TABLE layoffs_starlin2
DROP row_num;



