SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N, ROUND(
        PERCENT_RANK() OVER (
            ORDER BY LAT_N
        ), 4) AS P
    FROM STATION ) AS S
WHERE P = 0.5;