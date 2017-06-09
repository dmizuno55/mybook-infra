#!/usr/local/bin/zsh
BASE_NAME=$1
MASTER_IMAGE=$2
IMAGE_PROJECT="clear-apogee-815"

if [ "${MASTER_IMAGE}" = "" ]; then
  MASTER_IMAGE="debian-8-jessie-v20170523"
  IMAGE_PROJECT="debian-cloud"
fi

gcloud compute instances create "${BASE_NAME}" \
--project "clear-apogee-815" \
--zone "us-central1-a" \
--machine-type "f1-micro" \
--subnet "default" \
--maintenance-policy "MIGRATE" \
--service-account "114392696103-compute@developer.gserviceaccount.com" \
--scopes "https://www.googleapis.com/auth/logging.write",\
"https://www.googleapis.com/auth/monitoring.write",\
"https://www.googleapis.com/auth/trace.append",\
"https://www.googleapis.com/auth/servicecontrol",\
"https://www.googleapis.com/auth/service.management.readonly",\
"https://www.googleapis.com/auth/devstorage.read_only" \
--tags "http-server" \
--image "${MASTER_IMAGE}" \
--image-project "${IMAGE_PROJECT}" \
--boot-disk-size "10" \
--boot-disk-type "pd-standard" \
--boot-disk-device-name "${BASE_NAME}"

## execute only once
# gcloud compute \
# --project "clear-apogee-815" firewall-rules create "default-allow-http" \
# --allow tcp:80 \
# --network "default" \
# --source-ranges "0.0.0.0/0" \
# --target-tags "http-server"
