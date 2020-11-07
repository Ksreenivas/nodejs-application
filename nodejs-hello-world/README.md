# nodejs Application

This folder contains code related to bring up a simple `hello world` node.js web application.

## Quick start

1. To publish a node.js docker image, make sure you have [Dockerfile](https://github.com/Ksreenivas/nodejs-application/blob/main/nodejs-hello-world/Dockerfile).
2. Login to `Docker Hub`
```
$ docker login --username=yourhubusername --email=youremail@company.com
Login Succeeded
```
3. Build docker image 
```
$ docker build -t nodejs-helloworld .
nodejs-helloworld                                      latest              03141101218e6        7 hours ago         232MB
```
4. Tag your docker image
```
$ docker tag 03141101218e6 sreenivask/nodejs-helloworld:latest
```
5. Publish docker image to docker hub
```
$ docker push sreenivask/nodejs-helloworld:latest
```
6. Pull your docker image and run the container as daemon
```
$ docker pull docker.io/sreenivask/nodejs-helloworld 
$ docker run -p 8080:8080 -d nodejs-helloworld:latest

CONTAINER ID        IMAGE                      COMMAND               CREATED             STATUS              PORTS                    NAMES
b32e45fde232        nodejs-helloworld:latest   "nodemon server.js"   7 hours ago         Up 7 hours          0.0.0.0:8080->8080/tcp   trusting_torvalds

git:(master) ✗ curl -v 0.0.0.0:8080
* Rebuilt URL to: 0.0.0.0:8080/
*   Trying 0.0.0.0...
* TCP_NODELAY set
* Connected to 0.0.0.0 (127.0.0.1) port 8080 (#0)
> GET / HTTP/1.1
> Host: 0.0.0.0:8080
> User-Agent: curl/7.54.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Content-Type: text/plain
< Date: Sat, 07 Nov 2020 12:45:01 GMT
< Connection: keep-alive
< Keep-Alive: timeout=5
< Transfer-Encoding: chunked
<
Hello World!
* Connection #0 to host 0.0.0.0 left intact
➜  packer-example git:(master) ✗
```

7. To download node.js docker image, `docker pull docker.io/sreenivask/nodejs-helloworld`

## Jenkinsfile

Jenkinsfile is used to create pipeline stages to have stages to build docker image and publish image from master branch.