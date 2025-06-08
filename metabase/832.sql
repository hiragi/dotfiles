SELECT companies."Name",
       companies."CreatedAt",
       SUM(pc1.price) sumprice,
       COUNT(pc1.price),
       array_to_string(array_agg(pc1.price), ',')
FROM project_conversions pc1
INNER JOIN projects ON pc1.project_id = projects.id
INNER JOIN users ON projects.user_id = users."Id"
INNER JOIN companies ON users."CompanyId" = companies."Id"
WHERE pc1.price IS NOT NULL
AND pc1.deleted_at IS NULL
GROUP BY companies."Name", companies."CreatedAt"
ORDER BY sumprice DESC;
