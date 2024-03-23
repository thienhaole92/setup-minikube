# setup-minikube

`setup-minikube` is a short script to install minikube for local Kubernetes development and testing on `MacOS`. I feel like I have to automate this after installing minikube for a few times.

## Getting Started

1. Assign execute permission to `install-minikube.sh` file

```sh
chmod +x install-minikube.sh
```

2. Run the script.

```sh
./install-minikube.sh
```

3. Access ArgoCD web UI

To access the ArgoCD web UI, you'll need to port forward to the argocd-server service

```sh
kubectl port-forward svc/argocd-server -n argocd 8080:80
```
