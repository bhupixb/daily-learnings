<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

### Table of Contents
- [Usage:](#usage)
    * [Take dump(data included) of PostgresSQL table(s):](#take-dumpdata-included-of-postgressql-tables)

<!-- TOC end -->

<!-- TOC --><a name="usage"></a>
### Usage:

<!-- TOC --><a name="take-dumpdata-included-of-postgressql-tables"></a>
#### Take dump(data included) of PostgresSQL table(s):
```shell
pg_dump -U USER -h USER -t SCHEMA.TABLE1 -t SCHEMA.TABLE2 DB_NAME > dump.sql
```
