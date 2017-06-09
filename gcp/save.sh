# !/usr/local//bin/zsh
BASE_NAME=$1
SNAPSHOT_NAME=${BASE_NAME}-snapshot
DISK_NAME=${BASE_NAME}-disks
IMAGE_NAME=${BASE_NAME}-image

gcloud compute disks snapshot ${BASE_NAME} \
      --snapshot-names ${SNAPSHOT_NAME} \
      --zone us-central1-a


# create disk
gcloud compute disks create ${DISK_NAME} \
      --source-snapshot ${SNAPSHOT_NAME} \
      --zone us-central1-a \

# delete snapshot
gcloud compute snapshots delete --quiet ${SNAPSHOT_NAME}

# create image
gcloud compute images create ${IMAGE_NAME} \
  --source-disk ${DISK_NAME} \
  --source-disk-zone  us-central1-a \
  --description "${BASE_NAME} dev image"

# delete disk
gcloud compute disks delete --quiet ${DISK_NAME} --zone us-central1-a
