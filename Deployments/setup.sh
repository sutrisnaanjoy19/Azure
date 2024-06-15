kubectl apply -f /home/sushi/Desktop/work/Azure/Deployments/test-deployment/namespace/nginx-namespace.yaml --cluster Testing-aks-EastUS
kubectl apply -f /home/sushi/Desktop/work/Azure/Deployments/test-deployment/namespace/test-namespace.yaml --cluster Testing-aks-EastUS
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install misc-nginx ingress-nginx/ingress-nginx --values /home/sushi/Desktop/work/Azure/Deployments/nginx/values.yaml --kube-context Testing-aks-EastUS -n nginx
kubectl apply -f /home/sushi/Desktop/work/Azure/Deployments/test-deployment/namespace/test-namespace.yaml --cluster Testing-aks-EastUS
kustomize build /home/sushi/Desktop/work/Azure/Deployments/test-deployment
kustomize build /home/sushi/Desktop/work/Azure/Deployments/test-deployment | kubectl apply -f - --cluster Testing-aks-EastUS -n test
