#!/bin/bash

SOURCE_DIR=${1:-lab_uno};
RM_LIST=${2:-2remove};
TARGET_DIR=${3:-bakap};

if [[ ! -d ${TARGET_DIR} ]]; then
    echo "Tworze ${TARGET_DIR}";
    mkdir ${TARGET_DIR}
fi

FILES_TO_REMOVE=$(cat ${RM_LIST})

for FILE in ${FILES_TO_REMOVE}; do

    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        rm -r ${SOURCE_DIR}/${FILE}
    fi

done

for SOMETHING in ${SOURCE_DIR}/*; do

    if [[ -f ${SOMETHING} ]]; then
        mv ${SOMETHING} ${TARGET_DIR}
    elif [[ -d ${SOMETHING} ]]; then
        cp -r ${SOMETHING} ${TARGET_DIR}
    fi

done

COUNT_THE_LAST_OF_THEM=$(find ${SOURCE_DIR} -type f | wc -l);

if [[ ${COUNT_THE_LAST_OF_THEM} -gt 0 ]]; then

    echo "jeszcze cos zostalo!";
    if [[ ${COUNT_THE_LAST_OF_THEM} -ge 2 ]]; then

        echo "zostaly co najmniej 2 pliki";
        if [[ ${COUNT_THE_LAST_OF_THEM} -gt 4 ]]; then

            echo "zostalo wiecej niz 4 pliki";
        else

            echo "Nie wiecej niz 4, ale co najmniej 2 sa";
        fi
    fi
else

    echo "tu byl Kononowicz";
fi

zip -r bakap_$(date +%Y-%m-%d).zip ${TARGET_DIR};