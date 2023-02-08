deploy-server:
	kubectl apply -f supplychains/k8s

deploy-knative:
	kubectl apply -f supplychains/knative

clean: workload-clean carto-clean  

carto-clean:
	kubectl delete -f supplychains/knative -f supplychains/k8s
	
workload-clean:
	kubectl delete workload.carto.run hello-app

workload:
	tanzu apps workload apply --file hello-app/config/workload.yaml --namespace dev-tap --source-image akseutap4registry.azurecr.io/library/vs-extension-sources --debug --yes --local-path hello-app --live-update

status:
	tanzu apps workload get hello-app
	kubectl tree workload hello-app

diff: 	
	@diff supplychains/k8s/server-my-company-supply-chain.yaml ./supplychains/knative/knative-my-company-supply-chain.yaml -U2