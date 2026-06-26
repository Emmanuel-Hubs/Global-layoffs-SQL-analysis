-- IMPORTING CSV DATASET INTO MYSQL 






DROP TABLE IF EXISTS layoffs;

CREATE TABLE layoffs (
  company VARCHAR(255),
  location VARCHAR(255),
  industry VARCHAR(255),
  total_laid_off INT,
  percentage_laid_off DOUBLE,
  `date` DATE,
  stage VARCHAR(255),
  country VARCHAR(255),
  funds_raised_millions DOUBLE
);


LOAD DATA LOCAL INFILE '/Users/manuel/Downloads/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SET GLOBAL local_infile = 1 ;
SHOW VARIABLES LIKE 'local_infile';

DESCRIBE layoffs; 

DROP TABLE IF EXISTS layoffs;

CREATE TABLE layoffs (
  company VARCHAR(255),
  location VARCHAR(255),
  industry VARCHAR(255),
  total_laid_off INT,
  percentage_laid_off DOUBLE,
  `date` VARCHAR(20),
  stage VARCHAR(255),
  country VARCHAR(255),
  funds_raised_millions DOUBLE
);

LOAD DATA LOCAL INFILE '/Users/manuel/Downloads/layoffs.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) 
FROM layoffs; 

SHOW WARNINGS
LIMIT 20; 

SELECT* FROM layoffs; 





-- DATA CLEANING 




-- STEP 1 : CREATE A DUPLICATE TABLE 

CREATE TABLE layoffs_staging 
LIKE layoffs; 

INSERT INTO layoffs_staging 
SELECT* 
FROM layoffs ; 

SELECT COUNT(*)
FROM layoffs_staging; 





-- STEP 2 IDENTIFY AND DELETE DUPLICATES 







SELECT* ,
 ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', country, funds_raised_millions) 
 AS Row_no
FROM layoffs_staging; 

CREATE TABLE layoffs_staging2 (
  company VARCHAR(255),
  location VARCHAR(255),
  industry VARCHAR(255),
  total_laid_off INT,
  percentage_laid_off DOUBLE,
  `date` VARCHAR(20),
  stage VARCHAR(255),
  country VARCHAR(255),
  funds_raised_millions DOUBLE,
  Row_no INT
);

SELECT* 
FROM layoffs_staging2; 

INSERT INTO Layoffs_staging2
SELECT* ,
 ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', country, funds_raised_millions) 
 AS Row_no
FROM layoffs_staging; 

SELECT*
FROM layoffs_staging2
WHERE Row_no > 1 ; 

SET SQL_SAFE_UPDATES =0;

DELETE
FROM layoffs_staging2
WHERE Row_no > 1 ; 

SELECT*
FROM layoffs_staging2; 







-- STEP 3 : STANDARDIZING DATA 





SELECT company, TRIM(COMPANY) 
FROM layoffs_staging2; 

UPDATE layoffs_staging2
SET company = TRIM(company); 

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1; 

SELECT* 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%'; 

UPDATE layoffs_staging2
SET industry ='Crypto'
WHERE industry LIKE 'Crypto%'; 

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT* 
FROM layoffs_staging2
WHERE INDUSTRY LIKE 'Fin%'; 

UPDATE layoffs_staging2 
SET industry = 'Finance'
WHERE industry LIKE 'Fin%'; 

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT* 
FROM layoffs_staging2 
WHERE country LIKE 'United States.%'; 

UPDATE layoffs_staging2
SET country = 'United States' 
WHERE country LIKE 'United States.%'; 

SELECT DISTINCT location 
FROM layoffs_staging2
ORDER BY 1 ; 

SELECT DISTINCT * 
FROM layoffs_staging2
WHERE industry IS NULL OR industry = '';

SELECT * 
FROM layoffs_staging2 
WHERE company = 'Airbnb';

UPDATE layoffs_staging2 
SET industry = 'Travel' 
WHERE company = 'Airbnb';

SELECT * 
FROM layoffs_staging2 
WHERE company LIKE 'Carvana%';

UPDATE layoffs_staging2 
SET industry = 'Transportation' 
WHERE company LIKE 'Carvana%';

SELECT * 
FROM layoffs_staging2 
WHERE company = 'Juul';

UPDATE layoffs_staging2 
SET industry = 'Consumer' 
WHERE company = 'Juul';

SELECT DISTINCT * 
FROM layoffs_staging2
WHERE industry IS NULL OR industry = '';





-- STEP 4 
-- I noticed some tables has duplicated themselves. I will confirm and delete duplicates 


SELECT company, location, industry, total_laid_off, percentage_laid_off, COUNT(*) AS CNT 
FROM layoffs_staging2
GROUP BY company, location, industry, total_laid_off, percentage_laid_off
HAVING CNT > 1 ;

CREATE TABLE layoffs_clean AS
SELECT DISTINCT* 
FROM layoffs_staging2;

SELECT COUNT(*) FROM layoffS_staging2;
SELECT COUNT(*) FROM layoffs_clean; 






-- STEP 5: REMOVING UNNECESSSARY ROWS AND COLUMNS (Rows or Columns with not enough information) 




SELECT *
FROM layoffs_clean
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL; 

DELETE 
FROM layoffs_clean
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL; 

ALTER TABLE layoffs_clean
DROP COLUMN Row_no; 

SELECT *
FROM layoffs_clean;





















