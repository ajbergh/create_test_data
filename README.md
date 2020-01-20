<h1><strong>Create Test Data Script</strong></h1>
<hr />
<h4><br />Linux bash script that allows creation of unique data test files for NAS backup testing.</h4>
<p>This script uses the dd linux command to create files with random uncrompressible data.</p>
<p><br /><strong>Usage:</strong> create_test_data.sh &lt;Count of Top Directories&gt; &lt;Count of Sub Dirs in Each Top Dir&gt; &lt;Number of Files in Each Dir&gt;</p>
<p><br /><strong>Example usage:</strong> create_test_data.sh 5 10 10 </p>
<p>This would create 5 top level dirs and 10 sub dirs in each top level directory and 10 files in each directory.</p>
<p><br />Notes: This script requires GNU Parallel in be installed "apt-get install parallel"</p>
<p><span class="pl-c">To change the size of the files, change the "bs=" line in the script . Example: bs=5K will make a 5KB sized file.</span></p>
<p>&nbsp;</p>
