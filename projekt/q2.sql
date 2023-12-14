WITH sum_amount_carrier AS (
	SELECT CarrierKey, SUM(amount) AS sum_amount
	FROM FactSales 
	GROUP BY CarrierKey
)

SELECT 
	*,
	STDEV(sum_amount) OVER(ORDER BY sum_amount ASC) AS std
FROM sum_amount_carrier



