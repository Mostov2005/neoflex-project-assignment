--2) Определение даты последнего движения по счету по состоянию на определенную дату 
--Результатом выполнения должен содержать следующие столбцы:
--Столбец	Формат	Описание
--date	DATE, YYYY-MM-DD	Дата выбирается самим пользователем.
--acc_num	CHAR (20)	Номер счета, выбирается самим пользователем
--Date_last_active	DATE, YYYY-MM-DD	Дата, на которую произошло последнее движение средств по счету.
-- Поиск ведется от даты открытия счета до 24:00 часов даты из столбца date

SELECT
	DATE '2020-10-31' AS date, -- Сам указал дату
	ac.account AS acc_num,
	MAX(ar.Date_Carry) AS Date_last_active
FROM
	ACCOUNT_DBT ac
JOIN arhdoc_dbt ar 
    ON
	(
        ar.Real_Payer = ac.account
		OR ar.Real_Receiver = ac.account
    )
	AND ar.Code_Currency = ac.Code_Currency -- Так было написано в "Особенности учёта в АБС"
	AND ar.Chapter = ac.Chapter
WHERE
	ac.account = '40702810800000003477'
	AND ac.Code_Currency = 0
	AND ar.Date_Carry BETWEEN ac.open_date AND DATE '2020-10-31'
GROUP BY
	ac.account