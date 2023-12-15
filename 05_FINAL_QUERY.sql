SELECT d.id,
       COUNT(t.id)         AS total_tasks_amount,
       SUM(t.story_points) AS total_story_points
FROM developers d
         LEFT JOIN tasks t ON d.id = t.developer_id AND created_at > '2023-01-01' AND created_at < '2023-02-01'
GROUP BY d.id
HAVING SUM(t.story_points) < 5
ORDER BY d.id;