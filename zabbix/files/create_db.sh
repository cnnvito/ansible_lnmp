#!/bin/bash

DB_PASSWD=$(cat /root/mysql_root)
ANSIBLE_WORK_DIR='/opt/ansible_work'

MYSQL_BIN="/usr/local/mysql/bin/mysql -uroot -p${DB_PASSWD} -hlocalhost"

server() {
    ${MYSQL_BIN} -e "create database zabbix character set utf8 collate utf8_bin;"
    ${MYSQL_BIN} -e "create user 'zabbix'@'localhost' identified by '${ZABBIX_PWD}';"
    ${MYSQL_BIN} -e "grant all privileges on zabbix.* to 'zabbix'@'localhost';"
    ${MYSQL_BIN} -e "flush privileges;"

    cd ${ANSIBLE_WORK_DIR}/zabbix-5.0.2/database/mysql && \
    ${MYSQL_BIN} zabbix < schema.sql && \
    ${MYSQL_BIN} zabbix < images.sql && \
    ${MYSQL_BIN} zabbix < data.sql
}

proxy() {
    ${MYSQL_BIN} -e "create database zabbix_proxy character set utf8 collate utf8_bin;"
    ${MYSQL_BIN} -e "create user 'zabbix'@'localhost' identified by '${ZABBIX_PWD}';"
    ${MYSQL_BIN} -e "grant all privileges on zabbix_proxy.* to 'zabbix'@'localhost';"
    ${MYSQL_BIN} -e "flush privileges;"

    cd ${ANSIBLE_WORK_DIR}/zabbix-5.0.2/database/mysql && \
    ${MYSQL_BIN} zabbix_proxy < schema.sql
}

if [ -z $1 ]; then
    exit 1
else
    ZABBIX_PWD=$2
    $1 ${ZABBIX_PWD}
fi
