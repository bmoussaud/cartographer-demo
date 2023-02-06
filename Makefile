deploy:
	kubectl apply -f supplychains

workload:
	tanzu apps workload apply --file /Users/benoitmoussaud/Workspace/bmoussaud/cartographer-demo/hello-app/config/workload.yaml --namespace dev-tap --source-image akseutap4registry.azurecr.io/library/vs-extension-sources --debug --yes --local-path /Users/benoitmoussaud/Workspace/bmoussaud/cartographer-demo --live-update

status:
	tanzu apps workload get hello-app