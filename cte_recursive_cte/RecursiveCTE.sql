WITH cte_name AS (
    -- Base query: Start with Admin.
    SELECT user_name, user_email
    FROM users
    WHERE user_role = 'Admin'

    UNION ALL

    -- Recursive query: Find all users managed by the current level.
    SELECT u.user_name, u.user_email
    FROM users u
    INNER JOIN cte_name cte ON u.manager_email = cte.user_email
)

-- Final query to get the hierarchy.
SELECT * FROM cte_name;
