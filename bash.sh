#!/bin/bash

# Caminho para o arquivo crontab
CRON_FILE="/etc/crontab"  # Pode ser alterado para o arquivo desejado, como /var/spool/cron/crontabs/usuário

# Verifica se o arquivo crontab existe
if [[ ! -f "$CRON_FILE" ]]; then
  echo "Arquivo crontab não encontrado: $CRON_FILE"
  exit 1
fi

# Lê o arquivo linha por linha
while IFS= read -r line; do
  # Ignora linhas vazias e comentários
  if [[ "$line" =~ ^#.* || -z "$line" ]]; then
    continue
  fi

  # Separa os campos: minuto, hora, dia, mês, dia da semana, comando
  minute=$(echo "$line" | awk '{print $1}')
  hour=$(echo "$line" | awk '{print $2}')
  day=$(echo "$line" | awk '{print $3}')
  month=$(echo "$line" | awk '{print $4}')
  weekday=$(echo "$line" | awk '{print $5}')
  command=$(echo "$line" | awk '{for(i=6;i<=NF;i++) printf "%s ", $i; print ""}')

  # Exibe os campos de forma estruturada
  echo "Minuto: $minute"
  echo "Hora: $hour"
  echo "Dia do mês: $day"
  echo "Mês: $month"
  echo "Dia da semana: $weekday"
  echo "Comando: $command"
  echo "------------------------"
done < "$CRON_FILE"