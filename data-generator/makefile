build:
	TAG=`git rev-parse --short=8 HEAD`; \
	docker build --rm -f generator.dockerfile -t samarsinghal/generator:$$TAG .; \
	docker tag samarsinghal/generator:$$TAG samarsinghal/generator:latest

clean:
	docker stop generator
	docker rm generator

rebuild: clean build

#ADD this back in with project examples are ready -v $$PWD/deploy:/deploy 
run:
	# docker run --name generator -v $$PWD/config/kube.conf:/root/.kube/config -v $$PWD/ytt:/ytt -td samarsinghal/generator:latest
	docker run --name generator -td samarsinghal/generator:latest
	docker exec -it generator bash -l

join:
	docker exec -it generator bash -l
start:
	docker start generator
stop:
	docker stop generator

default: build
