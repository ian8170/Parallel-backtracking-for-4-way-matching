#!/bin/bash

for file in $(ls *);
do
	for case in $(echo $file | grep "A" | grep "pafs");
	do
		IFS='.' read -a myarray <<< "$case"
		
		n=${myarray[0]}
		c=${myarray[1]}
		sqsub -r 1h -q mpi -n 50 -o output/$n.$c ../mpi.out 0 $n.$c.A.pafs.txt $n.$c.B.pafs.txt $n.$c.C.pafs.txt $n.$c.D.pafs.txt
	done;
done;