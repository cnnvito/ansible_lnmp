#!/bin/bash

CONF_PATH=/usr/local/php/etc/php-fpm.conf

MemTotal=`free -m | grep Mem | awk '{print  $2}'`

if [[ ${MemTotal} -gt 1024 && ${MemTotal} -le 2048 ]]; then
    sed -i "s#pm.max_children.*#pm.max_children = 20#" ${CONF_PATH}
    sed -i "s#pm.start_servers.*#pm.start_servers = 10#" ${CONF_PATH}
    sed -i "s#pm.min_spare_servers.*#pm.min_spare_servers = 10#" ${CONF_PATH}
    sed -i "s#pm.max_spare_servers.*#pm.max_spare_servers = 20#" ${CONF_PATH}
elif [[ ${MemTotal} -gt 2048 && ${MemTotal} -le 4096 ]]; then
    sed -i "s#pm.max_children.*#pm.max_children = 40#" ${CONF_PATH}
    sed -i "s#pm.start_servers.*#pm.start_servers = 20#" ${CONF_PATH}
    sed -i "s#pm.min_spare_servers.*#pm.min_spare_servers = 20#" ${CONF_PATH}
    sed -i "s#pm.max_spare_servers.*#pm.max_spare_servers = 40#" ${CONF_PATH}
elif [[ ${MemTotal} -gt 4096 && ${MemTotal} -le 8192 ]]; then
    sed -i "s#pm.max_children.*#pm.max_children = 60#" ${CONF_PATH}
    sed -i "s#pm.start_servers.*#pm.start_servers = 30#" ${CONF_PATH}
    sed -i "s#pm.min_spare_servers.*#pm.min_spare_servers = 30#" ${CONF_PATH}
    sed -i "s#pm.max_spare_servers.*#pm.max_spare_servers = 60#" ${CONF_PATH}
elif [[ ${MemTotal} -gt 8192 ]]; then
    sed -i "s#pm.max_children.*#pm.max_children = 80#" ${CONF_PATH}
    sed -i "s#pm.start_servers.*#pm.start_servers = 40#" ${CONF_PATH}
    sed -i "s#pm.min_spare_servers.*#pm.min_spare_servers = 40#" ${CONF_PATH}
    sed -i "s#pm.max_spare_servers.*#pm.max_spare_servers = 80#" ${CONF_PATH}
fi
