---
date: 2020-07-11T16:02:40+03:00
draft: true
linktitle: 'Express'
title: 'Express'
description: 'Express is a minimal and flexible Node.js web application Framework that provides a robust set of features for web and mobile application.'
categories: ['Express']
tags: ['javascript']

image: images/bash/bash.png
author: eduuh #author name
authorEmoji: 🤖
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---

#### Pre - Express

How does the Interned work? Good question! Before we talk about **express.** We will need to understand how internet works.

Because the internet is a **global network of computers.** Each computer **must have a unique address**. This address is know as an **IP address (IP stands for Internet protocol)**.

If you connect to the Internet through an **Internet service Provider (ISP)**, you are usually assigned a temporary IP address for the duration of your dial-in session. If you connect to the internet from a local area network (LAN) your computer might have a permanent IP address or it might obtain a temporary one form a **DHCP (Dynamic Host Configuration Protocols) server.** In any case, if you are connected to the internet your computer has a unique **IP address.**

##### Protocols Stacks and Packets.

So your computer is connected to the Internet and has a unique address. How does it **'talk'** to other computers on the internet? Every computer need a **protocol stack** to communicate on the internet and it is usually built into the computer's operating system. The **protocol stack** used on the internet is referred to as the **TCP/IP protocol** because of the two major communication protocols used. The TCP/IP stack looks like this:

| protocols                           | Comments                                                                                                         |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Application protocol Layers         | protocols specific to applications such as **WWW, e-mail, FTP**                                                  |
| Transmission control protocol layer | TCP directs packets to a specific application on a computer using a port number                                  |
| Internet protocol Layer             | IP directs packets to a specific computer using an IP address                                                    |
| Hardware Layer                      | Converts binary packets data to network signals and back.( **Ethernet network card**, **modem for phone lines**) |

If we were to follow the path that the message "Hello computer 5.6.7.8" took from our computer to the computer with IP address 5.6.7.8, it would happen something like this:

![protocol Stack](/images/protocolstack.gif)

{{<expand "Read more of concepts here!">}}
{{<boxmd>}}

1. The message would start at the top of the protocol stack on your computer and works it's way downward.
2. If the message to be sent is long, each stack layer that the message passed through may break the message up into smaller chunks of data. This is because data sent over the internet (and most computer networks) are sent in manageable chunks. On the Internet the chunks of data are know as **Packets**.
3. The packets would go through the Application Layer and continue to the TCP layer. Each packets is assigned a **port number**.Many programs may be using the **TCP/IP** stack and sending message. We need to know which programs on the destination computer needs to receive the message because it will be listening on a specific port.
4. After going through the TCP layer, the packets proceed to the IP layer. This is where each packets receives its destination address, 5.6.7.8.
5. Now that our message packets have a port number and an IP address, they are ready to be sent over the Internet. The hardware layer takes care of turning our packets containing the alphabetic text of our message into signals and transmitting them over the phone line.
6. On the other end of the phone line you ISP has a direct connection to the Internet. The ISP **router** examines the destination address in each packets and determines where to send it.Often , the packet's next stop is another router. More on router and internet infrastructure later.
7. Eventually, the packets reach computer 5.6.7.8. Here, the packets start at the bottom of the destination computer's TCP/IP stack and works upwards
8. As the packets go upwards through the stack, all routing data that the sending computer's stack added (Such as IP address and port number) is stripped form the packets.
9. When the data reaches the top of the stack, the packets have been reassembled into their original form, "Hello computer 5.6.7.8"
   {{</boxmd>}}

{{</expand>}}

As an internet user you always connect to a server somewhere in the cloud. The **cloud** is someone else's computers that don't belong to you. Internet is just interconnection of computers.

##### UDP

This is extremely **lightweight** . Around 8 bytes

- It is usually Connectionless. No need to establish a connection. This makes it fast.
- It has some level of consistency. But it does not care for any of these
  - Send data no matter what.
  - Packet loss
  - Packets are out of order.
- It FAST.
- It does not know if data was received. No data acknowledgment

Mostly used in live gamings and live streams.

##### TCP

Under the application layer in the protocol stack is the **TCP layer**. When application open a connection to another computer on the Internet, the message they send (using a specific application layer protocol) get passed down the stack to the TCP layer. **TCP is responsible for routing application protocol to the correct application on the destination computer**. To accomplish this, port numbers are used. Ports can be thought of as separate channels on each computer. For example, you can surf the web while reading E-mails. This is because these two application (the web while reading email). This is because the two application (the web browser and the mail client) used different port numbers. When a packet arrives at a computer and makes its way up the protocol stack, the TCP layer decides which application receive the packet based on a port number.

**TCP** Works like this

- When the TCP layer receive the application layer protocol data form above, it segments it into manageable 'chunks' and then add a TCP header with specific TCP information to each 'chunk'. The information contained in the TCP header includes the port number of the application the data needs tot be sent to.
- When the TCP layer receives a packets from the IP layer below it, the TCP layer strips the TCP header data from the packet, does some data reconstruction if necessary and then sent the data to the correct application using the port number taken form the TCP header.

TCP is not a textual protocol. TCP is a **connection-oriented**, **reliable**, **byte** and **stream service**

- Connection-oriented means that two application using TCP must first establish a connection before exchanging data. **A 3 way handshake. - client : i Want to talk. - Server : Okay what do want to say - Client : make request.**
- TCP is reliable because for each packet received, an acknowledgement is sent to the sender to confirm the delivery.
- TCP also includes a checksum in it's header for error-checking the received data. The TCP header looks like this.
- TCP has Retransmission. If the packets are lost the server can send them back.
- In-order Packets (The packets arrive in the right order.)
- TCP their is congestion control.

TCP don't know anything about IP addresses. TCP job is to get application level data from application to application reliably. The task of getting data from **computer to computer is the job of IP**.

#### HTTP (Hyper text protocol)

- HTTP passes around HTML , images , 4k videos , mp4.
- Efficients. Http connect only when required.
- HTTP is stateless. (No dialogue). The machine know each other for the period connection lasts.

#### Express

**Express is a node module.** Node can live without the express. But express cannot survive without node.

So how does **node and express** fit in in all the above. Initially I talked about two computers . The two computers are usually referred to as **client and a server**.

What is passed around is called **packets** (stream/chunk of data). The most used architecture **Client and Server**.

When using express, that means that you are in charge of the server to handles to the packets. That is **Request and Responses**

Express handles only **HTTP** requests but **HTTP** uses the transport layer **TCP**.

Let's summarize the layers

##### What Layers makes up a Packets with examples

{{<boxmd>}}

1. **Application layer . HTTP, FTP, SSH, SMTP**
2. **Transports layer. UDP, TCP**
3. **Network layer. IP**
4. **Link layer. wifi , Ethernet**
5. **Physical Cables layer**
   {{</boxmd>}}

A computer connected to the Internet. The transport layer creates **2^16** network ports roughly 650000.

A _node Application runs at port 3000_ use one of the 65000 ports. Note:

> **Note**: You could assign you application any port you want.

Steps of what happens.

1. Client computer create a request from a port maybe 49742 and wants to talk with port 80 on the server.
2. The request is handed off to the transport layer and gets wrapped up in a **segments.** A segments contains meta data such as **Destination port 80 , source port 49742 and IP address**
3. The segments is the handed to the right port for futher processing on the server.

##### Requirements

1. Good understating of Javascript
2. Familiarity with Node.js and Npm

You know how to run Node scripts and can install packages with npm or yarn. You don't have to be an expert.

#### NodeJs web server

To understand the role of **Express** in node it important to create a web server with node without express.

> The codes are commented.

<script src="https://gist.github.com/eduuh/6a6a348a7f23ad45c30b344726574669.js"></script>

In order to route you write such code.

<script src="https://gist.github.com/eduuh/7b27174a3168da99570d96183d3816c8.js"></script>

When you create the above code in you **app.js.** .Now used **nodemon** to continually monitor file changes.

{{<boxmd>}}
**\$ nodemon app.js**
{{</boxmd>}}

Check out the **req object on the nodmon instance**, when you hit the site on **localhost:3000**.

You can then use curl to see the request header.

```bash
$ curl -v localhost:3000

- Connected to localhost (::1) port 3000 (#0)
  > GET / HTTP/1.1
  > Host: localhost:3000
  > User-Agent: curl/7.71.1
  > Accept: _/_
- Mark bundle as not supporting multiuse
  < HTTP/1.1 200 OK
  < content-type: text/html
  < Date: Thu, 30 Jul 2020 12:31:37 GMT
  < Connection: keep-alive
  < Transfer-Encoding: chunked
  [...]
```

This verify that everything works. But you can notice on the code above we are making use of **http**, **fs** modules. In order to send a response on a route we using an If statement.

But express , provides an abstraction layer that help us focus writing code on a higher level. Although you are using **http** and **fs** under the hood. Express handles much of this stuff for us.

Lets check the package.json for the express package to confirm this claim.

###### Creating express.

### Summary

Networking - http and TCP

- stateless
- connectionless
- flexible
- Http message

  - start line
  - req: GET /blog http/1.1
  - res: http/1.1 200 ok
  - headers
  - {key:values}
    = content-type: text/html
    = content-type:application/json
    = Cache-control: public, max-age=0
    = Date: Fri, 24 Aug 2018 15:23:58 GMT
    - BLANK LINE
      = body
    - STUFF - HTML , 4K video {binary}, image

- Node server

  - write headers
  - write body
  - used the fs module
  - close connections
  - server.listen
    - using port 3000
    - req, res

- express version

  - express Is Nodejs
  - app === express() === createApplication()
  - server.listen ----> app.listen
  - routers

    - app.get app.post app.delete app.put app.all

  - served up static files, with express.static() middware
  - Middleware => (req,res,next) using app.use()
  - All route methods are examples of midlewares

  201

  - Middleware = is any function that has access to req, res, and next.
  - Networking on the outside, node/express development on the inside.
  - app.use, anytime you see a callback/function (req,res,next) ===>
  - next() is the way to move a piece of middleware foward.
  - express.json() -- body parser
  - helmet() 3rd party module

  Request

- req.ip - contains requesters ip.
- req.path - contains the requesters path.
- req.boty - parsed data

  Response

- res.send .end() sent text/html
- res.sendFile - send a file.
- res.locale - is available through the res
- res.json(jsonp) - sends json back as application/json

### Express

1. express object.
2. HTTP verbs.

HTTP defines a set of request methods to indicate the desired

We use a templating engine, that compiles the templating. which fills in the html.
The templating engines takes in the data and combines it with the html .

We use app.set('view', 'ejs') to set the view engine.

#### Node/Express (server)

3. Middlewares
   app.use()

### Choose your weapon!!

The browser can only read three things HTML, JS , CSS.

#### Server side rendering

res.render()
makes use of sessions , cookies.

- The server is a computer installend **an operating sytem** i.e Linux, windows, unix.
- The second layer is a web server. Apache, node IIS, NGINX, WS . the
- The third layer is the language. c , c++, Java, Python, Ruby , PHP

server rendering ->User makes a request and The server takes in the request, processing the request , takes all the data requirement(may pull data form the database) and create html , js and css. This webpages is then sent back across the wire.

With servers side rendering => The responses are always **html , css and js**.

This approach is not scalable.

#### Api/JSON rendering

res.json()

The user make a request , the server takes in the request,and processes the request, fetch all the data required The server sends back json data.

Instead of responding with a template. We respond with json.

helmet
app.use(express.static('public'))
app.use(express.json())

```
Express send http messages via nodejs
any time your are doing the following

res.json()
res.render()
res.send()
res.sendFile()
res.download()
res.redirect()

you are sending a http message. You are not sending a webpage, Json or a File.

start Line
Headers
---
Body
```
