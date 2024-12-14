--Ukupna prodaja po kupcu i godini(sortirano):
--Ovaj upit spaja tablicu factOrders s tablicama dimCustomer i dimDate 
--kako bi grupirao podatke o prodaji po kupcu i godini. Izračunava 
--ukupni iznos prodaje za svaku kombinaciju kupca i godine.
SELECT 
    c.FirstName,
    c.LastName,
    d.Year,
    SUM(f.TotalAmount) AS TotalSales
FROM 
    factOrders f
JOIN 
    dimCustomer c ON f.CustomerKey = c.CustomerKey
JOIN 
    dimDate d ON f.DateKey = d.DateKey
GROUP BY 
    c.FirstName, c.LastName, d.Year
ORDER BY 
    TotalSales DESC, c.LastName, c.FirstName, d.Year;


-- Ukupna prodaja po godini i mjesecu (sortirano):
-- Ovaj upit spaja tablicu factOrders s tablicom dimDate 
-- kako bi grupirao podatke o prodaji po godini i mjesecu. 
-- Izračunava ukupni iznos prodaje za svaku kombinaciju godine i mjeseca.
SELECT 
    d.Year,
    d.Month,
    SUM(f.TotalAmount) AS TotalSales
FROM 
    factOrders f
JOIN 
    dimDate d ON f.DateKey = d.DateKey
GROUP BY 
    d.Year, d.Month
ORDER BY 
    d.Year, d.Month;