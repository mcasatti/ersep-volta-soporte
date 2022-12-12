UNDEFINE owner

SET PAGES 0

SET LINES 300

SET HEADING OFF

SPOOL "C:\Dev\qwe123.sql"

SELECT
    'drop table '
    || owner
    || '.'
    || table_name
    || ' cascade constraints purge;'
FROM
    dba_tables
WHERE
    owner = upper('&&owner')
UNION ALL
SELECT
    'drop '
    || object_type
    || ' '
    || owner
    || '.'
    || object_name
    || ';'
FROM
    dba_objects
WHERE
    object_type NOT IN (
        'TABLE',
        'INDEX',
        'PACKAGE BODY',
        'TRIGGER',
        'LOB'
    )
    AND   object_type NOT LIKE '%LINK%'
    AND   object_type NOT LIKE '%PARTITION%'
    AND   owner = upper('&&owner')
ORDER BY
    1;

SPOOL OFF
/* @"C:\Dev\qwe123.sql" */
PROMPT Count of Objects =

SELECT
    object_type,
    COUNT(*)
FROM
    dba_objects
WHERE
    owner = upper('&&owner')
GROUP BY
    object_type;