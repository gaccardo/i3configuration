#!/bin/bash

ansible-playbook -i hosts -e "hosts=10.5.0.62" fish_installer/my_prompt.yml
