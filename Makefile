.PHONY: build
login:
	. .env && echo $${DOCKERHUB_TOKEN} | docker login -u $${DOCKERHUB_USER} --password-stdin
build: 
	. .env && docker buildx build --platform linux/amd64,linux/arm64 -t $${IMAGE_NAME} --push .
setup:
	docker buildx create --name mybuilder --driver docker-container --bootstrap --use