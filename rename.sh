#! /bin/bash

echo -n Please enter absolute path of folder:
read folderpath
echo Please choose rename mode:
echo "<1> test"
echo "<2> rename"
echo -n "1 or 2:"
read mode
echo Path is \""$folderpath"\"
cd $folderpath
filenum=`ls |wc -l`
echo Num of files is $filenum
i=1
for file in $folderpath/*
do
	filename=${file#${folderpath}/}
	newfilename=$i
	if [ $i -lt 10 ]
	then
		newfilename=0$i
	fi
	newfilename=$newfilename.mkv
	echo -n $filename
	echo -n "    >>    "
	if [ $mode = "2" ]
	then
		echo -n $newfilename
		mv $filename $newfilename
		echo  " (done)"
	else
		echo $newfilename
	fi
	i=$[$i+1]
done
