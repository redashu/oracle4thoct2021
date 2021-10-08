# Plan 

<img src="plan.png">


## Certifications 

<img src="cert.png">

### kubeadm master node setup and share kubeconfig file steps 

```
1  setenforce  0
    2  sed -i 's/SELINUX=enforcing/SELINUX=disabled/'  /etc/selinux/config
    3  modprobe br_netfilter
    4  echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
    5  swapoff  -a
    6  yum  install  docker kubeadm  -y
    7  yum  install kubeadm 
    8  cat  <<EOF  >/etc/yum.repos.d/kube.repo
    9  [kube]
   10  baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
   11  gpgcheck=0
   12  EOF
   13  yum  install kubeadm -y
   14  cat  <<X  >/etc/docker/daemon.json
   15  {
   16    "exec-opts": ["native.cgroupdriver=systemd"]
   17  }
   18  X
   19  systemctl enable --now  docker kubelet
   20  history 
   21  hostnamectl set-hostname  masternode
   22  kubeadm  init  --pod-network-cidr=192.168.0.0/16   --apiserver-advertise-address=0.0.0.0   --apiserver-cert-extra-sans=34.192.180.181
   23  mkdir -p $HOME/.kube
   24  ls  /etc/kubernetes/
   25  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   26  kubectl  get  nodes
   27  wget https://docs.projectcalico.org/manifests/calico.yaml
   28  ls
   29  kubectl apply -f  calico.yaml 
   30  kubectl  get  nodes
   31  kubectl  get  nodes  -w
   32  kubectl  get  nodes  
   33  cd  /etc/kubernetes/
   34  ls
   35  yum install httpd -y
   36  ls
   37  cp  admin.conf  /var/www/html/
   38  chmod 644  /var/www/html/admin.conf 
   39  systemctl start  httpd
   40  vim /var/www/html/admin.conf 
   
   ```
   
   
### checking number of cluster that client machine can connect 

### listing and switching 

```
fire@ashutoshhs-MacBook-Air  ~  kubectl   config  get-contexts 
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~                     
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  kubectl  config  use-context  kubernetes-admin@kubernetes
Switched to context "kubernetes-admin@kubernetes".
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  kubectl   config  get-contexts                           
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
 fire@ashutoshhs-MacBook-Air  ~  
 fire@ashutoshhs-MacBook-Air  ~  kubectl  get  nodes                                      
NAME            STATUS   ROLES                  AGE     VERSION
control-plane   Ready    control-plane,master   2d2h    v1.22.2
minion-node1    Ready    <none>                 2d2h    v1.22.2
minion-node2    Ready    <none>                 2d2h    v1.22.2
minion3         Ready    <none>                 3m51s   v1.22.2

```

### K8s revision 

<img src="rev.png">

## Intro to namespace in k8s

<img src="ns.png">

### list of namespace 

```
fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl   get  namespaces 
NAME              STATUS   AGE
default           Active   2d3h
kube-node-lease   Active   2d3h
kube-public       Active   2d3h
kube-system       Active   2d3h
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  get  pods
No resources found in default namespace.

```

### k8s internal components are running here

```
fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl get  po  -n  kube-system 
NAME                                       READY   STATUS    RESTARTS      AGE
calico-kube-controllers-75f8f6cc59-8rp9w   1/1     Running   3 (17h ago)   2d3h
calico-node-5qbfh                          1/1     Running   3 (17h ago)   2d3h
calico-node-7sgrt                          1/1     Running   0             22m
calico-node-d7pfx                          1/1     Running   3 (17h ago)   2d3h
calico-node-g7vcl                          1/1     Running   3 (17h ago)   2d3h
coredns-78fcd69978-nvzkn                   1/1     Running   3 (17h ago)   2d3h
coredns-78fcd69978-tw2bp                   1/1     Running   3 (17h ago)   2d3h
etcd-control-plane                         1/1     Running   3 (17h ago)   2d3h
kube-apiserver-control-plane               1/1     Running   3 (17h ago)   2d3h
kube-controller-manager-control-plane      1/1     Running   3 (17h ago)   2d3h
kube-proxy-5csrx                           1/1     Running   3 (17h ago)   2d3h
kube-proxy-6b7ff                         

```

### creating namespaces 

```
fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  create  namespace  ashu-devenv 
namespace/ashu-devenv created
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  get  ns                        
NAME              STATUS   AGE
ashu-devenv       Active   4s

```

### changing default namespace 

```
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  get   pods
No resources found in default namespace.
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  config set-context --current --namespace=ashu-devenv 
Context "kubernetes-admin@kubernetes" modified.
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  
 fire@ashutoshhs-MacBook-Air  ~/Desktop/k8s_appdeploy  kubectl  get   podsNo resources found in ashu-devenv namespace.
 
```

### checking default namespace 

```
kubectl config get-contexts 
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   ashu-devenv

```



