-- Использование LEFT JOIN вместо JOIN:
-- Если мы хотим включить в результаты всех разработчиков, даже тех, кто не имеет задач после указанной даты,
-- следует использовать LEFT JOIN вместо JOIN.
-- Если же нас интересуют только разработчики с задачами в Январе, то текущее использование JOIN подходит.
-- Оптимизация JOIN с таблицей specialties: Текущий запрос соединяет таблицу specialties, но не использует данные из этой таблицы.
-- Если данные из таблицы specialties не нужны в результатах, этот JOIN следует убрать для уменьшения объема обрабатываемых данных.
-- Уточнение GROUP BY: В GROUP BY-клаузе скобки вокруг d.id не требуются.
SELECT d.id,
       COUNT(t.id)         AS total_tasks_amount,
       SUM(t.story_points) AS total_story_points
FROM developers d
         LEFT JOIN tasks t ON d.id = t.developer_id AND EXTRACT(MONTH FROM created_at) = 1
GROUP BY d.id
HAVING SUM(t.story_points) < 5
ORDER BY d.id;
