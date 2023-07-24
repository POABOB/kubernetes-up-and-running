# 套用 label，根據 版本, App Name, 環境進行標記
kubectl create deployment alpaca-prod --image=gcr.io/kuar-demo/kuard-amd64:blue --replicas=2 && kubectl label deployment alpaca-prod ver=1 app=alpaca env=prod  --overwrite
kubectl create deployment alpaca-test --image=gcr.io/kuar-demo/kuard-amd64:green --replicas=1 && kubectl label deployment alpaca-test ver=2 app=alpaca env=test  --overwrite
kubectl create deployment bandicoot-prod --image=gcr.io/kuar-demo/kuard-amd64:blue --replicas=2 && kubectl label deployment bandicoot-prod ver=2 app=bandicoot env=prod  --overwrite
kubectl create deployment bandicoot-staging --image=gcr.io/kuar-demo/kuard-amd64:green --replicas=1 && kubectl label deployment bandicoot-staging ver=2 app=bandicoot env=staging  --overwrite

# 查看 deployments
kubectl get deployments --show-labels

# 想要改變 label 可以使用 label 指令
kubectl label deployment alpaca-prod canary=true

# 也可以使用 -L 讓 Label 作為欄位輸出
kubectl get deployments -L ver

# 移除 label 使用後綴 - 即可
kubectl label deployment alpaca-prod canary-

# 可以透過 label 來篩選資料
kubectl get deployments --selector="ver=2"
kubectl get deployments --selector="app=bandicoot,ver=2"
kubectl get deployments --selector="app in (bandicoot)"
kubectl get deployments --selector="app=bandicoot,ver!=1"
# 找沒有 app label 的 deployment
kubectl get deployments --selector="!app"

# 刪除全部 deployment
kubectl delete deployments --all