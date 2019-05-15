# nutaq_configurations

#catm1_launch_script
This python script creats SSH connection and run script on remote linux system (Nutaq). Script load Cat-m1 netwok on nutaq and unload netwok and close SSH connection after the execution time ends, given in parameters.

It is parameterized script, following are the parameters
host name
user name
password
mme_port
enb_port
executionTime (In minutes)
Run script: E.g Python catm1_nutaq_tcs.py 1.1.1.1 test test 98880 98881 10