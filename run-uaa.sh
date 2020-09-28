docker run -d \
    --name uaa-db \
    -e POSTGRES_PASSWORD=password \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v ~/data:/var/lib/postgresql/data \
    postgres

docker run -d \
    --link uaa-db:db \
    -e DB_ENV_PASS=password \
    -p 8080:8080 \
    -v uaa:/uaa:rw hortonworks/cloudbreak-uaa:2.7.1