#!/bin/bash
nc localhost 7634 | sed 's/|//m' | sed 's/||/\n/g' | grep $1 | awk -F'|' '{print $3}'
