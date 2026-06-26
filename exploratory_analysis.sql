
-- EXPLORATORY DATA ANALYSIS 

SELECT* 
FROM layoffs_clean; 

-- 1. TOTAL EMPLOYEES LAID OFF WORLDWIDE

SELECT SUM(total_laid_off) AS Total_layoffs
FROM layoffs_clean ; 



-- 2 MAXIMUM SINGLE LAYOFF EVENT 

SELECT MAX(total_laid_off) AS Max_layoff
FROM layoffs_clean; 


-- 3 MAXIMUM PERCENTAGE OF WORKFORCE LAID OFF 

SELECT * 
FROM layoffs_clean
WHERE percentage_laid_off = (SELECT MAX(percentage_laid_off) FROM layoffs_clean) 
ORDER BY total_laid_off DESC;

-- 4 COMPANIES WITH THE HIGHEST TOTAL LAYOFFS 

SELECT company, SUM(total_laid_off) AS Total
FROM layoffs_clean
GROUP BY company 
ORDER BY Total DESC;


-- 5 INDUSTRIES MOST AFFECTED 

SELECT Industry, SUM(total_laid_off) AS Total 
FROM layoffs_clean
GROUP BY industry 
ORDER BY total DESC ; 


-- 6 COUNTRIES WITH THE HIGHEST LAYOFFS

SELECT country, SUM(total_laid_off) AS Total
FROM layoffs_clean
GROUP BY country 
ORDER BY Total DESC; 


-- 7 FUNDING STAGE OF COMPANY MOST AFFCTED BY LAYOFFS


SELECT stage, SUM(total_laid_off) AS Total
FROM layoffs_clean
GROUP BY stage 
ORDER BY Total DESC; 


SELECT* 
FROM layoffs_clean; 

-- 8 AVERAGE LAYOFFS PER COMPANY 

SELECT company, AVG(total_laid_off) AS Average_layoff
FROM layoffs_clean
GROUP BY company 
ORDER BY 2 DESC; 


-- 9 TOTAL FUNDING RAISED BY COMPANIES THAT CONDUCTED LAYOFFS WORLDWIDE

SELECT SUM(funds_raised_millions) AS Total_funding_raised 
FROM layoffs;


-- 10 TOTAL FUNDING RAISED PER COMPANY 

SELECT company, SUM(funds_raised_millions) AS Total_funding_raised 
FROM layoffs_clean
GROUP BY company 
ORDER BY 2 DESC ; 





