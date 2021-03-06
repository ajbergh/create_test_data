#!/bin/bash
#########################################################################################
#	        		Veeam Create Test Data Script				#
#			        (c)2019 adam.bergh@veeam.com				#
#   	Usage: create_test_data.sh <Top Dirs> <Sub Dirs> <Files per Dir> 		#
#	This script requires GNU Parallel in be installed "apt-get install parallel"	#
#											#
#											#
#											#
#########################################################################################

if [ -z $1 ] || [ -z $3 ]
then
	echo "create_test_data.sh (c) 2019 Veeam Software adam.bergh@veeam.com"
	echo ""
	echo "Usage: create_test_data.sh <Count of Top Directories> <Count of Sub Dirs in Each Top Dir> <Number of Files in Each Dir>"
	echo "Example: create_test_data.sh 5 10 10"
	echo "This would create 5 top level dirs and 10 sub dirs in each top level directory and 10 files in each directory"
	exit
fi



rootdirs=$1
subdirs=$2
numfiles=$3
#filesize=$4


echo "You are about to create $rootdirs top level directories with $subdirs sub-directories in each one."
echo "Each folder will contain $numfiles files - Is this correct?"
read -p "Press [Enter] key to start, otherwise hit ctrl+c..."

echo "Starting data creation at $(date +%y/%m/%d) at $(date +%H:%M:%S). Please Wait...."

#Capture Start Time of Copy
start=`date +%s`

string1=""



####THIS LOOP CREATES NESTED DIRECTORY TREE######
for (( n=1; n<=$rootdirs; n++ ))
do
string1=""
string2=""

string2="folder$n-1"

	
	for (( p=2; p<=$subdirs; p++ ))
	do
		string1="folder$n-$p"
		string2=$string2\/$string1
	done

#echo $string2
mkdir -p $string2


done
################################################

find . -type d > dirs.txt #put directory tree into a text file for use in the below loop

#CREATE SMALL FILES ##################################
#To change the size of the files, change the bs= in the below command. Example: bs=5K will make a 5KB sized file.
while read dir;
do
	seq -w 0 $numfiles | parallel dd if=/dev/urandom of=$dir\/file{}.dat bs=5K count=1
done <dirs.txt
###########################################################






#Capture end time of script
end=`date +%s`
runtime=$((end-start))

echo "#########################################################################################"
echo "Done! Script finished at $(date +%y/%m/%d) at $(date +%H:%M:%S) - Thanks for using Veeam!"
echo "It took $runtime seconds to complete this job"
echo "#########################################################################################"
