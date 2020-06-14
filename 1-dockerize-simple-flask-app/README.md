# Dockerizing Flask App

### Create the Dockerfile
Dockerfile is an essential file in order to create custom Docker image. In this, case, we have a Sample Python based Hello world app which needs Flask dependency.

You can check the `app/app.py` and `app/requirements.txt`for Python app and its dependency file. 
Dockerfile which located in this current path, will do the following actions. 
```
# It will pull the base image from Dockerhub.
FROM python:3.6.10  

# It specifies the Working directory as `/app` in Docker container.
WORKDIR /app

#It copies the whole app folder into Docker container
COPY app /app

#It installs the requirements in Docker container.
RUN pip install -r requirements.txt

#It executes the python app
CMD python app.py

#It exposes the port which will be accessed from host later.
EXPOSE 5000
``` 

### Build the Dockerfile
Once you checked the Dockerfile, and Python application, you have to build the Dockerfile. Here is the command:
```
$ docker build -t flask-hello-world:v1.0 .
```
* "-t" denotes the containername:tag
* "." denotes the current Dockerfile path.


### List images
When we build the Dockerfile, we created Docker image. You can check the created Image as below:
```
$ docker images

flask-hello-world         v1.0        9e29b0c38236        3 hours ago         924MB
```

### Run the Container
You can run the container from Docker image with detached mode(background).
```
$ docker run --rm -d -p 8080:5000 flask-hello-world:v1.0
```
* "-p" denotes the port mapping. We will access to the application from localhost with 8080 port.
* "--rm" denotes that, once we stop the container, it will clean it.
* "-d" means that the container will be run in detached(background) mode.

### Checking Container
You can check the container is working.
```
$ docker ps -a

CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                    NAMES
bdd0cabba8a0        flask-hello-world:v1.0   "/bin/sh -c 'python …"   10 seconds ago      Up 9 seconds        0.0.0.0:8080->5000/tcp   stupefied_leakey
```

And, you can now access to the application.
```
$ curl localhost:8080

Hello World!%
```

Cool! So now we dockerized the simple python application, and accessed from localhost..

Let's [move on to the next section](https://github.com/onedaywillcome1/docker101-workshop/tree/master/2-docker-compose).
