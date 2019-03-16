#!/bin/bash
ansible-playbook -i inventory pb_Install_splunk_forwarder.yml &
ansible-playbook -i inventory pb_Install_splunk_Indexer.yml &