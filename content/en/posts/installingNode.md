---
title: "Installing Node.js Tutorial using nvm and using Npm"
description: "Installing Node.js Tutorial using nvim and optimizing nvm to reduce slowing terminal initialization."
date: 2020-07-04T10:45:17Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
authorImage: "/images/whoami/smile.png" # image path in the static folder
tags:
- Javascript
categories:
- Productivity 
- cli
series:
- workspace

pinned: true
---

As with any Programming language, platform, or tool, the first step to using it is getting it installed. Many of them typically comes with a speedy way to upgrade when a new version is available.

By default, there's not a way to upgrade the version of __Node.js__ you've got from within Node.js itself. That said, there's a fantastic tool for the community called nvim that allows you to manage the version of Node.js that you've got installed locally.

One awesome aspect of __nvm__ is that it manages the versions of Nod.js, it doesn't just upgrade them. This means you cna have the latest version of Node.js, te latest version of all the LTS release lines, and any number of other verisons you want to use or test as well.

In this quick tutorial, we'll take a look at how to install nvm, and the how to start using it as your version manager form Node.js. Once we've completed the tutorial, you'll be ready to take the next step with Node.js.

This guide covers installing nvim on linux. 

###  Installing Nvm and then Node.

Here's the abbreviated guide, highlighting the major steps:


{{<boxmd>}}
**1. Download the nvim install script via curl:**
```bash
 curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
```
__2. Now add these line to your ~/.bashrc , ~/.profile ,~/.zshrc file to have it automatically sourced upon login:__

```bash
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm.
```
__3. Ensure that nvim was installed correctly with `nvm --version` which should return the verison of nvm installed.__
```bash
nvm --version
```
__4. Installing the versin of Node.js you want.__

- Install the latest version with **nvm install node**
- Use the latest version with **nvm use node**
- Install the latest LTS version with **nvm install --lts**
- Use the latest LTS version with **nvim use --lts**
{{</boxmd>}}


### Using nvm to manage Node.js

Congratulations! You've now got `nvm - a tool to easily allow you to manage and swap out the versions of Node.js you've got installed locally`. Now, let's get you started with doing just that.

#### Install the latest Node.js version
To install the latest available version of Node.js, you can use the following command:

```bash
nvm install node
```

Next, to use that version of Node.js in any new shell, you can simply run the use command:

   
### Install the latest Node.js LTS version
To install the latest available LTS version of Node.js, you can run the following command:

```bash
nvm install --lts
```
And to use that latatestTS version of Node.js in any new shell, you can simply run the use command:

```bash
nvm use --lts     
```
List available verison using __ls-remote__.

```bash
nvim ls-remote
nvim ls-remote --lts
```
#### Fixing nvm slowing terminal initialisation.
This solution was taken from here [growingwithweb.com](https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html). Feel free to read the blogpost to understand what is written. When i started using **nvim** , since then my terminal has been very slow to start up.  The root cause of the problem is that the initialisation script, the one that gets added to your **~/.bashrc** or **~/.zshrc** on install takes about 500ms to run. The reson for this slowness is because nvim is written completely in bash.

From the blog above , the following solution was arrived at. 

```bash
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi
```
This versiond will defer **nvm** initialisation until either **nvm** , **node** or npm is run, at which point it will also unalias all the command so they work of the **PATH** as normal and run the requested command. It also contains the niceties that comes standard such as checking for the files and bash completion.

Few more improvements to handle a larger number of commands more easily in order to cover my commaon golbally installed **npm** cmmands. 

```bash
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(type -t __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
```



