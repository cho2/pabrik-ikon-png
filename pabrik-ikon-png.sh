#!/bin/bash
icon[0]='actions'
icon[1]='apps'
icon[2]='categories'
icon[3]='devices'
icon[4]='emblems'
icon[5]='extras'
icon[6]='mimetypes'
icon[7]='places'
icon[8]='status'
icon[9]='stock'

size[0]='16'
size[1]='22'
size[2]='24'
size[3]='32'
size[4]='48'
size[5]='64'
size[6]='96'
jumlah=0
pwd=$('pwd')
for i in 0 1 2 3 4 5 6 7 8 9
do
cd ${icon[i]}/
for x in 0 1 2 3 4 5 6
do
rm -rf ${size[x]}
mkdir ${size[x]}
cd scalable/
SAVEIF=$IFS
IFS=$(echo -en "\n\b")
for file in $(ls *svg)
do
  name=${file%%.svg}
  inkscape $name.svg --export-png=$name.png --export-height=${size[x]} --export-width=${size[x]}
  mv $name.png $pwd/${icon[i]}/${size[x]}/
  jumlah=$((jumlah+1))
done
cd $pwd/${icon[i]}/
done
cd $pwd
done
rm -rf 16 22 24 32 48 64 96
echo "Done. $jumlah icons was generated."
