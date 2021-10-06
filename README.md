# Plan 

<img src="plan.png">

### Docker network prune 

```
[ashu@ip-172-31-18-96 myimages]$ docker  network  prune 
WARNING! This will remove all custom networks not used by at least one container.
Are you sure you want to continue? [y/N] y
Deleted Networks:
ashubrx1
rahulbrx1
chandrabrx2
shinibrx2
chandrabrx1
yagneshbrx1
sidbrx1
shinikrishnabrx2
shinibrx1
mohitbrx1
rajibrx1

```

## Storage concept in Docker 

<img src="st.png">

### COnfigure external storage drive to Docker engine 

### attaching and formatting storage to VM 

```
[root@ip-172-31-18-96 ~]# lsblk 
NAME          MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
nvme0n1       259:0    0  100G  0 disk 
├─nvme0n1p1   259:1    0  100G  0 part /
└─nvme0n1p128 259:2    0    1M  0 part 
nvme1n1       259:3    0  500G  0 disk 
[root@ip-172-31-18-96 ~]# 
[root@ip-172-31-18-96 ~]# 
[root@ip-172-31-18-96 ~]# mkfs.xfs   /dev/nvme1n1  
meta-data=/dev/nvme1n1           isize=512    agcount=4, agsize=32768000 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=0
data     =                       bsize=4096   blocks=131072000, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=64000, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0

```

### attaching storage to a directory 

```
 mkdir   /ashu/oracleDE -p 
[root@ip-172-31-18-96 ~]# 
[root@ip-172-31-18-96 ~]# mount  /dev/nvme1n1  /ashu/oracleDE/

```

### configuring Docker engine to use storage 

```
[root@ip-172-31-18-96 sysconfig]# ls
acpid       cpupower        irqbalance  network-scripts  rpc-rquotad  sysstat
atd         crond           keyboard    nfs              rsyncd       sysstat.ioconf
authconfig  docker          man-db      raid-check       rsyslog
chronyd     docker-storage  modules     rdisc            run-parts
clock       i18n            netconsole  readonly-root    selinux
console     init            network     rpcbind          sshd
[root@ip-172-31-18-96 sysconfig]# cat  docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=32768:65536 -g  /ashu/oracleDE "

```

### restarting docker engine 

```
 systemctl daemon-reload 
[root@ip-172-31-18-96 sysconfig]# systemctl restart docker

```
### Sync data from Old location to new 

```
 58  rsync -av  /var/lib/docker/  /ashu/oracleDE/
   59  systemctl restart docker 
   
```

### make sure you entry in /etc/fstab about new storage mount 

