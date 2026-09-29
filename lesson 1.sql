SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--WHERE  c.City IN ('London', 'Paris', 'Rome', 'Berlin')
--WHERE c.LastName LIKE '%R'
ORDER BY c.Company ASC;


SELECT TOP 3
    c.Country,
    COUNT(*) AS NumberOfCustomers
FROM   Customer AS c
WHERE C.Company IS NULL
GROUP BY c.Country
ORDER BY NumberOfCustomers DESC

-- Looking at invoices

SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total,
       i.*
FROM   Invoice AS i
order by i.CustomerId;

SELECT 
    i.CustomerId,
    SUM(i.Total) As InvoiceTotal
FROM   Invoice AS i
group by i.CustomerId
order by i.CustomerId;


