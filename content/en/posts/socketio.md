---
title: 'Socket IO'
description: 'Socket.IO for real time'
date: 2020-06-28T16:03:42Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 😎
tags:
  - javascript
series:
  - javascript
image: images/cheatsheet.png
---

## Socket.Io Course.

[Githubcodes](https://github.com/robertbunch/socketioTheDetails)

### Pre -Socket.io

Development is like an onion. It got alot of layers. You dont really have center.
There is the confusion of what to learn to learn. Socket.Io sits on top of this layers**web sockets**, With socket io
you dont make **web sockets** , socket.io makes this available.

What to cover in the first section.

1. Tcp
2. Sockets.
3. Web Sockets.

Networking stuff is something intresting and you should know abouts. The
difference between a good developer and a great developer is a great one know how the technology works not just how to use it.

#### TCP

You are an internet user. You connect to the **cloud**. The cloud does not exist, This is
just a whole bunch of computer connected together. The cloud is just computer that does
not belog to you. It just a physical networks of computers.

What gets passed along are called **packets**. This is the data that is being passed
between a **server and clients**. Since you are now intrested in **socket.io** you are now
resposible of the servers.

**Socket.io** is all about networkings.

#### Lets see a packet.

1. Applications. **Http, FTP, SSH, SMTP**
2. Transport. **UDP/TCP**
3. Network. **ip**
4. Link. **wifi, ethernet**
5. Physical. Cables

### TCP and UDP

Your computer **Transport layer** creates **2^16** ports on your computer. Your node
application use **3000** port which is one of the port create.

> #### TCP

Tcp is connection-Based. You have to go through a 3 way handshake.

- Tcp is realiable.
- There is Delivery ackwonolgments.
- Retransmissions of data.
- In-order packets.
- Congestion control.
  - Tcp may be intensionally introduce latency.
    \*\*Applicable for reliable and HTTP

> #### UDP

- lightweight.
  - The headers are very small.
- 8 bytes.
- connectionloss.
- Consistency.
- Send data no matter what!!
  - Packet Loss?
  - Packet out of order.?
- Use with **Video Games**
- Its verys fast but also **unrealiable**.
- **Applicable for Fast and Unrealiable**

## What is a Socket.

1. **Application layer** **HTTP , FTP, SSH**
2. **Transmission layer** \_TCP /UDP\_\_
3. **Network - IP**
4. **Link**
5. **Physical**

**Socket.io** standardize sockets.

Everything running on your computer, is considered as a **process**. Every process has a
tube that data is shared from one process. The **tube** is the **socket**.

Data usually have.

1. **metadata**

   - have source Port.
   - have destination port.

2. **Body**

The header of the **each layer.**

### W.S / Socket.io

1. Client **html/JS: W.S Api , JS Portion**
2. Node Server to fill the requests. **Node and Clients don't know about each others.**
   - Just know about the **web socket**
   - **Socket io ** package is the intepreter.

[The webSocket Api (WebS)](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)

The **websocket Api** is an Advanced technology that makes it possible to open a \*\*two-way
interactive communication session betwen the user's browser and a server. with this
Api,you can send message to a server and receive event=driven responses without having to
poll the server for a reply.

[Node.js websocket library]()

This module does not work on the browser. The client in the docs is a reference toa a
backend.
