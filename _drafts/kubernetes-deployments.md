---

---

## Deployments

Troubleshooting deployments: <https://learnk8s.io/troubleshooting-deployments>

Targeting nodes with pod deployment: <https://serverfault.com/questions/989750/kubernetes-how-to-debug-failed-scheduling-0-nodes-are-available#answer-989810>

Rollout update: <https://kubernetes.io/docs/tutorials/kubernetes-basics/update/update-intro/>

Deployments: <https://kubernetes.io/docs/concepts/workloads/controllers/deployment/>

Target multiple nodes (node-pools) by label: <https://stackoverflow.com/questions/37415617/can-we-mention-more-than-one-node-label-in-single-nodeselector-in-kubernetes#answer-53976070>

Several commands I use to troubleshoot deployments (change names as needed)

```bash
kubectl get events --sort-by=.metadata.creationTimestamp -n <your-namespace>
kubectl describe pod <your-pod-name> -n <your-namespace>
kubectl get pods --all-namespaces
kubectl describe deployment -n <your-namespace>
kubectl rollout status deployment -n <your-namespace>
```

