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