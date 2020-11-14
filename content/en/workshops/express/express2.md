---
date: 2020-07-11T16:02:40+03:00
draft: true
linktitle: 'Express'
title: 'Express'
description: 'Express is a minimal and flexible Node.js web application Framework that provides a robust set of features for web and mobile application.'

image: images/bash/bash.png
author: eduuh #author name
authorEmoji: 🤖
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---

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
