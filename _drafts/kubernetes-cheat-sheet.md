---
published: false
resources:
  - https://www.upwork.com/resources/how-to-get-ip-of-kubernetes-pod
  - https://kubernetes.io/docs/reference/kubectl/cheatsheet/
---

## Switch between different contexts (servers)

List Servers

```bash
kubectl config get-contexts
```

Switch between servers

```bash
kubectl config set current-context NAME-OF-CONTEXT
```

Get all pods

```bash
kubectl get pods --all-namespaces
```

Remove stateful set

```bash
kubectl delete statefulsets.apps -n <your-namespace> <your-secret> --cascade=orphan
```

