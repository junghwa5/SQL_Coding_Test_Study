SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands AS w
    JOIN Wands_Property AS wp ON w.code = wp.code
WHERE wp.is_evil = 0
    AND w.coins_needed IN (
        SELECT MIN(w2.coins_needed)
        FROM Wands AS w2 
            JOIN Wands_Property AS wp2 ON w2.code = wp2.code
        WHERE w.code = w2.code AND w.power = w2.power)
ORDER BY w.power DESC, wp.age DESC;