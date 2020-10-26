# k8s-infra

1. Create cluster: `./create-cluster.sh`
2. Setup GitHub token in env: `export GITHUB_TOKEN="$(cat token.txt)"`
3. Bootstrap gitops-toolkit: `gotk bootstrap github --owner=cx-devops-101 --repository=k8s-infra --path=cluster-production`