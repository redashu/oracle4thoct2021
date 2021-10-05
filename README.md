# Plan 

<img src="plan.png">

## day1 revision 

<img src="rev1.png">

##  Docker client to docker engine connection cases

<img src="de1.png">

### building java code into docker image

```
ashu@ip-172-31-18-96 myimages]$ cd  javacode/
[ashu@ip-172-31-18-96 javacode]$ ls
Dockerfile  oracle.java
[ashu@ip-172-31-18-96 javacode]$ docker  build  -t   ashujava:codev1  .  
Sending build context to Docker daemon  3.072kB
Step 1/7 : FROM openjdk
 ---> 98edbd09d5e6
Step 2/7 : label email=ashutoshh@linux.com
 ---> Running in 10e2922a16ff
Removing intermediate container 10e2922a16ff
 ---> 4dd491a4c7d1
Step 3/7 : RUN mkdir  /myapp
 ---> Running in 2c8b4d76c3ee
Removing intermediate container 2c8b4d76c3ee
 ---> 7a126d0ef74a
Step 4/7 : COPY oracle.java /myapp/oracle.java
 ---> 7ba91b6ef440
Step 5/7 : WORKDIR  /myapp
 ---> Running in 1f3139ca1e07
Removing intermediate container 1f3139ca1e07
 ---> f412884e2e6b
Step 6/7 : RUN  javac  oracle.java
 ---> Running in e6ec53998d66
Removing intermediate container e6ec53998d66
 ---> b9f6c126eb04
Step 7/7 : CMD ["java","myclass"]
 ---> Running in 814cc784fe20
Removing intermediate container 814cc784fe20
 ---> 353576edaf4e
Successfully built 353576edaf4e
Successfully tagged ashujava:codev1

```

### creating container 

```
[ashu@ip-172-31-18-96 javacode]$ docker  run -it -d  --name ashujc1  ashujava:codev1 
5b938631ff6046461ecebf54bfaf9d7b835f723f900435722a7292134860fd5c
[ashu@ip-172-31-18-96 javacode]$ docker  ps
CONTAINER ID   IMAGE              COMMAND          CREATED              STATUS              PORTS     NAMES
5b938631ff60   ashujava:codev1    "java myclass"   12 seconds ago       Up 8 seconds                  ashujc1

```

### checking container logs

```
docker logs -f ashujc1

```

### clearning up 

```
[ashu@ip-172-31-18-96 javacode]$ docker  stop  ashujc1
ashujc1
[ashu@ip-172-31-18-96 javacode]$ docker  rm  ashujc1
ashujc1

```

### installing jdk 8 in OL 8.3 

### searching software name 

<img src="soft.png">

### build is done 

```
[ashu@ip-172-31-18-96 javacode]$ ls
Dockerfile  jdk8.dockerfile  oracle.java
[ashu@ip-172-31-18-96 javacode]$ docker  build -t  ashujava:jdk8  -f  jdk8.dockerfile   . 
Sending build context to Docker daemon  4.608kB
Step 1/8 : from oraclelinux:8.3
 ---> 816d99f0bbe8
Step 2/8 : LABEL email="ashutoshh@linux.com"
 ---> Using cache
 ---> 03c902b73188
Step 3/8 : RUN  yum install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64  -y
 ---> Using cache
 ---> 69ee4bd954be
Step 4/8 : RUN mkdir /hello
 ---> Running in e8ed83d979ff
Removing intermediate container e8ed83d979ff
 ---> a4991db1e629
Step 5/8 : ADD oracle.java /hello/
 ---> a10947082131
Step 6/8 : WORKDIR /hello
 ---> Running in 7b413cdbc07a
Removing intermediate container 7b413cdbc07a
 ---> 5f6501753fc8
Step 7/8 : RUN javac oracle.java
 ---> Running in df528e0531b8
Removing intermediate container df528e0531b8
 ---> 7a5029ac8175
Step 8/8 : ENTRYPOINT java myclass
 ---> Running in 2334ff637ac6
Removing intermediate container 2334ff637ac6
 ---> c81540c31174
Successfully built c81540c31174
Successfully tagged ashujava:jdk8

```

### Pushing and pulling docker hub images 


<img src="hub.png">

### image name 

 <img src="img.png">
 
 ### pushing 
 
 
 ```
 [ashu@ip-172-31-18-96 javacode]$ docker  tag  fa00173e64d3    dockerashu/pythonrepo:v1  
[ashu@ip-172-31-18-96 javacode]$ docker  login -u dockerashu
Password: 
WARNING! Your password will be stored unencrypted in /home/ashu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[ashu@ip-172-31-18-96 javacode]$ docker  push  dockerashu/pythonrepo:v1  
The push refers to repository [docker.io/dockerashu/pythonrepo]
e2d29b2f9119: Pushed 
3de768a537a0: Pushed 
fef24ee00d9b: Pushed 
4b4f328f6bb4: Mounted from library/oraclelinux 

 ```
      
### restart policy here

```
Flag	Description
no	Do not automatically restart the container. (the default)
on-failure	Restart the container if it exits due to an error, which manifests as a non-zero exit code.
always	Always restart the container if it stops. If it is manually stopped, it is restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in restart policy details)
unless-stopped	Similar to always, except that when the container is stopped (manually or otherwise), it is not restarted even after Docker daemon restarts.


```

### 

```
docker  run -itd --name ashuc3 --restart  always  --memory 50m --cpu-shares=40 alpine ping fb.com 
a422b5f49ecacfbb7d8a2b87bd99136af1a47d2683fa45e99e9c955df6d83cde
[ashu@ip-172-31-18-96 javacode]$ docker  ps
CONTAINER ID   IMAGE        COMMAND                  CREATED              STATUS              PORTS     NAMES
a422b5f49eca   alpine       "ping fb.com"            10 seconds ago       Up 3 seconds                  ashuc3
c48795cb7968   rajiol8:v1   "/bin/sh -c 'java my…"   12 seconds ago       Up 10 seconds                 rajiol8c1
62dbc8ec0468   alpine       "ping fb.com"            About a minute ago   Up About a minute             rupajava
d7bc030623f5   alpine       "ping fb.com"            3 minutes ago        Up 3 minutes                  ashuc2
69e098a97192   alpine       "/bin/sh"                6 minutes ago        Up 6 minutes                  ashuc1
[ashu@ip-172-31-18-96 javacode]$ 

```



### Cgroup and restart policy update

```
183  docker run  -itd  --name  ashutoshhcg1 --cpu-shares=30  busybox ping localhost 
  184  docker  ps
  185  history 
  186  docker update  ashutoshhcg1  --memory 300m 
  187  docker update  --help
  188  docker update  ashutoshhcg1  --memory 300m  --memory-swap 300m 
  189  docker  stats
  190  history 
  191  docker  inspect  ashutoshhcg1
  192  history 
  193  docker update  ashutoshhcg1  --restart always
  
```




