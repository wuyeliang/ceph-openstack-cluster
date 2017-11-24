前提条件

部署openstack集群之前需要先部署ceph集群，具体参见
```
https://github.com/wuyeliang/auto-deploy-ceph-cluster
```


网络拓扑
controller节点和各个计算节点上先部署ceph集群（luminous），控制节点上运行相关管理服务，计算节点既是计算节点也是块存储节点，安装过程中自动配置glance、nova、cinder的ceph
```
     ------------+---------------------------+---------------------------+------------
                 |                           |                           |
             eth0|172.16.100.30          eth0|172.16.100.50          eth0|172.16.100.51
     +-----------+-----------+   +-----------+-----------+   +-----------+-----------+
     |    [ Control Node ]   |   |    [ Compute Node ]   |   |    [ Compute Node ]   |
     |                       |   |                       |   |                       |
     |  MariaDB    RabbitMQ  |   |        Libvirt        |   |        Libvirt        |
     |  Memcached  httpd     |   |        L2 Agent       |   |     Nova Compute      |
     |  Keystone   Glance    |   |        Nova Compute   |   |        ceph           |
     |  Nova API             |   |         ceph          |   |        L2 Agent       |
     |  Neutron Server       |   |                       |   |         ceph          |
     |       ceph            |   |                       |   |                       |
     +-----------------------+   +-----------------------+   +-----------------------+
     ------------+---------------------------+---------------------------+------------
                 |                           |                           |
             eth1|172.16.10.30           eth1|172.16.10.50           eth1|172.16.10.51
```
修改配置文件./config/hosts
写入各个主机的IP和主机名

修改配置文件./config/installrc

执行安装

```
./main.sh
```


相关视频
```
https://selfservicecloud.cn/nextcloud/index.php/s/yPdde86vNI3OjLC
```





