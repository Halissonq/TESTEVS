#! /bin/bash

LINHA="/srv/infra/scripts_infra/postgresql/backup/backup_fisico_postgres.sh --type completo --rhost vm1932 --host 127.0.0.1 --porta 5432 --dirdata /opt/PostgreSQL/13/ferramentas/data --dirdestino /backup/data/backup_fisico/producao --label vm577_pg13_ferramentas --remote --compres"


USUARIO=$(echo $LINHA | awk -F ' ' '{print $1}')

COMANDO=$(echo $LINHA | awk -F ' ' '{print $2}')

PARAMETRO=""
N=3
FIMINTERACAO=0
while [ $FIMINTERACAO -eq 0 ]; do
        ELEMENTO=$(echo $LINHA | awk -F ' ' "{print \$${N}}")
        if [ "$ELEMENTO" == ">" ] || [ "$ELEMENTO" == ">>" ] || [ "$ELEMENTO" == "2>" ] || [ "$ELEMENTO" == ""] || [ "$ELEMENTO" == ""]S;then
                FIMINTERACAO=1
        else
                PARAMETRO=$PARAMETRO" "$ELEMENTO
        fi
  ((N++))
 # Incrementa o contador
done

echo $PARAMETRO