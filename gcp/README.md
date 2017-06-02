# env
python: 2.7.10

# link
https://cloud.google.com/deployment-manager/docs/quickstart

# usage
gcloud deployment-manager deployments create mybook --config vm.yaml

gcloud deployment-manager deployments describe mybook
gcloud deployment-manager manifests describe manifest-[TIMESTAMP] --deployment mybook

gcloud deployment-manager deployments delete mybook


