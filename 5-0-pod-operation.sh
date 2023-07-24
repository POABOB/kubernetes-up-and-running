# 透過 run 指令直接執行
kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:blue

# 獲取目前運行的 pods
kubectl get pods

# 刪除 pods
kubectl delete pods/kuard

# 執行 yaml 檔啟動 Pod
kubectl apply -f ./5-1-kuard-pod.yaml

# 查看 Pod 資訊
kubectl describe pods kuard

# 刪除檔案開啟的 Pod
kubectl delete -f ./5-1-kuard-pod.yaml

# 查看 Pod 日誌
kubectl logs kuard

# 透過容器執行指令
kubectl exec kuard -- date

# -it 可以進去 terminal 互動
kubectl exec -it kuard -- ash

# 開啟有健檢的 pod，並透過 port-forward 映射到內網的 8080 端口
kubectl apply -f ./5-2-kuard-pod-health.yaml
kubectl port-forward kuard 8080:8080
kubectl delete -f ./5-2-kuard-pod-health.yaml


