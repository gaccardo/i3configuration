#!/bin/bash

ansible-playbook -i hosts -e "hosts=vms" fish_installer/my_prompt.yml
