<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

### Table of Contents
- [Usage:](#usage)
    * [List Users:](#list-users)
    * [List DB Connections for a User:](#list-db-connections-for-a-user)

<!-- TOC end -->

<!-- TOC --><a name="usage"></a>
### Usage:

<!-- TOC --><a name="list-users"></a>
#### List Users:
```sql
SELECT * FROM pg_catalog.pg_user where usename ~ 'some-user';
```

<!-- TOC --><a name="list-db-connections-for-a-user"></a>
#### List DB Connections for a User:
```sql
select * from pg_catalog.pg_stat_activity where usename ~ 'someuser';
```

<!-- TOC --><a name="print-psql-queries"></a>
#### Print SQL query ran by a psql cmd:
When connecting to a database using psql, use flag -E. 
```bash
$ psql -E postgresql://postgres:postgres@localhost:5432/postgres
psql (14.9 (Homebrew), server 14.1)
Type "help" for help.

postgres=# \dt
********* QUERY **********
SELECT n.nspname as "Schema",
  c.relname as "Name",
  CASE c.relkind WHEN 'r' THEN 'table' WHEN 'v' THEN 'view' WHEN 'm' THEN 'materialized view' WHEN 'i' THEN 'index' WHEN 'S' THEN 'sequence' WHEN 's' THEN 'special' WHEN 't' THEN 'TOAST table' WHEN 'f' THEN 'foreign table' WHEN 'p' THEN 'partitioned table' WHEN 'I' THEN 'partitioned index' END as "Type",
  pg_catalog.pg_get_userbyid(c.relowner) as "Owner"
FROM pg_catalog.pg_class c
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
     LEFT JOIN pg_catalog.pg_am am ON am.oid = c.relam
WHERE c.relkind IN ('r','p','')
      AND n.nspname <> 'pg_catalog'
      AND n.nspname !~ '^pg_toast'
      AND n.nspname <> 'information_schema'
  AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 1,2;
**************************
```
#### Live and dead tuples

```sql
SELECT 
  relname AS table_name, 
  n_live_tup AS live_rows, 
  n_dead_tup AS dead_rows 
FROM 
  pg_stat_user_tables 
WHERE 
  relname = 'TABLE_NAME_HERE';
```

#### Vaccuum time

```sql
SELECT 
  relname AS table_name, 
  last_vacuum, 
  last_autovacuum 
FROM 
  pg_stat_user_tables 
WHERE 
  relname = 'TABLE_NAME_HERE';
```

#### Query to List Idle or Idle in Transaction Queries

```sql
SELECT
    pid,
    usename AS user_name,
    datname AS database_name,
    state,
    now() - xact_start AS transaction_duration,
    backend_xmin AS xmin_snapshot,
    wait_event,query
FROM
    pg_stat_activity
WHERE
    state IN ('active', 'idle in transaction');
```

#### Query to Monitor Index Creation Progress

```sql
SELECT 
    relname AS table_name,
    indexrelname AS index_name,
    phase,
    tuples_done,
    tuples_total,
    ROUND(100.0 * tuples_done / GREATEST(tuples_total, 1), 2) AS progress_percentage
FROM 
    pg_stat_progress_create_index
WHERE indexrelname = 'INDEX_NAME_HERE'
ORDER BY 
    progress_percentage DESC;
```
