### 角色变量

```yml
---
# openvpn私有网段
private_network_segment: "10.251.1.0"
# openvpn服务端口
server_port: "33972"
# 客户端证书,此处为标识,可以理解为用户名
client_user_name: "exampleuser"

# 以下为服务端证书的信息
REQ_COUNTRY: 'CN'
REQ_PROVINCE: "GUANGDONG"
REQ_CITY: "GUANGZHOU"
REQ_ORG: "COMPANY"
REQ_EMAIL: "example@example.com"
REQ_OU: "COMPANY"
```

编译安装openvpn

`ansible-playbook -e 'client_user_name=username' openvpn.yml`

创建客户端证书

`ansible-playbook --tags add_client -e 'client_user_name=username' openvpn.yml`

吊销客户端证书

`ansible-playbook --tags revoke_client -e 'client_user_name=username' openvpn.yml`

> 此剧本默认使用iptables及开启转发，安装过程会保存iptables规则至`/etc/sysconfig/iptables`

### 配置文件

- 配置文件及证书路径`/etc/openvpn`
- 安装目录`/usr/local/openvpn`
- 日志目录`/var/log/openvpn`
- EasyRSA目录`/opt/ansible_work/EasyRSA-3.0.7`
- 服务脚本`/usr/lib/systemd/system/openvpn.service`

```shell
systemctl start openvpn
systemctl stop openvpn
```
