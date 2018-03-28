# Minikube supports multiple versions of Kubernetes and the latest version is v1.4.0. To check out the different versions supported try out the following command:
minikube get-k8s-versions

# # Starting our Cluster

# Help
minikube.exe start --help

# Starting a kubernetes cluster version 1.4
minikube.exe start --kubernetes-version="v1.4.0" --vm-driver="virtualbox" --alsologtostderr