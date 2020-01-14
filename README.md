# create_test_data
Veeam Create Test Data Script	
Bash script that allows creation of test for NAS backup testing.


Veeam Create Test Data Script				
(c)2019 adam.bergh@veeam.com


Usage: create_test_data.sh <Count of Top Directories> <Count of Sub Dirs in Each Top Dir> <Number of Files in Each Dir>
Example: "create_test_data.sh 5 10 10"
This would create 5 top level dirs and 10 sub dirs in each top level directory and 10 files in each directory
<br>
This script requires GNU Parallel in be installed "apt-get install parallel"	
