-- Exploratory Data Analysis


SELECT *
FROM layoffs_starlin3;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_starlin2;

SELECT *
FROM layoffs_starlin2
WHERE percentage_laid_off = 1 
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY company
ORDER BY 2 DESC ;



SELECT MIN(`date`), MAX(`date`)
FROM layoffs_starlin2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY industry
ORDER BY 2 DESC ;

SELECT country, SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY country
ORDER BY 2 DESC ;

SELECT `date`,SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY `date`
ORDER BY 1 DESC;


SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoffs_starlin2
WHERE YEAR(`date`) IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY 1 ASC;

SELECT stage,SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, AVG(percentage_laid_off)
FROM layoffs_starlin2
GROUP BY company
ORDER BY 2 DESC ;


SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_starlin2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1;


WITH Rolling_cte AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_offs
FROM layoffs_starlin2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 
)
SELECT `MONTH`, total_offs, SUM(total_offs) OVER (ORDER BY `MONTH`) AS SUM_Total
FROM Rolling_cte;




WITH Rolling_cte AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUBSTRING(`date`,1,4) AS `YEAR`, SUM(total_laid_off) AS total_offs
FROM layoffs_starlin2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`, `YEAR` 
)
SELECT `MONTH`, total_offs, SUM(total_offs) OVER (ORDER BY `MONTH`) AS SUM_Total,
SUM(total_offs) OVER (PARTITION BY `YEAR` ORDER BY `MONTH`) AS Sum_Year
FROM Rolling_cte ;


SELECT company, SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY company
ORDER BY 2 DESC;


SELECT company, YEAR(`date`) AS `YEAR` , SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`) AS `YEAR` , SUM(total_laid_off)
FROM layoffs_starlin2
GROUP BY company, YEAR(`date`)
), Company_Years_Ranking AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Years_Ranking
WHERE Ranking <= 5;






SELECT *
FROM layoffs_starlin2;






