SELECT s.Name
FROM Friends f
    JOIN Students s ON f.ID = s.ID
    JOIN Packages p1 ON f.ID = p1.ID
    JOIN Packages p2 ON f.Friend_ID = p2.ID
WHERE p1.Salary < p2.Salary
ORDER BY p2.Salary;