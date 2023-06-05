---
published: false
---

```
SELECT
  CONCAT( 'SELECT * FROM ', `table`, ' WHERE ', `column`, ' IN (123, 234);' ) AS query
FROM
  (
    SELECT
      TABLE_NAME AS `table`,
      COLUMN_NAME AS `column`,
      COLUMN_TYPE AS `type`,
      IS_NULLABLE AS `null`,
      COLLATION_NAME AS `collation`,
      CHARACTER_SET_NAME AS `character_set`,
      COLUMN_KEY AS `key`,
      EXTRA AS `extra`,
      ORDINAL_POSITION AS sort
    FROM
      information_schema.columns 
    WHERE
      TABLE_SCHEMA = 'moodle' 
      -- and TABLE_NAME = 'Your_tablename'
      AND COLUMN_NAME LIKE '%user%'
  ) AS tables
ORDER BY
  `table` ASC,
  `sort` ASC;
```

