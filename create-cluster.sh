#!/bin/bash

gcloud beta container --project "computas-universitet" clusters create "devops-101" \
  --zone "europe-north1-a" \
  --no-enable-basic-auth \
  --cluster-version "1.18.9-gke.2501" \
  --release-channel "rapid" \
  --machine-type "e2-medium" \
  --image-type "COS" \
  --disk-type "pd-standard" \
  --disk-size "100" \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --num-nodes "3" \
  --enable-ip-alias \
  --network "projects/computas-universitet/global/networks/default" \
  --subnetwork "projects/computas-universitet/regions/europe-north1/subnetworks/default" \
  --default-max-pods-per-node "110" \
  --no-enable-master-authorized-networks \
  --enable-autoupgrade \
  --enable-autorepair \
  --max-surge-upgrade 1 \
  --addons HorizontalPodAutoscaling \
  --max-unavailable-upgrade 0 \
  --enable-shielded-nodes
