#!/bin/bash -eu

set -eu

if [ $# -ne 1 ]; then
  echo "You shall not pass"
  exit 1
fi

DIR=$(cd "${1}" && pwd)

if [ ! -d "${DIR}" ]; then
  echo "${DIR} nie jest katalogiem lub nie istnieje"
  exit 1
fi


find "${DIR}" -type f -name '*.bak' -exec chmod go-w {} \;

find "${DIR}" -type d -name '*.bak' -exec chmod go=rx {} \;

find "${DIR}" -type d -name '*.tmp' -exec chmod o+rwx {} \;

find "${DIR}" -type f -name '*.txt' -exec chmod 241 {} \;
