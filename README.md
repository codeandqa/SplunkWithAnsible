# Installation Of Splunk Indexer And Forwarder Using Ansible

Current Project Will Install Following Vms.
1. Ansible Server
2. Webserver With Splunk Forwarder
3. Splunk Indexer To Index Data Coming From Webserver.


## Prereq: 
Following Items Should Be Installed On Your Machine(I Am Using Mac )
1. Virtualbox Has Been Installed In Your Machine. (Https://Www.Virtualbox.Org/)
2. Install Vagrant.

## Steps:
- Close Repo In Your Machine.
- Go To The Terminal And Navigate To The Cloned Folder.
- Run Command:
`vagrant Up`
	It Will Install Three VMs,
	1. Asc: Ansible Server To Run Ansible Scripts.
	2. Splunk: Splunk Indexer.
	3. Web: Web Server And Splunk Forwarder.
- ssh to ansible server by:
`vagrant ssh asc`
- go to the folder where we have ansbile script.
`cd /tmp/ansible`
- run ansible playbook to install Splunk indexer on 'splunk' vm. 
`ansible-playbook playbook.yml i inventory`
- This will install Splunk on another VM 'splunk' and start on port 8000.
- Open browser in host machine and open `http://127.0.0.1:8000`.

# Installation for webserver and splunk indexer is coming soon. 

# Stay Tuned
