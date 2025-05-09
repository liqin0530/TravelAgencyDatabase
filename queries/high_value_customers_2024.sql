SELECT c.CustomerID, c.CustName, c.CustGender, c.CustContact, c.CustEmail, SUM(p.PayPrice) AS TotalSpent
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
JOIN Payment p ON b.BookingID = p.BookingID
JOIN Batch ba ON b.BatchID = ba.BatchID
JOIN Package pa ON ba.PackageID = pa.PackageID
WHERE pa.Language = 'English'  
    AND (p.PaymentDate BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD'))
GROUP BY c.CustomerID, c.CustName, c.CustGender, c.CustContact, c.CustEmail
HAVING SUM(p.PayPrice) > 2000
