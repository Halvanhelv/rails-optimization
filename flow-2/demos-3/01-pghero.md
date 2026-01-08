# PgHero

## Installation options

Installation available via
- Rails Engine
- Docker
- Linux package

```bash
docker run -ti -e DATABASE_URL=postgres://spajic@host.docker.internal:5432/PracticalDeveloper_development -p 8080:8080 ankane/pghero
open localhost:8080
```

## Usage
PgHero itself offers instructions for its further configuration.

In particular, for query statistics, you need to add lines to the end of `/usr/local/var/postgres/postgresql.conf`:

```
shared_preload_libraries = 'pg_stat_statements'
pg_stat_statements.track = all
```
