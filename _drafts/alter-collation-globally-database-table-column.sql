SELECT * FROM information_schema.SCHEMATA 
WHERE SCHEMA_NAME = "defaultdb";

SELECT TABLE_SCHEMA 
    , TABLE_NAME 
    , COLUMN_NAME 
    , COLLATION_NAME 
FROM INFORMATION_SCHEMA.COLUMNS;

SELECT character_set_name FROM information_schema.`COLUMNS` 
WHERE table_schema = "defaultdb";

SELECT * FROM information_schema.SCHEMATA LIMIT 20;


SELECT CONCAT("ALTER TABLE ", TABLE_SCHEMA, '.', TABLE_NAME," COLLATE utf8mb4_unicode_ci;") AS    ExecuteTheString
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA="defaultdb"
AND TABLE_TYPE="BASE TABLE";

-- -----------------------

SET @new_collation = 'utf8mb4_unicode_ci';
SET @new_character_set = 'utf8mb4';
SET @db_name = 'defaultdb';

-- Get collation for database, both work
-- https://dev.mysql.com/doc/refman/8.0/en/charset-database.html#:~:text=To%20see%20the%20default%20character,SELECT%20DEFAULT_CHARACTER_SET_NAME%2C%20DEFAULT_COLLATION_NAME%20FROM%20INFORMATION_SCHEMA.

USE defaultdb;
SELECT @@character_set_database, @@collation_database;

SELECT 
	DEFAULT_CHARACTER_SET_NAME, 
	DEFAULT_COLLATION_NAME
FROM 
	INFORMATION_SCHEMA.SCHEMATA 
WHERE 
	SCHEMA_NAME = @db_name;

-- get collation for tables
-- https://stackoverflow.com/questions/4948356/query-to-show-all-tables-and-their-collation
-- https://stackoverflow.com/questions/10859966/how-to-convert-all-tables-in-database-to-one-collation

SELECT
	TABLE_CATALOG,
	TABLE_SCHEMA,
	TABLE_NAME,
	TABLE_COLLATION
FROM
	INFORMATION_SCHEMA.TABLES 
WHERE 
	TABLE_SCHEMA = @db_name 
	AND TABLE_TYPE = 'BASE TABLE'  -- exclude 'VIEW' and 'SYSTEM VIEW'
	-- Get only collation that does not match the new collation
	-- AND TABLE_COLLATION != @new_collation
ORDER BY
	TABLE_NAME ASC
	;
	
-- get queries to alter collation for tables

-- TODO: add character set to the alter command using @new_character_set

-- ALTER TABLE AcademicYear CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

SELECT 
	-- change collation value for table
	-- CONCAT( 'ALTER TABLE ', TABLE_SCHEMA, '.', TABLE_NAME, ' COLLATE ', @new_collation, ';' ) AS query
	-- change table collation and convert all columns
	CONCAT( 'ALTER TABLE ', TABLE_SCHEMA, '.', TABLE_NAME, ' CONVERT TO CHARACTER SET ', @new_character_set,' COLLATE ', @new_collation, ';' ) AS query
FROM 
	INFORMATION_SCHEMA.TABLES
WHERE 
	TABLE_SCHEMA = @db_name
	AND TABLE_TYPE = 'BASE TABLE'
	-- Get only collation that does not match the new collation
	-- AND TABLE_COLLATION != @new_collation
ORDER BY
	TABLE_NAME ASC;



-- get collation for columns

SELECT
    c.TABLE_NAME,
    c.COLUMN_NAME,
	c.COLUMN_NAME,
	c.COLUMN_TYPE,
	COLLATION_NAME
FROM 
	INFORMATION_SCHEMA.COLUMNS as c
LEFT JOIN INFORMATION_SCHEMA.TABLES as t
    ON c.TABLE_NAME = t.TABLE_NAME
WHERE
	c.COLLATION_NAME is not null
    AND c.TABLE_SCHEMA = @db_name
    AND t.TABLE_TYPE = 'BASE TABLE'
    -- Get only collation that does not match the new collation
    AND c.COLLATION_NAME != @new_collation
ORDER BY
	c.TABLE_NAME,
	c.COLUMN_NAME;

-- get queries to alter collation for columns

SELECT
    CONCAT('ALTER TABLE ', c.TABLE_NAME, ' CHANGE ', c.COLUMN_NAME, ' ', c.COLUMN_NAME, ' ', c.COLUMN_TYPE, ' CHARACTER SET ', @new_character_set, ' COLLATE ', @new_collation, ';') as queries
FROM
	INFORMATION_SCHEMA.COLUMNS as c
LEFT JOIN INFORMATION_SCHEMA.TABLES as t
    ON c.TABLE_NAME = t.TABLE_NAME
WHERE
	c.COLLATION_NAME is not null
    AND c.TABLE_SCHEMA = @db_name
    AND t.TABLE_TYPE = 'BASE TABLE'
    -- Get only collation that does not match the new collation
    AND c.COLLATION_NAME != @new_collation
ORDER BY
	c.TABLE_NAME,
	c.COLUMN_NAME;


