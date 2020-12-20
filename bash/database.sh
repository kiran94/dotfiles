# For local development, we aren't too worried about password
# Postgres

export PGHOST=localhost
export PGPORT=5432
export PGUSER=postgres
export PGPASSWORD=password
# export PGDATABASE=

# Mongo
export MONGO_USERNAME=root
export MONGO_PASSWORD=password

# Redis
export Redis__Hosts__0__Host=localhost
export Redis__Hosts__0__Port=6379

# ElasticSearch
export ElasticSearch__Url=http://localhost:9200/
