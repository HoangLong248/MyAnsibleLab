#!/bin/bash
hosts=(192.168.33.12 192.168.33.13 192.168.33.14 192.168.33.15)
a=1
for i in "${hosts[@]}"
do
    echo -e "$i centos${a}" 
    a=$(expr $a + 1)
done > /etc/hosts