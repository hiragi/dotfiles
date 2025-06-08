SELECT
  projects.slug,
  project_type,
  'https://erp.mitsu-ri.net/projects/ordered/' || projects.slug || '?tab=summary',
  projects.created_at,
  projects.updated_at
FROM erp.projects
LEFT JOIN erp.products ON products.project_id = erp.projects.id
LEFT JOIN erp.product_processes ON product_processes.product_id = products.id
LEFT JOIN erp.master_processes ON product_processes.master_process_id = master_processes.id
WHERE project_type <> 'quotes'
AND projects.company_id = 4
AND projects.id
    NOT IN (SELECT projects.id
            FROM erp.projects
            LEFT JOIN erp.products ON products.project_id = projects.id
            LEFT JOIN erp.product_processes ON product_processes.product_id = products.id
            LEFT JOIN erp.master_processes ON product_processes.master_process_id = master_processes.id
            WHERE project_type <> 'quotes'
            AND product_processes.id IS NOT NULL)
ORDER BY projects.id DESC
