SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         --c.FirstName + ' ' + c.LastName AS CustomerName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
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
    SUM(i.Total) As InvoiceTotal,
    COUNT(*) AS NumberOfInvoices
FROM   Invoice AS i
group by i.CustomerId
order by i.CustomerId;






SELECT   i.CustomerId,
         c.FirstName,
         c.LastName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
         SUM(i.Total) AS InvoiceTotal,
         COUNT(*) AS NumberOfInvoices
FROM     Invoice AS i
         LEFT JOIN
         Customer AS c
         ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName, CONCAT(c.FirstName, ' ', c.LastName)
ORDER BY i.CustomerId;


-- alternative way of invoices by custonmer
SELECT 
    c.CustomerId,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    SUM(i.Total) AS InvoiceTotal,
    COUNT(*) AS NumberOfInvoices
FROM   Invoice AS i
    INNER JOIN Customer AS c
    ON i.CustomerId = c.CustomerId
    INNER JOIN Employee AS e
    ON c.SupportRepId = e.EmployeeId
GROUP BY c.CustomerId,
      c.FirstName,
      c.LastName,
      e.FirstName,
      e.LastName


--     customers and employees

SELECT e.EmployeeId,
--       e.FirstName,
--       e.LastName,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM   Employee AS e JOIN Customer c ON e.EmployeeId = c.SupportRepId
