SELECT h.hacker_id, h.name, COUNT(*) AS challenges_created
FROM Hackers AS h
    JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenges_created = (
    SELECT MAX(ch1.cnt)
    FROM(
        SELECT COUNT(*) AS cnt
        FROM Challenges
        GROUP BY hacker_id) AS ch1)
    OR challenges_created IN (
    SELECT ch2.cnt
    FROM (SELECT hacker_id, COUNT(*) AS cnt
         FROM Challenges
         GROUP BY hacker_id) AS ch2
    GROUP BY ch2.cnt
    HAVING COUNT(*) = 1)
ORDER BY challenges_created DESC, h.hacker_id ASC;