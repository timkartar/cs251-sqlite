#!/bin/bash
seq 150 >> core_mems.csv
sed 's/$/,/g' core_mems.csv > temp
rm core_mems.csv
cat temp
