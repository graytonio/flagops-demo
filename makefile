.PHONY: cluster-up
cluster-up:
	kind create cluster --name flagops-demo-use1
	kind create cluster --name flagops-demo-euc1
	kind create cluster --name argocd-control

.PHONY: argo-up
argo-up:
#	kubectx kind-argocd-control
	kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
	kustomize build ./argocd | kubectl apply -n argocd -f -


.PHONY: cluster-down
cluster-down:
	kind delete cluster --name flagops-demo-use1
	kind delete cluster --name flagops-demo-euc1
	kind delete cluster --name argocd-control
