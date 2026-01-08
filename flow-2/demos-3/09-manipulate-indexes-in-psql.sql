# psql
# \q - exit
# \x - extended expanded display
# \d - display list of tables
# \d+ - with additional information
# \d table - describe table
# \d+ table - describe table with additional information
# \timing - time and show operation duration
# \l - list of databases
# \l+ - list of databases with additional information
# \e - open editor for convenient query editing
# \? - help
# \h - help with Postgres commands
# \h alter table - help with alter table, for example

CREATE TABLE experiments(
 id serial PRIMARY KEY,
 model VARCHAR (50),
 cents INTEGER,
 broken BOOLEAN
);

SELECT
(CASE (random() * 2)::INTEGER
 WHEN 0 THEN 'Iphone-'
 WHEN 1 THEN 'Xiaomi-'
 WHEN 2 THEN 'Nexus-'
END) || (random() * 100000000)::INTEGER model,
(random() * 1000000)::INTEGER price,
(CASE ((10*random())::INTEGER)
 when 0 then true
 else false
END) broken
 FROM generate_series(1, 6) AS rows;

# ~5 seconds per 1M records
INSERT INTO experiments (model, cents, broken)
SELECT
(CASE (random() * 2)::INTEGER
 WHEN 0 THEN 'Iphone-'
 WHEN 1 THEN 'Xiaomi-'
 WHEN 2 THEN 'Nexus-'
END) || (random() * 100000000)::INTEGER model,
(random() * 1000000)::INTEGER price,
(CASE ((10*random())::INTEGER)
 when 0 then true
 else false
END) broken
 FROM generate_series(1, 1000000) AS rows;

Delete from experiments;

select * from experiments
where broken = false and cents < 500 order by cents asc;

create index on experiments (cents ASC);
create index on experiments (broken);

-- \di+ experiments_broken_idx;
--                                    List of relations
--  Schema |          Name          | Type  | Owner  |    Table    |  Size  | Description
-- --------+------------------------+-------+--------+-------------+--------+-------------
--  public | experiments_broken_idx | index | spajic | experiments | 103 MB |
-- (1 row)

-- PracticalDeveloper_development=# \di+ experiments_cents_idx;
--                                   List of relations
--  Schema |         Name          | Type  | Owner  |    Table    |  Size  | Description
-- --------+-----------------------+-------+--------+-------------+--------+-------------
--  public | experiments_cents_idx | index | spajic | experiments | 108 MB |

# >10 seconds per 1M records
INSERT INTO experiments (model, cents, broken)
SELECT
(CASE (random() * 2)::INTEGER
 WHEN 0 THEN 'Iphone-'
 WHEN 1 THEN 'Xiaomi-'
 WHEN 2 THEN 'Nexus-'
END) || (random() * 100000000)::INTEGER model,
(random() * 1000000)::INTEGER price,
(CASE ((10*random())::INTEGER)
 when 0 then true
 else false
END) broken
 FROM generate_series(1, 1000000) AS rows;
