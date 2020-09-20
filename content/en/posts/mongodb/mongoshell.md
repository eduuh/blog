---
title: 'MongoDB Crud Operation with the Shell'
description: 'Modifiy the input'
date: 2020-09-20T12:50:52Z
draft: true
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
tags:
  - mongo
categories:
  - mongo
series:
  - mongo
---

### Introduction To MongoDb using the shell.

Using the The shell is the neural ground to learning mongoDB and then later transitioning to the specific language Driver which is easy to do.

Before using the database we need to start It. In order to start mongoDB, there are usually two options. **Starting mongoDB as a service(starting on system boot up)** or using **mongod command to manually start it.** Here we will use the manual method and then later we can configure mongoDB to start as a service. I also use mongoDB from a docker container, later I will show you the commands to get mongo working.

##### Document to Practise CRUD with.

{{< gist eduuh ac6f285d096c382ff69fef81ec3fd596 >}}

##### To start mongoDB use the command [mongod]

{{<boxmd>}}

###### For local installation of mongoDB.

**\$ mongod**

###### Docker

**\$ docker run -p 27017:27017 mongo bash**
{{</boxmd>}}
You will get such an output below 👇
![dockerunimage](/images/mongo/dockerrun.png)

##### Connect to mongoDB server with the command [mongo]

Execute the command From a different terminal window. Make sure to leave mongoDB server running.

{{<boxmd>}}
**\$ mongo**
{{</boxmd>}}

###### Docker Users

If you have mongo tools installed in your installation. Running **mongo** command will also work since we are binding local port used by mongodb server to the instance of mongoDB in the container. Also make sure you started your container using **docker run**

Incase you forget to start the server, you will get such an error.

![Error connecting to Server](/images/mongo/mongoconnect.png)

Incase you connect successfully you get a prompt as show below. You could list the databases (show three default database available in mongoDb)

![Mongoshowdbs](/images/mongo/showdbs.png)

### CRUD Operation and MongoDB
Let me say that it depends on the use case of mongoDB. You could be using mongoDB for your __applications__ or __Analytics/BiTools (DataScience)__ or you are __Database Administrator__. All these roles have different CRUD requirements. lets see this visually.

![Crud requirements](/images/mongo/roles.png)
In here we are taking the role of an Administrator. As show we have the ability to __create ,read , update and delete__.
You can start using a database that does not exist and MongoServer will automatically create the db for you. The database will be create when you add at least one Document. Above ☝ We have a **bootcamps Document** and we want to be able to:

{{<boxmd>}}

1. __Create a bootcamp.__
2. __Create many bootcamps.__
3. __Update the created bootcamp__
4. __Update Many bootcamps__
4. __Delete bootcamp__
5. __Delete manybootcamps.__
6. __Find a particular bootcamp.__
   {{</boxmd>}}

The shell uses **javascript** but before we start creating stuff. Lets first review available methods to complete all the tasks above. Within the shell **db** referst to your current database. Type db to display the current database.

{{<boxmd>}}
**db**
{{</boxmd>}}
The operation should return __test__, which is the default database.

{{<boxmd>}}
**use bootcamp**
{{</boxmd>}}

You do not need to create the database before you switch. __MongoDB__ creates the database





   
