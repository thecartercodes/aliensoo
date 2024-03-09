db-shell:
	psql -U ${PG_USERNAME} -h ${PG_HOST} \
	-p ${PG_PORT} -d ${PG_DBNAME}

db-up:
	docker compose -f docker-compose-local.yml up -d

migrate: scripts/migrate.sh
	PG_HOST=${PG_HOST} \
	PG_USERNAME=${PG_USERNAME} \
	PG_PORT=${PG_PORT} \
	PG_DBNAME=${PG_DBNAME} \
	PG_PASSWORD=${PG_PASSWORD} \
	MIGRATE_OPTION=up ENV=local scripts/migrate.sh	

migrate-down: scripts/migrate.sh
	PG_HOST=${PG_HOST} \
	PG_USERNAME=${PG_USERNAME} \
	PG_PORT=${PG_PORT} \
	PG_DBNAME=${PG_DBNAME} \
	PG_PASSWORD=${PG_PASSWORD} \
	MIGRATE_OPTION=down ENV=local scripts/migrate.sh

seed: scripts/seed.sh
	PG_HOST=${PG_HOST} \
	PG_USERNAME=${PG_USERNAME} \
	PG_PORT=${PG_PORT} \
	PG_DBNAME=${PG_DBNAME} \
	PG_PASSWORD=${PG_PASSWORD} \
	SEED_OPTION=up ENV=local scripts/seed.sh
