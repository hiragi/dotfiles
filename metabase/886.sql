SELECT
  projects.slug,
  project_type,
  'https://erp.mitsu-ri.net/projects/ordered/' || projects.slug || '?tab=summary',
  projects.created_at,
  projects.updated_at
FROM erp.projects
LEFT JOIN erp.products ON products.project_id = erp.projects.id
LEFT JOIN erp.product_processes ON product_processes.product_id = products.id
LEFT JOIN erp.master_clients ON product_processes.master_client_id = master_clients.id
LEFT JOIN erp.documents ON erp.documents.project_id = erp.projects.id
WHERE project_type <> 'quotes'
AND projects.company_id = 4
AND erp.documents.id
    NOT IN (SELECT erp.documents.id
            FROM erp.projects
            LEFT JOIN erp.products ON products.project_id = erp.projects.id
            LEFT JOIN erp.product_processes ON product_processes.product_id = products.id
            LEFT JOIN erp.master_clients ON product_processes.master_client_id = master_clients.id
            LEFT JOIN erp.documents ON erp.documents.project_id = erp.projects.id
            WHERE project_type <> 'quotes'
            AND erp.documents.document_type = 'order'
            AND projects.company_id = 4)
AND master_clients.id IS NOT NULL
ORDER BY projects.id DESC
