# Docker Compose

### Composing Flask and Mysql
In order to orchestrate containers in a same host machine, we will use `docker-compose`

`docker-compose.yml`file in this path creates the python flask app container, mysql container, and bind mysql to container.


### Building Docker Compose
Run the following command to build docker-compose.
```
$ docker-compose up -d

Creating flask-mysql-app_db_1 ... done
Creating flask-mysql-app_app_1 ... done
```

This command will build python flask app container, mysql container, and link app to mysql.
### Checking Container
You can check the container is working.
```
$ docker ps -a

CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                                NAMES
e3ca7472bd42        flask-mysql-app_app   "/bin/sh -c 'python …"   3 seconds ago       Up 1 second         0.0.0.0:5000->5000/tcp               flask-mysql-app_app_1
14dd059a65e8        mysql:5.7             "docker-entrypoint.s…"   4 seconds ago       Up 2 seconds        33060/tcp, 0.0.0.0:32000->3306/tcp   flask-mysql-app_db_1
```

A couple of seconds later, application will start to read data from mysql db, and will print the following json output.
```
$ curl localhost:8080

{"favorite_colors": [{"BMW": "blue"}, {"Mercedes": "yellow"}]}%
```

Cool! So now we orchestrated the  python application and mysql, and accessed from localhost..

Let's [move on to the next section](https://github.com/onedaywillcome1/docker101-workshop/tree/master/3-shipping-to-AWS-ECR).
