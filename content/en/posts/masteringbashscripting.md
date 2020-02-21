---
title: "Mastering the Power of Bash"
date: 2020-01-21T05:16:56+03:00
draft: true
linktitle: "Bash Scripting"
title: "Quickstart to Installing React and React ES6 Review"
categories: ["Javascript","Frontend"]
tags: ["React"]
weight: 30
author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---
#### Introduction to Bash Scripting

Welcome to the what and why of bash scripting. My name is `eduuh`. Am tending to become more intrested with the bash scripting as time passes. I want to sort of become able to automate any manual proccess in my workflows.


Topics to cover in the book.

1. Bash vulnebilities
2. The bash command hierachy
3. Preparing the text editor for scripting.
4. Creating and executing scripting.
5. Debugging your scripts.

#### To get to know the system you are on
```bash
$ lsb_realease -a
$ # check the bash version
$ echo $BASH_VERSION

```

#### The command hierachy

Linux type of cammands are as follows
    
    Aliases
    Functions
    shell built in
    Keywords
    Files

The list above represent the order in which they are searched in the linux system.

```bash
$ # using type of to determine the type of command
$ type ls
ls is aliased to `ls --color=auto'
```
```bash
$ # using the -a option 
$ type -a ls
ls is aliased to `ls --color=auto'
ls is /usr/bin/ls
ls is /bin/ls
```
If we just need to determine the type of the command we use the `-t` option. This is useful when we want
to know the type of command in our system.

```bash

    $ type -t ls
    alias
```
`Type` command can also be used to identify the bash keywords and it could receive multiple arguements.

```bash
    $type ls pwd cd function if do
    ls is aliased to `ls --color=auto'
    pwd is a shell builtin
    cd is a shell builtin
    function is a shell keyword
    if is a shell keyword
    do is a shell keyword
```
#### Command PATH
Linux shell will check for executable in the loctions in the `enviroment variable` when the full of the
relative path of the command is supplied.It is possible to include our current directory to the path varible using the export command. 

```bash
export PATH=$PATH:.
```
This will append the value of the current directory in the path variable separated by a `comma ,`
You could create a folder in your home directory and add it to your path. using the export command.

```bash
 $ mkdir $HOME/bin
 $ export $PATH=$PATH:$HOME/bin
```
#### Preparing the Text Editor for Scripting
##### Configuring vim for this!! 
You could use the graphical text editor for this if you prefer. Setting up common options makes our life easier in the editor and it will improve our everyday productivity and the consistency we need.