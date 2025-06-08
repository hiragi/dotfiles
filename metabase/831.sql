SELECT companies."Name",
       SUM(project_conversions.price),
       COUNT(project_conversions) AS cnt
FROM project_conversions
INNER JOIN projects ON project_conversions.project_id = projects.id
INNER JOIN users ON projects.user_id = users."Id"
INNER JOIN companies ON users."CompanyId" = companies."Id"
WHERE price IS NOT NULL
AND project_conversions.deleted_at IS NULL
GROUP BY companies."Name"
ORDER BY cnt DESC;
