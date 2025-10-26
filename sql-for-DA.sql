SHOW TABLES;
SELECT * FROM products;
SELECT* FROM users;
SELECT * FROM orders;
SELECT u.*, o.*
FROM users u
INNER JOIN orders o ON u.UserID = o.OrderUserID;
DESCRIBE users;
DESCRIBE orders;
SELECT *
FROM users
WHERE UserCity = 'Mumbai'
LIMIT 10;
SELECT u.UserID, u.UserFirstName, u.UserLastName, SUM(o.OrderAmount) AS TotalSpent
FROM users u
JOIN orders o ON u.UserID = o.OrderUserID
GROUP BY u.UserID, u.UserFirstName, u.UserLastName
ORDER BY TotalSpent DESC
LIMIT 5;
SELECT u.UserID, u.UserFirstName, u.UserLastName, o.OrderID, o.OrderAmount
FROM users u
INNER JOIN orders o ON u.UserID = o.OrderUserID;
SELECT u.UserID, u.UserFirstName, u.UserLastName, o.OrderID, o.OrderAmount
FROM users u
LEFT JOIN orders o ON u.UserID = o.OrderUserID;
SELECT u.UserID, u.UserFirstName, SUM(o.OrderAmount) AS total_spent
FROM users u
JOIN orders o ON u.UserID = o.OrderUserID
GROUP BY u.UserID
HAVING total_spent > (SELECT AVG(OrderAmount) FROM orders);
SELECT AVG(OrderAmount) AS avg_order_amount FROM orders;
SELECT SUM(OrderAmount) AS total_sales_2025
FROM orders
WHERE YEAR(OrderDate) = 2025;
CREATE VIEW top_customers AS
SELECT u.UserID, u.UserFirstName, SUM(o.OrderAmount) AS total_spent
FROM users u
JOIN orders o ON u.UserID = o.OrderUserID
GROUP BY u.UserID, u.UserFirstName
ORDER BY total_spent DESC
LIMIT 10;
SELECT u.UserID, u.UserFirstName, o.OrderID
FROM orders o
RIGHT JOIN users u ON u.UserID = o.OrderUserID;
SELECT u.UserID, u.UserFirstName, SUM(o.OrderAmount) AS total_spent
FROM users u
JOIN orders o ON u.UserID = o.OrderUserID
GROUP BY u.UserID
HAVING total_spent > (SELECT AVG(OrderAmount) FROM orders);
