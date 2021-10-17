gcloud container clusters get-credentials --zone us-central1 etl-environment
kubectl apply -f spark-rbac.yaml 
helm install my-release spark-operator/spark-operator --namespace spark-operator --create-namespace
