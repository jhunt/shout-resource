default:
	docker build -t huntprod/shout-resource .

push: default
	docker push huntprod/shout-resource
