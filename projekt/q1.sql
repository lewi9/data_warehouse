WITH sum_amount_customer AS (
	SELECT CustomerKey, SUM(amount) AS sum_amount
	FROM FactSales
	GROUP BY CustomerKey
)

SELECT 
	*,
	PERCENT_RANK() OVER(ORDER BY sum_amount DESC) AS prc_rnk
FROM sum_amount_customer