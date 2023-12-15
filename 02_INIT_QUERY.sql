SELECT d.id,
       COUNT(t.id)         AS total_tasks_amount,
       SUM(t.story_points) AS total_story_points
FROM developers d
         JOIN tasks t on d.id = t.developer_id
         JOIN specialties s on s.id = d.specialty_id
WHERE EXTRACT(MONTH FROM created_at) = 1
GROUP BY (d.id)
HAVING SUM(t.story_points) < 5
ORDER BY d.last_name;
