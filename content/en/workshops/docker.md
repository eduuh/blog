---
title: "Docker"
description: "Docker crash course for busy devops and developers"
date: 2020-07-16T11:07:47Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 😎
tags:
- linux
categories:
- Productivity
series:
- workspace
image: images/feature1/markdown.png
---

### Important Docker Crash Course.

#### Images.

- Images are read only templates used to create containers.
- Images are created with the docker build command, eithre by us or by other docker users.
- Images are composed of layers of other images.
- Images are storeg in a **Docker registry**

### Containers.

- If an images is a class, then a container is an instance of a class - a runtime object.
- Containers are lightweight and portable encapsualtions of an environment in which  to run applications.
- Containers are created from images. Inside a container, it has all the bnaries and dependencies needed to run the applications.

### Registries and Repositories.

- A registry is where we store our images
- You can host your own registry , or you can use Docker's public registry which is called dockerHub.
- Inside a registry, images are stored in repositories.
- Docker repository is a colleciton fo different tags, each tag usually represents a different version of the images.

    example  (Docker HUb)
Docker hub is a public registries.
official images are stored in these registries. (Official images comes with an offical mark.)

##### Advantages of using offical images.

- Clear Documentation.
- Dedicated Team for Reviewing Image Content.
- Security Update in a Timely Manner

## Run A HELLO WOrd Docker 

> ##### Docker run

Docker run command will create the containre using the image we specified, then spin up the container and run it.

{{<boxmd>}}
$ docker run busybox:1.24 echo "hello world"
$ docker images
{{</boxmd>}}

> ### flags

{{<boxmd>}}
```bash
$ docker run -it busybox:1.24
/ # ls
bin   dev   etc   home  proc  root  sys   tmp   usr   var
/ # touch a.txt
/ # ls
a.txt  bin    dev    etc    home   proc   root   sys    tmp    usr    var
# exits out of the container
/ # exit

# Rerun the same command again. Docker spins up a new container
$ docker run -it busybox:1.24       # When the ls command is done. the a.txt file does not exist.
/ # ls
bin   dev   etc   home  proc  root  sys   tmp   usr   var
```
{{</boxmd>}}

When you exit from the container. The container will get closed

### Deep Dive into Docker Containers.

1. Running the container in the background. using the **-d** detach mode flag. This give a shasum value.
2. If we don't intend to keep the containers we can use the **-m** flag.
3. List running container using the **docker ps** command.
4. List all container that have ever been run using **docker ps -a**

If you dont specify a container name. Docker give a default funny name to our containers.

```bash
$ docker run -d busybox:1.24 sleep 400000
1e8c5ece49ee9c6ca6facd74c3605685b4c13de78a225fed7ff4e884dd9bcc1c

# eduuh @ edwin in ~/repos/blog on git:master x [11:36:08]
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
1e8c5ece49ee        busybox:1.24        "sleep 400000"      8 seconds ago       Up 7 seconds                            frosty_dirac

# eduuh @ edwin in ~/repos/blog on git:master x [11:36:15]
$ docker ps -a
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                      PORTS                                  NAMES
1e8c5ece49ee        busybox:1.24                 "sleep 400000"           23 seconds ago      Up 22 seconds                                                      frosty_dirac
8b9c938f1452        busybox:1.24                 "sh"                     2 minutes ago       Exited (0) 2 minutes ago                                           great_hamilton
# Use docker to inspect to see low level information about a container.
$ docker inspect 8b9c938f1452        
```
### Docker Port Mapping and Docker Log.

To expose a port on the docker container and acesses on the host we use the **-p** port.

```bash
$ docker run -p 8080:8080 tomcat:8.0

# start container in background.
$ docker run -p -d 8080:8080 tomcat:8.0

$ docker logs <containerid>
```

### Extra Learning: Deep Dive into Docker Logging.

Logs for long have been considerd as an afterthought, but they make vital contribution to tackle the problems,
provided they are well implemented and are well organized and searchable. It is an established fact, that without logs troubleshooting is almost impossible or a very tough job.

This holds true of you are running application inside containers. Docker containers loggins must be planned at initial stages of design, to get well-managed logs for better system functionality.

#### Understanding Docker Logging.

Logs are the key to find solutions and troubleshoot the problem. The very first thing a system admin does whenever a probem is reported is to see and analyze the log. They tell the story of every layer of the application, storage or networking.

>> To be continued
### Docker image Layers (layers are seen using the history command)
1. All changes made into the running container will be writeen into a writable layer.
2. When the container is deleted, the writable layer layer is also deleted, but the underlying images remains unchanged.
3. Multiple containers can share acess to the same undelying images.


### Docker commit

Docker commit command would save the changes we made to the Docker container's file system to a new images.

{{<boxmd>}}
docker commit container_ID repository_name:tag
{{</boxmd>}}

### Dockerfile and Instructions.

- A **Dockerfile** is a text document that contains all the instructions users provide to assemble an image. 
- Each instruction will create a new image layer to the image.
- Instructions specify what to do when building the image.

##### Docker build context.

- Docker build command takes the path to the build context as an argument.
- When build starts, docker clients would pack all the files in the build context into a tarball then transfer the tarball file to the daemon.

{{<boxmd>}}
**FROM ubuntu:latest 
RUN apt-get update
RUN apt-get install -y git 
RUN apt-get install -y neovim**
{{</boxmd>}}
Docker builds the dockerfile stepswise. From the first step. From the above docker instructions. There are 3 steps to it.

The above such instructions are saved in a **dockerfile**. To build an image out of  docker file you run the command. 

{{<boxmd>}}
# makes sure u are in the same folder as the dockerfile
docker build -t edwinmuraya/ubuntugit:1.0 .
{{</boxmd>}}


### Dockerfile In Depth

- Each Run command will execute the the command on top writable layer of the container, then commit the container as a new image.
- The new image is used for the next step in the Dockerfile. So each RUN instruction will create a new image layer.
- It is recommended to chain the Run Instructions in the Dockerfile to reduce the number of images layers it creates.

#### Chain the RUN command.

{{<boxmd>}}
**FROM ubuntu:latest 
RUN apt-get update && apt-get install -y \ 
 git \
 neovim**
{{</boxmd>}}

Now we have 2 layers.

#### Sort Multi-line Arguments Alphanumerically
#### CMD instructions.
- CMD instructions specifies what command you want to run when the container starts up.
- If we don't specify CMD instruction in the Dockerfile, Docker will use the default command defined in the base images. For Ubuntu image, the default command is **bash**


### Docker Cache
- Each time docker executes an instruction it builds a new image layer.
- The next time, if the instruction does't change, Docker will simply reuse the existing layer.

### Aggressive caching
This can course problems. You can use out of version cached version

To avoid caching you could use the **--no-cache=true**

docker build -t edwinmuraya/ubuntu . --no-cache=true

#### COPY instructions.

The copy Instruction copies new files or directories from build context and adds them to the file system of the container.

{{<boxmd>}}
FROM ubuntu:latest 
COPY abc.txt /src/abc.txt


```bash
$ docker build -t edwinkamau/ubuntu .
Sending build context to Docker daemon   2.56kB
Step 1/2 : FROM ubuntu:latest
 ---> 1d622ef86b13
Step 2/2 : COPY abc.txt /src/abc.txt
 ---> Using cache
 ---> 1484c7a95cc9
Successfully built 1484c7a95cc9
Successfully tagged edwinkamau/ubuntu:latest


$ docker run -it 1484c7a95cc9 # The file copied is there
root@c8406fd73760:/# ls /src/
abc.txt
```
{{</boxmd>}}

### Add Instruction.

Add adds more magic to tho COPY command.
- ADD instruction can only copy files but also allow you to download a file from internet and copy to the container.
- Add instructions also has the abiliyt to automatically unpack compressed files.

The rule is : Use COPY for the sake of transparency, unless you're absolutely sure you need ADD.

## Pushing Images to Docker Hub.

- Docker will use latest as a default tag when no taga is provided.
- A lot of repositories use it to tag the most up-to-data stable images, However, this is still only a convention and is entirely not being enforced.
- Images which are tagged latest will not be updated automatically when a newer version os the image is push to the repoistory.
- Avoid using latest tag.

{{<boxmd>}}
```bash
# initially
$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
edwinkamau/ubuntu       latest              1484c7a95cc9        21 minutes ago      73.9MB
edwinmuraya/ubuntugit   latest              c3711979a421        2 hours ago         251MB
$ docker tag 1484c7a95cc9  edwin:1.01
$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
edwin                   1.01                1484c7a95cc9        24 minutes ago      73.9MB
```
After the tag is supplied.

####### Login to the container
# docker login --username=edwinmuraya
# docker push edwinmuraya/ubuntu:1.01
{{</boxmd>}}


