#!/bin/bash

# Power
p_ini=1.0	
p_end=1.0
p_inc=0.1

# Temperature
t_ini=0.8
t_end=2.0
t_inc=0.1

# Density
d_ini=0.30
d_end=0.65
d_inc=0.05

# Other data
energy=1.0
output="out"

power=`seq -f"%.2f" $p_ini $p_inc $p_end`
temper=`seq -f"%.2f" $t_ini $t_inc $t_end`
density=`seq -f"%.2f" $d_ini $d_inc $d_end`

if [[ $# != 2 ]]; then
   echo "ERROR! You have to introduce the name of the test and the file to read"
   exit
fi

# Preparation of the environment
cd $1
file_o=${2}.${1}.out2

rm -f $file_o
for p in $power; do
   for t in $temper; do
      for d in $density; do
          test="${p}_${t}_${d}"
          echo "file ${2}_${p}_${t}_${d}  to $file_o"
          aux=`sed -ne "3,3p;3q" <  ${2}_${p}_${t}_${d}`
          aux=`echo -e "${p}\t${t}\t${d}\t${energy}\t"$aux` 
          echo $aux >> $file_o
      done
   done
done

# Ending
cd ..

echo "     "
echo "DONE."

