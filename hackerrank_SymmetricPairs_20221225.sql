SELECT f1.X, f1.Y
FROM Functions f1
    JOIN Functions f2 ON f1.X = f2.Y AND f1.Y = f2.X AND f1.X <= f1.Y
GROUP BY f1.X, f1.Y
HAVING f1.X != f1.Y OR COUNT(f1.X) > 1
ORDER BY f1.X ASC;