## Setup
Note that the `create-cluster.sh` script assumes that the project to host the cluster is `computas-universitet`.
Update it if you need to deploy to another Google Cloud Project.

1. Create cluster: `./create-cluster.sh`
2. Check if the devops-101-ip has been reserved: `gcloud compute addresses describe devops-101-ip`
  1. Create it if not: `gcloud compute addresses create devops-101-ip --region europe-north1`
3. Fetch the IP: `export IP="$(gcloud compute addresses describe devops-101-ip --region europe-north1 | grep address: | cut -d ' ' -f 2)"`
4. Replace the IP in the ingress manifest: `sed -ie "s/loadBalancerIP:\s\+\(.\+\)/loadBalancerIP: $IP/g" cluster-production/ingress-deployment.yaml`
5. Commit and push the change.
6. Setup GitHub token in env: `export GITHUB_TOKEN="$(cat token.txt)"` 
  1. If you don't have a token, create a Personal Access Token with full repo-scope [here](https://github.com/settings/tokens)
7. Bootstrap the cluster with gitops-toolkit: `gotk bootstrap github --owner=cx-devops-101 --repository=k8s-infra --path=cluster-production`

## Tear-down
1. Delete cluster `gcloud beta container clusters delete devops-101`
2. Delete static ip `gcloud compute addresses delete devops-101-ip`