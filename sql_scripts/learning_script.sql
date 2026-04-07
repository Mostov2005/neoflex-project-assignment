SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name = 'arhdoc_dbt';

SHOW search_path;

SELECT * FROM ыыфы

SET search_path TO bank, public;


SELECT 'account_dbt' AS table_name, COUNT(*) AS rows_count FROM account_dbt
UNION
SELECT 'arhdoc_dbt' AS table_name, COUNT(*) AS rows_count FROM arhdoc_dbt
UNION
SELECT 'balance_dbt' AS table_name, COUNT(*) AS rows_count FROM balance_dbt
UNION
SELECT 'crncdate_dbt' AS table_name, COUNT(*) AS rows_count FROM crncdate_dbt
UNION
SELECT 'currency_dbt' AS table_name, COUNT(*) AS rows_count FROM currency_dbt
UNION
SELECT 'restdate_dbt' AS table_name, COUNT(*) AS rows_count FROM restdate_dbt




SELECT Code_Currency,
       Name_Currency,
       Short_Name,
       Date_Rate
FROM currency_dbt
WHERE Date_Rate >= DATE '2021-05-01';


SELECT * FROM currency_dbt

SELECT * FROM crncdate_dbt
order by date_rate desc

SELECT DISTINCT code_currency 
FROM crncdate_dbt


SELECT DISTINCT code_currency
FROM crncdate_dbt
WHERE date_rate >= DATE '2021-05-01'



