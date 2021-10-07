# Plan 

<img src="plan.png">

## docker & Kubernetes revision 

<img src="rev.png">

## checking k8s master / control plane connection from local client machine 

```
fire@ashutoshhs-MacBook-Air  ~/Desktop  kubectl  get  nodes  --kubeconfig  admin.conf 
NAME            STATUS   ROLES                  AGE   VERSION
control-plane   Ready    control-plane,master   25h   v1.22.2
minion-node1    Ready    <none>                 25h   v1.22.2
minion-node2    Ready    <none>                 25h   v1.22.2

```

### setting up config file 

<img src="config.png">



### sending req to kube-apiserver 

```
kubectl  cluster-info 
Kubernetes control plane is running at https://3.230.187.160:6443
CoreDNS is running at https://3.230.187.160:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'

```

### kube-schedular

<img src="sche.png">

### kube schedular algo 

<img src="schealgo.png">

### kube-controller-manager

<img src="kubec.png">

### ETCD 

<img src="etcd.png">


### kubernetes minion side 

<img src="min.png">


### Minion will also have CNI installed to create Bridge and assign IP to containers

<img src="cni.png">



