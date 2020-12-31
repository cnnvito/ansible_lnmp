#!/bin/bash

ROOT_PASSWD=`openssl rand -base64 15`

echo ${ROOT_PASSWD} > /root/mysql_root

MYSQL_BIN="/usr/local/mysql/bin/mysql -uroot -p${ROOT_PASSWD}"
/usr/local/mysql/bin/mysqladmin -u root password "${ROOT_PASSWD}"

#sql语句:
${MYSQL_BIN} -e "UPDATE mysql.user SET authentication_string=PASSWORD('${ROOT_PASSWD}') WHERE User='root';"
${MYSQL_BIN} -e "DELETE FROM mysql.user WHERE User='';"
${MYSQL_BIN} -e "DROP USER ''@'%';"
${MYSQL_BIN} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
${MYSQL_BIN} -e "DROP DATABASE test;"
${MYSQL_BIN} -e "FLUSH PRIVILEGES"
