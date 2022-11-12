#!/usr/bin/env python3

from re import S
import psycopg2
import sys

q = sys.argv[1]

def f(username):
    print('Constructed Query from string interpolation')
    return f"""SELECT * FROM dag WHERE dag_id = '{username}' """

print(f(q))

# Only for testing, never put your DB Password in codebase.
with psycopg2.connect(
        host='localhost',
        database='airflow',
        port='5432',
        user='postgres',
        password='postgres',
        connect_timeout=15 # 15 sec for connection timeout
    ) as connection:

    connection.set_session(autocommit=True)

    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM dag WHERE dag_id = %(placeholder)s", {'placeholder':q})
        print('Constructed query by psycopg2')
        print(cursor.query.decode('utf-8'))
        r = cursor.fetchall()

        print(r)
