# Plan 

<img src="plan.png">

## application for this training 

<img src="app.png">

### app testing or deployment in bare-metal

<img src="bare.png">

### Introduction to virtualization 

<img src="vir.png">

### hypervisor more info

<img src="hy.png">

## understanding OS component 

<img src="os.png">

### VM vs COntainer 

<img src="vmcre.png">

### Containers 

<img src="cont.png">

### Intro to Docker 

<img src="docker.png">

### Understanding docker ce installation on windows 10 / mac os

<img src="install.png">

### Mac os Docker desktop download link

[download](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

### checking docker version 

```
fire@ashutoshhs-MacBook-Air  ~  docker  -v
Docker version 20.10.7, build f0df350

```

## Install docker in linux vm directly -- 

###  In stage / prod env for docker ce 

[link](https://docs.docker.com/engine/install/)

### installing 

```
[ec2-user@ip-172-31-18-96 ~]$ history 
    1  docker  -v
    2  sudo  yum install docker -y
    3  history 
[ec2-user@ip-172-31-18-96 ~]$ sudo systemctl start docker
[ec2-user@ip-172-31-18-96 ~]$ sudo systemctl enable docker
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /u
sr/lib/systemd/system/docker.service.

```
### Docker architecture in short way

<img src="docker11.png">

### to check docker engine 

```
[ashu@ip-172-31-18-96 ~]$ docker version 
Client:
 Version:           20.10.7
 API version:       1.41
 Go version:        go1.15.14
 Git commit:        f0df350
 Built:             Tue Aug 17 16:01:45 2021
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.7
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.15.14
  Git commit:       b0f5bc3
  Built:            Tue Aug 17 16:02:23 2021
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.4.6
  GitCommit:        d71fcd7d8303cbf684402823e425e9dd2e99285d
 runc:
  Version:          1.0.0
  GitCommit:        %runc_commit
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
  
  
```

### pulling image of python from docker hub 

```
[ashu@ip-172-31-18-96 ~]$ docker  pull  python
Using default tag: latest
latest: Pulling from library/python
df5590a8898b: Pull complete 
705bb4cb554e: Pull complete 
519df5fceacd: Pull complete 
ccc287cbeddc: Pull complete 
e3f8e6af58ed: Pull complete 
aebed27b2d86: Pull complete 
cbad01103bfe: Pull complete 
70d3792d870b: Pull complete 
98d95f720735: Pull complete 
Digest: sha256:b35af9960cf515d9ad0070a0c7981addd000298f0d39e82ea287f7060480c219
Status: Downloaded newer image for python:latest
docker.io/library/python:latest

```

### docker images present 

```
[ashu@ip-172-31-18-96 ~]$ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
openjdk       latest    98edbd09d5e6   4 days ago    471MB
oraclelinux   8.4       0e8cb31f3519   4 days ago    246MB
python        latest    6beb0d435def   5 days ago    911MB
alpine        latest    14119a10abf4   5 weeks ago   5.6MB
java          latest    d23bdf5b1b1b   4 years ago   643MB

```

### Container creation 

<img src="contcreate.png">

### list of running containers only 

```
[ashu@ip-172-31-18-96 ~]$ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED          STATUS          PORTS     NAMES
ed7ff936446e   alpine:latest   "ping localhost"   3 seconds ago    Up 2 seconds              sid123
7542a8d85ce0   alpine:latest   "ping localhost"   35 seconds ago   Up 34 seconds             rupa1
4a471d2277b8   alpine:latest   "ping localhost"   42 seconds ago   Up 41 seconds             ashuc1

```

### checking output of a running container 

```
  26  docker  logs  ashuc1 
   27  docker  logs  -f  ashuc1 
   
```

### stopping a container 

```
[ashu@ip-172-31-18-96 ~]$ docker  stop  ashuc1

```

### start container the same one 

```
[ashu@ip-172-31-18-96 ~]$ docker  start  ashuc1
ashuc1
[ashu@ip-172-31-18-96 ~]$ docker  ps
CONTAINER ID   IMAGE           COMMAND            CREATED         STATUS         PORTS     NAMES
c42625077265   alpine:latest   "ping localhost"   2 minutes ago   Up 2 minutes             shinic1
4a471d2277b8   alpine:latest   "ping localhost"   7 minutes ago   Up 1 second              ashuc1

```

### getting a shell of a container 

```
[ashu@ip-172-31-18-96 ~]$ docker  exec  -it  ashuc1  sh 
/ # 
/ # cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.14.2
PRETTY_NAME="Alpine Linux v3.14"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # ls  /
bin    etc    lib    mnt    proc   run    srv    tmp    var
dev    home   media  opt    root   sbin   sys    usr
/ # exit

```

### remove all the. containers

```
[ashu@ip-172-31-18-96 ~]$ docker  rm $(docker ps -aq) -f
c42625077265
f080192eb512
e3e240a1da93
8af20cbda80d
2496763181a6
8eeb3326c27f
d9d93ad7ec5e
2a2f8dbdd62e
d9c835731b9c
852085bf7937
ed7ff936446e
7542a8d85ce0
4a471d2277b8
ad5ff7a04b89

```

### docker image build 

<img src="build.png">

### building first docker image for python code

```
[ashu@ip-172-31-18-96 pythonapp]$ docker  build  -t  ashupython:v1   . 
Sending build context to Docker daemon  3.584kB
Step 1/6 : FROM python
 ---> 6beb0d435def
Step 2/6 : LABEL name=ashutoshh
 ---> Running in 6e5090dcfbd2
Removing intermediate container 6e5090dcfbd2
 ---> 928fb3e9ac68
Step 3/6 : LABEL email=ashutoshh@linux.com
 ---> Running in 983737aabdbc
Removing intermediate container 983737aabdbc
 ---> 18e35247dd96
Step 4/6 : RUN  mkdir  /mycode
 ---> Running in 4c935e18eca9
Removing intermediate container 4c935e18eca9
 ---> 5ebea5f79457
Step 5/6 : COPY  hello.py  /mycode/hel

```

### creating first container from the image

```
[ashu@ip-172-31-18-96 pythonapp]$ docker  run -itd  --name ashupyc111 ashupython:v1
66c56abb622276aa3130e3a15ad5a64070454ebf47658a67201dd4d1537bf54c
[ashu@ip-172-31-18-96 pythonapp]$ docker  ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS     NAMES
66c56abb6222   ashupython:v1   "python /mycode/hell…"   3 seconds ago    Up 2 seconds              ashupyc111
0133ec510db5   lohmitta:v1     "python /mycode/hell…"   30 seconds ago   Up 29 seconds             lohitC3
3a7724d10c9a   sidpython:v1    "python /shellcode/h…"   32 seconds ago   Up 32 seconds             sidpyc1

```

### checking output of python code running in a container 

```
docker  logs  -f  ashupyc111
```

### Resource consumption by python code container 

```
[ashu@ip-172-31-18-96 pythonapp]$ docker  stats ashupyc111 


CONTAINER ID   NAME         CPU %     MEM USAGE / LIMIT    MEM %     NET I/O     BLOCK I/O     PIDS
66c56abb6222   ashupyc111   0.00%     5.148MiB / 7.69GiB   0.07%     850B / 0B   0B / 17.9kB   1


78  docker  stats ashupyc111 
   79  docker  stats 

```


### forcefully stop all the containers 

```
[ashu@ip-172-31-18-96 pythonapp]$ docker  ps  -q
946be0a1e421
0144efdc5e29
524d6775c1db
6dbfdf08ff6a
2385999c20c4
02ed1f50163e
fbac2b7fb524
543c273d3d0f
c78d3727acf0
3a7724d10c9a
[ashu@ip-172-31-18-96 pythonapp]$ docker  kill  $(docker  ps  -q)
946be0a1e421
0144efdc5e29
524d6775c1db
2385999c20c4
02ed1f50163e
fbac2b7fb524
543c273d3d0f
c78d3727acf0
3a7724d10c9a

```

### more usefull commands

```
 92  docker  start $(docker  ps  -aq)
   93  docker  ps
   94  docker  kill  $(docker  ps  -q)
   95  docker  rm   $(docker  ps  -aq)
   
```

### docker build command 

```
docker  build -t  ashupython:v2  -f olpython.dockerfile   . 

```







