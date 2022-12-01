SELECT IF(g.Grade > 7, s.Name, NULL), g.Grade, s.Marks
FROM Students as s 
    JOIN Grades as g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name ASC;