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
   
   

