---
resources:
 - https://www.youtube.com/watch?v=lNblN3_oog4
 - https://docs.digitalocean.com/reference/doctl/reference/kubernetes/cluster/node-pool/
---

Set the name of the kubernetes cluster to make it easier in future calls, also make an alias because the command is too long

```bash
export CLUSTER=name-of-your-cluster
alias np="doctl kubernetes cluster node-pool"
```

Get list of the node pools

```bash
np list $CLUSTER_NAME
```

Get details about a node pool

```bash
np get $CLUSTER frontend-pool -o wide
np get $CLUSTER frontend-pool -o json
```

Set a taint for the nodepool to restrict deployments that can use it, be sure to change node-pool

```bash
doctl kubernetes cluster node-pool update $CLUSTER keycloak-pool --min-nodes=1 --max-nodes=2 --auto-scale=true --taint="TargetNodePool=app-pool:NoSchedule" --count=1
```

Create a new node pool, 

```bash
doctl kubernetes cluster node-pool create $CLUSTER --name=weaviate-pool --min-nodes=1 --max-nodes=2 --auto-scale=true --taint="TargetNodePool=app-pool:NoSchedule" --count=1 --size="s-2vcpu-4gb"
```

Get details about a node

```bash
kubectl get node -n frontend
kubectl get node POOL_NAME -o json | jq '.metadata.labels'
```

Change persistent volume reclaim policy: https://kubernetes.io/docs/tasks/administer-cluster/change-pv-reclaim-policy/

```bash
kubectl patch pv <your-pv-name> -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
```

Add taint to an existing node

```bash
kubectl taint nodes node1 key1=value1:NoSchedule
```

prevent any pods from re-deploying to pools using nonsense taint

```bash
doctl kubernetes cluster node-pool update <your-cluster-name> additional-pool --taint="foo=bar:NoSchedule"
```
