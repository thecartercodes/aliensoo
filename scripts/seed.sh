#!/bin/bash

echo "You are about to perform a ${SEED_OPTION} seed against ${ENV}, are you sure you want to proceed?"

select yn in "Yes" "No"; do
    case $yn in
        Yes )
            if [ $SEED_OPTION == 'up' ]
            then
                for file in seeds/*.up.sql;
                do (cat "${file}"; echo) | PGPASSWORD=${PG_PASSWORD} psql -h ${PG_HOST} -U ${PG_USERNAME} -d ${PG_DBNAME} -p ${PG_PORT};
                done;
            elif [ $SEED_OPTION == 'down' ]
            then
                for file in seeds/*.down.sql
                do (cat "${file}"; echo) | PGPASSWORD=${PG_PASSWORD} psql -h ${PG_HOST} -U ${PG_USERNAME} -d ${PG_DBNAME} -p ${PG_PORT};
                done;
            else
                echo "Not a valid option passed to SEED_OPTION";
            fi
            exit
        ;;
        No ) exit
        ;;
    esac
done
