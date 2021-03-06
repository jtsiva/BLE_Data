#!/bin/bash

folder=$1
echo $folder

if [ ! -d intermediates/$(basename "$folder") ]; then
  mkdir ./intermediates/$(basename "$folder")
fi

for filename in $folder*.zip; do
	echo $(basename $filename .zip)
	sed -n '/DUMP OF SERVICE bluetooth_manager:/,/---/p' $filename > intermediates/$(basename "$folder")/$(basename "$filename" .zip)_bt.txt
done
