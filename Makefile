
build:
	docker build -t sigsci-agent-debian8-nodejs:latest .

build-no-cache:
	docker build --no-cache -t sigsci-agent-debian8-nodejs:latest .

run:
	docker run -p 80:80/tcp -i -t sigsci-agent-debian8-nodejs:latest /bin/bash

clean:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi $$(docker images -f dangling=true -a)
