# Take dump(data included) of some PostgreSQL tables
pg_dump -U USER -h USER -t SCHEMA.TABLE1 -t SCHEMA.TABLE2 DB_NAME > dump.sql

# List users
SELECT * FROM pg_catalog.pg_user where usename ~ 'some-user';

# List DB connections for a user
select * from pg_catalog.pg_stat_activity where usename ~ 'someuser';
