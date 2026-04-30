--3) Определение исходящего остатка по счету на определенную дату, в рублях.
--Результатом выполнения должен содержать следующие столбцы:
--Столбец	Формат	Описание
--date	DATE, YYYY-MM-DD	Дата выбирается самим пользователем.
--acc_num	CHAR (20)	Номер счета, выбирается самим пользователем
--rest_out	NUMERIC	Остаток средств на счету acc_num на момент 24:00 даты из столбца date


SELECT
	DATE '2020-12-31' AS date,
	ac.account AS acc_num,
	r.rest AS rest_out
FROM
	ACCOUNT_DBT ac
JOIN restdate_dbt r
    ON
	r.account = ac.account
	AND r.Code_Currency = ac.Code_Currency
	AND r.Chapter = ac.Chapter
WHERE
	ac.account = '40702810800000003477'
	AND ac.Code_Currency = 0
	AND r.date_carry <= DATE '2020-12-31'
ORDER BY
	r.date_carry DESC
LIMIT 1