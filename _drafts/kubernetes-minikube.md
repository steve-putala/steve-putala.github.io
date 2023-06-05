---
resources:
  minkube-install: https://minikube.sigs.k8s.io/docs/start/
---

## Install Minikube

Install instructions: <https://minikube.sigs.k8s.io/docs/start/>

For Ubuntu (I like to download to /tmp since the installer is temporary):

```bash
cd /tmp
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Start minikube cluster

```bash
minikube start
```

## Connect minikube to kubectl

```bash
kubectl get po -A
```

## minikube dashboard (local website)

```bash
minikube dashboard
```

