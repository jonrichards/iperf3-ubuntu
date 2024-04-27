#!/usr/bin/env bash

# Update the package list
apt update > /dev/null 2>&1

# Check the version of iperf3 available
available_version=$(apt-cache madison iperf3 | awk '{print $3}')
echo $available_version
