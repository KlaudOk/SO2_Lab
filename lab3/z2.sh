#!/bin/bash
#Z pliku yolo.csv wypisz wszystkich ktorych id jest liczba nieparzysta. Wyniki zapisz na stderr
grep -E '^[0-9]*[13579],.*' yolo.csv | 1>&2 

#Z pliku yolo.csv wypisz kazdy numer ip, ktory w 1 i 2 oktecie ma po jednej cyfrze. Wyniki zapisz na stderr
cut -d ',' -f6 yolo.csv | grep -E '^[0-9]\.[0-9]\..*' | 1>&2
