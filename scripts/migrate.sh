#!/bin/bash

echo "You are about to perform a ${MIGRATE_OPTION} migration against ${ENV}, are you sure you want to proceed?"

select yn in "Yes" "No"; do
    case $yn in
        Yes )
            if [ $MIGRATE_OPTION == 'up' ]
            then
                for file in migrations/*.up.sql;
                do (cat "${file}"; echo) | PGPASSWORD=${PG_PASSWORD} psql -h ${PG_HOST} -U ${PG_USERNAME} -d ${PG_DBNAME} -p ${PG_PORT};
                done;
            elif [ $MIGRATE_OPTION == 'down' ]
            then
                for file in migrations/*.down.sql
                do (cat "${file}"; echo) | PGPASSWORD=${PG_PASSWORD} psql -h ${PG_HOST} -U ${PG_USERNAME} -d ${PG_DBNAME} -p ${PG_PORT};
                done;
            else
                echo "Not a valid option passed to MIGRATE_OPTION";
            fi
            exit
        ;;
        No ) exit
        ;;
    esac
done