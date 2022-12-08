SELECT h.hacker_id, h.name, SUM(s.max_score) AS sum_score
FROM Hackers AS h
    JOIN (SELECT hacker_id, challenge_id, MAX(score) AS max_score
          FROM Submissions
          GROUP BY hacker_id, challenge_id) AS s
    ON h.hacker_id = s.hacker_id
WHERE s.max_score != 0
GROUP BY h.hacker_id, h.name
ORDER BY sum_score DESC, h.hacker_id ASC;