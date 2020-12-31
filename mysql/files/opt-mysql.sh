#!/bin/bash

MemTotal=`free -m | grep Mem | awk '{print  $2}'`

if [[ ${MemTotal} -gt 1024 && ${MemTotal} -lt 2048 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 32M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 128#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 768K#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 768K#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 8M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 16#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 16M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 32M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 128M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 32M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 1000#" /etc/my.cnf
elif [[ ${MemTotal} -ge 2048 && ${MemTotal} -lt 4096 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 64M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 256#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 1M#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 1M#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 16M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 32#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 32M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 64M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 256M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 64M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 2000#" /etc/my.cnf
elif [[ ${MemTotal} -ge 4096 && ${MemTotal} -lt 8192 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 128M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 512#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 2M#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 2M#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 32M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 64#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 64M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 64M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 512M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 128M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 4000#" /etc/my.cnf
elif [[ ${MemTotal} -ge 8192 && ${MemTotal} -lt 16384 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 256M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 1024#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 4M#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 4M#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 64M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 128#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 128M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 128M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 1024M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 256M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 6000#" /etc/my.cnf
elif [[ ${MemTotal} -ge 16384 && ${MemTotal} -lt 32768 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 512M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 2048#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 8M#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 8M#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 128M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 256#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 256M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 256M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 2048M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 512M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 8000#" /etc/my.cnf
elif [[ ${MemTotal} -ge 32768 ]]; then
    sed -i "s#^key_buffer_size.*#key_buffer_size = 1024M#" /etc/my.cnf
    sed -i "s#^table_open_cache.*#table_open_cache = 4096#" /etc/my.cnf
    sed -i "s#^sort_buffer_size.*#sort_buffer_size = 16M#" /etc/my.cnf
    sed -i "s#^read_buffer_size.*#read_buffer_size = 16M#" /etc/my.cnf
    sed -i "s#^myisam_sort_buffer_size.*#myisam_sort_buffer_size = 256M#" /etc/my.cnf
    sed -i "s#^thread_cache_size.*#thread_cache_size = 512#" /etc/my.cnf
    sed -i "s#^query_cache_size.*#query_cache_size = 512M#" /etc/my.cnf
    sed -i "s#^tmp_table_size.*#tmp_table_size = 512M#" /etc/my.cnf
    sed -i "s#^innodb_buffer_pool_size.*#innodb_buffer_pool_size = 4096M#" /etc/my.cnf
    sed -i "s#^innodb_log_file_size.*#innodb_log_file_size = 1024M#" /etc/my.cnf
    sed -i "s#^performance_schema_max_table_instances.*#performance_schema_max_table_instances = 10000#" /etc/my.cnf
fi
