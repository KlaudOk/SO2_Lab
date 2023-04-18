#!/bin/bash

for FILE in groovies/*; do
  sed -i 's|$HEADER$|/temat/|g' "$FILE"
done


for FILE in groovies/*; do
  sed -i '/Help docs:/d' "$FILE"
done