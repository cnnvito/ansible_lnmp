#### 主机清单

```ini
[zabbix_server]
192.168.1.10 hostname=zabbix_server.lan
[zabbix_proxy]
192.168.1.20 hostname=zabbix.proxy.lan
[zabbix_agent]
192.168.1.1 hostname=zabbix_agent1.lan
192.168.1.2 hostname=zabbix_agent2.lan
192.168.1.3 hostname=zabbix_agent3.lan
192.168.1.4 hostname=zabbix_agent4.lan
[zabbix:children]
zabbix_server
zabbix_proxy
zabbix_agent
```

### Roles

```yaml
---
- hosts: zabbix_server
  remote_user: root
  roles:
  - {role: 'zabbix', zabbix_role: 'server', ZABBIX_NGINX_DOAMIN: 'zabbix.example.com', IPTABLES_RULE: false}

# 此为第二个yaml文件,安装proxy需要指定标签
- hosts: zabbix_proxy
  remote_user: root
  roles:
  - {role: 'zabbix' zabbix_role: 'proxy', IPTABLES_RULE: false, ZABBIX_SERVER_IP: '192.168.1.100'}
```

`ansible-playbook zabbix.yml`  *安装zabbix-server*

`ansible-playbook zabbix.yml --tags install_proxy`   *安装zabbix-proxy需要指定标签*

### 角色变量

```yaml
---
# zabbix角色，server/proxy
zabbix_role: 'server'
# web目录
nginx_web_dir: '/data/web'
# nginx配置文件路径
nginx_web_conf: '/usr/local/nginx/conf/vhost'
# zabbix
zabbix_web_dir: '{{ nginx_web_dir }}/zabbix'

# 当zabbix角色为proxy,此变量为server端地址
ZABBIX_SERVER_IP: '192.168.1.10'
# server端主机名
ZABBIX_SERVER_HOSTNAME: 'zabbix-server'
# zabbix为server时,nginx的server_name值
ZABBIX_NGINX_DOAMIN: "localhost"

# 放行白名单，可以是proxy的ip，也可以是agent的ip,根据自己的架构填入,默认不添加,添加则改为true
IPTABLES_RULE: false
WHITE_LIST:
  - 192.168.1.1
  - 192.168.1.2
  - 192.168.1.3
  - 192.168.1.4
```

### 注意事项

- 确保Mysql，PHP，Nginx已安装

- 编译安装版本zabbix-5.0.2
- zabbix-agent为主动模式
- web路径`/data/web/zabbix`
- 导入数据库脚本`zabbix/files/create_db.sh`，root密码需要存放于`/root/mysql_root`
- 生成zabbix数据库用户密码存放于ansible控制端`/data/zabbix`
- 若需要使用iptables放行agent端口，则生成自定义链`ZABBIX_CHAIN`

### 安装路径

- 配置文件路径`/etc/zabbix/zabbix_server.conf`
- 服务脚本`/usr/lib/systemd/system/zabbix_server.service`
- 安装路径`/usr/local/zabbix`
- Nginx日志`/var/log/nginx/zabbix-access.log`
- Zabbix日志`/var/log/zabbix/zabbix_server.log`

### Zabbix启动方式

```bash
systemctl start zabbix_server zabbix_agent zabbix_proxy
systemctl stop zabbix_server zabbix_agent zabbix_proxy
```
