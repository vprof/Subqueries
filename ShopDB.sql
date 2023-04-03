select 
    concat(c.FName, ' ', c.LName) as CustomerName,
    concat(e.FName, ' ', e.LName) as EmployeeName,
    od.TotalPrice as TotalOrderPrice
from
    orders o 
    join customers c on o.CustomerNo = c.CustomerNo 
    join employees e on o.EmployeeID = e.EmployeeID 
    join (
		select OrderID, sum(TotalPrice) as TotalPrice
        from orderdetails
        group by OrderID) od on o.OrderID = od.OrderID 
where
    od.TotalPrice > 1000