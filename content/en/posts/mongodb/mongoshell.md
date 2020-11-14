---
title: 'MongoDB Crud Operation with the Shell'
description: 'Understanding Creating, reading, updading and Deleting documents from mongodb shell'
date: 2020-09-20T12:50:52Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖

image: images/mongo/mongologo.png

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

Let me say that it depends on the use case of mongoDB. You could be using mongoDB for your **applications** or **Analytics/BiTools (DataScience)** or you are **Database Administrator**. All these roles have different CRUD requirements. lets see this visually.

![Crud requirements](/images/mongo/roles.png)
In here we are taking the role of an Administrator. As show we have the ability to **create ,read , update and delete**.
You can start using a database that does not exist and MongoServer will automatically create the db for you. The database will be create when you add at least one Document. Above ☝ We have a **bootcamps Document** and we want to be able to:

{{<boxmd>}}

1. **Create a bootcamp.**
2. **Create many bootcamps.**
3. **Update the created bootcamp**
4. **Update Many bootcamps**
5. **Delete bootcamp**
6. **Delete manybootcamps.**
7. **Find a particular bootcamp.**
   {{</boxmd>}}

The shell uses **javascript** but before we start creating stuff. Lets first review available methods to complete all the tasks above. Within the shell **db** referst to your current database. Type db to display the current database.

{{<boxmd>}}
**db**
{{</boxmd>}}
The operation should return **test**, which is the default database.

{{<boxmd>}}
**use bootcamp**
{{</boxmd>}}

You do not need to create the database before you switch. **MongoDB** creates the database
