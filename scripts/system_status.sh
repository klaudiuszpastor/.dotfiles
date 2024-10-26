#!/bin/bash

cpu_usage() {
    echo "$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5); printf "%.1f%", usage}')"
}

#ram_usage() {
#    total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')
#    available_mem=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
#    
#    used_mem=$((total_mem - available_mem))
#    used_mem_gb=$(awk "BEGIN {printf \"%.1f\", $used_mem/1024/1024}")
#    total_mem_gb=$(awk "BEGIN {printf \"%.2f\", $total_mem/1024/1024}")
#    echo "$used_mem_gb/$total_mem_gb MEM"
#}

echo "$(cpu_usage)" 

