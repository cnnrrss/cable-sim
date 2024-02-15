#!/bin/bash

# run-loop.sh
cd /home/ns3-debug/ns-3.41 || exit;

while true; do
  ./ns3 run first
  sleep 1
done