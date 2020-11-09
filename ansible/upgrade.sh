#!/bin/bash

ansible-playbook -i hosts -e "hosts=starfleet" upgrade.yml
