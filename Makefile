deploy-server:
	kubectl apply -f supplychains/k8s

deploy-knative:
	kubectl apply -f supplychains/knative

clean:
	kubectl delete -f supplychains/knative
	kubectl delete -f supplychains/k8s
