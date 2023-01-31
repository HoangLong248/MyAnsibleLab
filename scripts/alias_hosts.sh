#!/bin/bash
webs=(192.168.33.12 192.168.33.13)
dbs=(192.168.33.14 192.168.33.15)

alias_web_host(){
    a=1
    for i in "${webs[@]}"
    do
        echo -e "$i web${a}" 
        a=$(expr $a + 1)
    done >> /etc/hosts
}

alias_db_host(){
    a=1
    for i in "${dbs[@]}"
    do
        echo -e "$i db${a}" 
        a=$(expr $a + 1)
    done >> /etc/hosts
}

alias_web_host
alias_db_host