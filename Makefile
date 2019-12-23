install:
	kubectl apply -f ns.yaml
	kubectl -n thrift-demo apply -f deploy.yaml 

clean:
	kubectl delete -f ns.yaml