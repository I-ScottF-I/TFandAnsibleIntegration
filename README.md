Quick example showing a couple of ways to pass TF vars into

The playbooks and main.tf dont do anything apart from create a file on the localhost.

Execute the main.tf using terraform apply to first create a file with the test variable. Then the .tf file will initiate an execute of the ansible-playbok passing in the extra vars.

Once the file is created the ansible-playbook can be run without the extra vars and will read the variable from the file created as part of the terraform apply.
