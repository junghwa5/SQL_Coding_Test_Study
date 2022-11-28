SELECT c.company_code, c.founder, COUNT(DISTINCT(l.lead_manager_code)), COUNT(DISTINCT(s.senior_manager_code)), COUNT(DISTINCT(m.manager_code)), COUNT(DISTINCT(e.employee_code))
FROM Company as c
    JOIN Lead_Manager as l ON c.company_code = l.company_code
    JOIN Senior_Manager as s ON l.lead_manager_code = s.lead_manager_code
    JOIN Manager as m ON s.senior_manager_code = m.senior_manager_code
    JOIN Employee as e ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;