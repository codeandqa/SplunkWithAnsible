
  

# Installation Of Splunk Indexer And Forwarder Using Ansible

## Introduction:
This purpose of this repo is to install Splunk Indexer on one host and forwarder on another (along with web app). To achieve this in isolated environment, this repo will  install three VMs.

TBD: There are few steps you need to do manually for now. Once I get time, I will automate them.

## Prereq:

Following Items Should Be Installed On Your Machine(I Am Using Mac )

1. Virtualbox Has Been Installed In Your Machine. (Https://Www.Virtualbox.Org/)

2. Install Vagrant. (https://www.vagrantup.com/intro/getting-started/install.html)

## Idea:
![alt tag](https://github.com/codeandqa/SplunkWithAnsible/blob/master/SplukServer.png)
## Steps:

###### Step 1
Clone this repo in your desired working folder.

    git clone git@github.com:codeandqa/SplunkWithAnsible.git
    cd /SplunkWithAnsible
###### Step 2
  Run vagrant command to get all VMs.
      

    vagrant up
   
   You will get follwing three VMs,

	Ansible Server; (acs)
	Splunk Forwarder. (django)
	Splunk Indexer. (splunk)
###### Step 3
   (Note: this may take few minutes ~10)

SSH to acs machine.
     vagrant ssh acs

###### Step 4
Generate ssh key and connect to both servers, Indexer and forwarder.

     ssh-keygen -t rsa
     cat ~/.ssh/id_rsa.pub | ssh vagrant@192.168.10.51 'cat >> .ssh/authorized_keys'
     cat ~/.ssh/id_rsa.pub | ssh vagrant@192.168.10.52 'cat >> .ssh/authorized_keys'
     

###### Step 5
Once you are connected, ansible server will be able to authenticate with no password prompt.
###### Step 6
Go to temp folder and clone same repo there as git already intalled in acs machine.
    cd /tmp/
    git clone git@github.com:codeandqa/SplunkWithAnsible.git 
    
###### Step 7
Go to the cloned folder to run playbook.

    cd SplunkWithAnsible/AnsibleSetup
    ./playsetup.sh

###### Step 8
That will run two playbooks, one for Splunk(x.x.x.51) and another of Splunk Forwarder(x.x.x.52) in parallel. It will install and start splunk servers. 

###### Step 9
Open `127.0.0.1:8000` in host machine browser.


    User: admin,
    Password: Password1!

###### Step 10
Happy Splunking!!!

# Want to make this repo better?
I am not ansible or splunk guru so you may find some erros or missing best practices. I am going to refactor it and clean the code slowly. If you think that you can improve this code more cleaner and better, feel free to contrubute. 
