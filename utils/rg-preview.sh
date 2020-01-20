#!/bin/bash

com="$@"
IFS=':' read -ra ADDR <<< "$com"
file_name="${ADDR[0]}"
line=${ADDR[1]}
begin=$((${ADDR[1]} - 4))
end=$((${ADDR[1]} + 15))
[[ $begin -le 1 ]] && begin=1 || begin=$begin

bat --color=always -H "$line" --line-range "$begin:$end" "$file_name"
