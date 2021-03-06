#!/bin/bash

INI_PATH=/usr/local/php/etc/php.ini

sed -i 's/post_max_size =.*/post_max_size = 50M/g' ${INI_PATH}
sed -i 's/upload_max_filesize =.*/upload_max_filesize = 50M/g' ${INI_PATH}
sed -i 's/;date.timezone =.*/date.timezone = PRC/g' ${INI_PATH}
sed -i 's/short_open_tag =.*/short_open_tag = On/g' ${INI_PATH}
sed -i 's/;cgi.fix_pathinfo=.*/cgi.fix_pathinfo=0/g' ${INI_PATH}
sed -i 's/max_execution_time =.*/max_execution_time = 300/g' ${INI_PATH}
sed -i 's/disable_functions =.*/disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,popen,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server/g' ${INI_PATH}

