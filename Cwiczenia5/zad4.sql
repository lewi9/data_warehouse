CREATE VIEW CarrierSales
WITH SCHEMABINDING
AS
SELECT 
	fs.sale_key,
	fs.time,
	fs.customer_key,
	fs.quantity,
	dc.carrier_name,
	dc.address,
	dc.contact_person
FROM [dbo].[FACTsales] fs
JOIN[dbo].DIMcarriers dc ON fs.carrier_key = dc.carrier_key

CREATE UNIQUE CLUSTERED INDEX IX_CustomerSales
ON dbo.CarrierSales (sale_key, time, customer_key, quantity, carrier_name, address, contact_person)
