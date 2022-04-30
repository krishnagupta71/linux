#!/bin/bash
for ((counter=0;counter<=70;counter++))
do
        printf "For exit no $counter"
        cpuid -l 0X4ffffffd -s $counter
done
