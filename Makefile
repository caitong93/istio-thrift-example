install:
	kubectl apply -f ns.yaml
	kubectl apply -f deploy.yaml 

clean:
	kubectl delete -f ns.yaml