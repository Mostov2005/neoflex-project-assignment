--5) Определение дебетового оборота по счету, в заданном периоде дат, в рублях. 
--Результатом выполнения должен содержать следующие столбцы:
--Столбец	Формат	Описание
--date_from	DATE, YYYY-MM-DD	Начальная дата выбирается самим пользователем.
--Диапазон считается от 00:00 начальной даты.
--date_to	DATE, YYYY-MM-DD	Конечная дата, выбирается самим пользователем.
--Диапазон считается до 24:00 конечной даты.
--acc_num	CHAR (20)	Номер счета, выбирается самим пользователем
--dt_turnover	NUMERIC	Сумма дебетового оборота для счета за выбранный период дат.*
--*Рассчитывается по проводкам
	
SELECT
	DATE '2020-01-01' AS date_from,
	DATE '2020-12-31' AS date_to,
	ac.account AS acc_num,
	SUM(
        CASE
            WHEN ac.Kind_Account = 'А' AND ar.Real_Receiver = ac.account THEN ar.Sum
            WHEN ac.Kind_Account = 'П' AND ar.Real_Payer = ac.account THEN ar.Sum
            ELSE 0
        END
    ) AS dt_turnover
FROM
	ACCOUNT_DBT ac
JOIN arhdoc_dbt ar 
    ON
	(
        ar.Real_Payer = ac.account
		OR ar.Real_Receiver = ac.account
    )
	AND ar.Code_Currency = ac.Code_Currency
	AND ar.Chapter = ac.Chapter
WHERE
	ac.account = '40702810800000003477'
	AND ac.Code_Currency = 0
	AND ar.Date_Carry BETWEEN DATE '2020-01-01' AND DATE '2020-12-31'
GROUP BY
	ac.account