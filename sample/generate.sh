#!/bin/bash

dos2unix exp.csv

echo -ne "\n" >> exp.csv

for month in 1 3 6 12; do
	echo -e "date\tclose" > ROBOR${month}M.tsv
done

tac exp.csv | head -n -6 | cut -d "," -f1,13 | sed -r 's/([0-9]+)\/([0-9]+)\/([0-9]+),(.*)/\1-\2-\3\t\4/' >> ROBOR1M.tsv
tac exp.csv | head -n -6 | cut -d "," -f1,14 | sed -r 's/([0-9]+)\/([0-9]+)\/([0-9]+),(.*)/\1-\2-\3\t\4/' >> ROBOR3M.tsv
tac exp.csv | head -n -6 | cut -d "," -f1,15 | sed -r 's/([0-9]+)\/([0-9]+)\/([0-9]+),(.*)/\1-\2-\3\t\4/' >> ROBOR6M.tsv
tac exp.csv | head -n -6 | cut -d "," -f1,17 | sed -r 's/([0-9]+)\/([0-9]+)\/([0-9]+),(.*)/\1-\2-\3\t\4/' >> ROBOR12M.tsv
