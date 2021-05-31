#!/bin/bash

[ -n "$BASH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && `echo $BASH_SOURCE`
[ -n "$ZSH_VERSION" ] && [ -n "$DOTFILES_DEBUG" ] && echo "$0"

# For local development, we aren't too worried about password
# Postgres

export PGHOST=localhost
export PGPORT=5432
export PGUSER=postgres
export PGPASSWORD=password
# export PGDATABASE=
export PGPASSFILE=$HOME/.config/psql/.pgpass

# Mongo
export MONGO_USERNAME=root
export MONGO_PASSWORD=password

# Redis
export Redis__Hosts__0__Host=localhost
export Redis__Hosts__0__Port=6379

# ElasticSearch
export ElasticSearch__Url=http://localhost:9200/
