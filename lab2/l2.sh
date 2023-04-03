#!/bin/bash
set -eu
if [ $# -ne 2 ]; then
    echo "You shall not pass"
    exit 1
fi

UNO=$(cd "${1}" && pwd)
DOS=$(cd "${2}" && pwd)

if [ ! -d "${UNO}" ]; then
    echo "Blad nie podales katalogu"
    exit 1
fi

if [ ! -d "${DOS}" ]; then
    echo "Blad nie podales katalogu"
    exit 1
fi


for FILE in "${UNO}"/*; do
  if [[ -f "${FILE}" ]]; then
    echo "Plik regularny: ${FILE}"
  elif [[ -d "${FILE}" ]]; then
    echo "Katalog: ${FILE}"
  elif [[ -L "${FILE}" ]]; then
    echo "Dowiązanie symboliczne: ${FILE}"
  else
    echo "Nieznany typ pliku: ${FILE}"
  fi
done

for FILE in "${UNO}"/*; do
  if [[ -f "${FILE}" ]] || [[ -d "${FILE}" ]]; then
    TODO=$(basename -- "${FILE}")
    ROZW="${TODO##*.}"
    if [[ -n "${ROZW}" ]]; then
        NEWSOMETHING=$(echo "${TODO}_ln.${ROZW}" | tr '[:lower:]' '[:upper:]')
    else
        NEWSOMETHING=$(echo "${TODO}_ln" | tr '[:lower:]' '[:upper:]')
    fi
    ln -s "${FILE}" "${DOS}/${NEWSOMETHING}"
  fi
done



