---
title: "Express"
date: 2020-07-11T16:02:40+03:00
draft: true
linktitle: "Express"
title: "Learn Basic CLI Concepts"
description: "Express is a minimal and flexible Node.js web application Framework that provides a robust set of features for web and mobile application."
categories: ["Express"]
tags: ["Api","Node.js", "Javascript"]

image : images/bash/bash.png
author: eduuh # author name
authorEmoji:  🤖# emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---
## Pre - Express

Before we talk about express. We will need to understand the following terms. How the internet works.

{{<boxmd>}}
1. HTTP  -> TCP / UDP.
2. NodeJS Webserver. How node will do things under the hood. 
  - Express is a node module. Node can live without the express. But express cannot survive without node.
{{</boxmd>}}

### TCP 

As an internet user you always connect to a server somewhere in the cloud. The **cloud** is someone elses computers that dont belong to you. Internet is just interconnection of computers.

What is passed around is called **packets** (stream of data.). The most used architecture **client and server**. 

When using express, that means that you are incharge to of the server to handles to the packets.That is **Request and Responses**

##### What Layers makes up a Packets with examples

1. Application    HTTP, FTP, SSH, SMTP
2. Transports.    UDP, TCP
3. Network.       IP
4. Link.          wifi ,ethernet
5. Physical       Cables

Express handles only **HTTP** requests but **HTTP** uses the transport layer **TCP**.

You have a computer connected to the internet. The transport layer createst 2^16 network ports roughly 650000. A node app running at port 3000 use one of the 65000 ports.

Steps that happens.

1. Client computer create  a request  from a port maybe 49742 and wants to talk with port 80 on the server.
2. The request is handed off to the transport layer and gets wraped up in a **segments.** A segments contains metadata i.e **Destination port 80 , source port 49742**
3. The segments is the handed to the right port for futher processing.

##### Types of Transport Layers (Protocals). UDP and TCP

##### UDP

- This is extremly lightweight . around 8 bytes
- It is usually connectionless. No need to establish a connection. 
- It has some level of consistency. but it does not care for any of these
     - Send data no matter what.
     - Packet loss
     - Packets are out of order.
- UDP is FAST.
- UDP does not know if data was received. No data acknologment

Mostly used in live gamings.

##### TCP

- This is connection Based. A 3 way handshake. 
         - client : i Want to talk.
         - Server : Okay
         - Client : make request.
- Tcp is reliable.
- Tcp has Retransmission. If the packets are lost the server can send them back.
- In-order Packets (The packets arive in the right order.)
- TCP their is congestion control.

Reliablity. Websites , I/O appliation

#### TCP and IP 

Allows computers to talk to each other. **IP**

#### HTTP (Hyper text protocal)

- HTTP passes around HTML , images , 4k videos , mp4. 
- Efficients. Http connect only when required.
- HTTP is stateless. (No dialogue). The machine know each other for the period connection lasts.

### NodeJs web server without Express.

gist 6a6a348a7f23ad45c30b344726574669

When you create the above code in you **app.js.** .Now used **nodemond** to continuasly monitor file changes.

```bash
nodemon app.js
```

Check out the req object on the nodmon instance, when you hit the site on **localhost:3000**.
You can then  use curl to see the request header.

```bash
curl -v localhost:3000
```

To route on Vanilla node code you will have to write all the following code below.

gist 7b27174a3168da99570d96183d3816c8

But express , provides an abstraction layer that help us focus writing code on a higher level.

