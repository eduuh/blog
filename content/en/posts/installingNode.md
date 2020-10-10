---
title: 'Using Node with Nvm'
description: 'Installing Node.js Tutorial using nvim and optimizing nvm to reduce slowing terminal initialization.'
linktitle: 'Installing Node.js with Nvm'
date: 2020-07-04T10:45:17Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
authorImage: 'images/whoami/smile.png' # image path in the static folder
tags:
  - nvm
  - cli
category:
  - development
series:
  - Node.js
---

As with any **Programming language, platform, or tool**, **the first step to using it is getting it installed.** Many of them typically comes with a speedy way to upgrade when a new version is available.

By default, there's not a way to upgrade the version of **Node.js** you've got from within Node.js itself. That said, there's a **fantastic tool for the community called [nvm](https://github.com/nvm-sh/nvm) that allows you to manage the version of Node.js that you've got installed locally**.

**nvm** is a version manager for **node.js**, designed to be installed per-user, and invoked per-shell. nvm works on any **POSIX-compliant shell (sh, dash, ksh, zsh, bash)** in particular on these platforms: **unix, macOs and Windows wsl**

One awesome aspect of **nvm** is that it manages the versions of Node.js, it doesn't just upgrade them. This means you can have:

{{<boxmd>}}

1. **The latest version of Node.js.**
2. **The latest version of all the LTS release.**
3. **And any number of other versions you want to use or test as well.**
   {{</boxmd>}}

In this quick post, **we'll take a look at how to install nvm**, and the **how to start using it as your version manager for Node.js**. Once we've completed the tutorial, you'll be ready to take the next step with Node.js.

This guide covers installing **nvm on linux**. Note that **nvm is a bash script** ,it work on linux installations. Enough is said, so lets gets to it.

#### Installing Nvm

Here's the abbreviated guide, highlighting the major steps:

{{<boxmd>}}
**1. Download the nvim install script via curl:**
{{</boxmd>}}

When you look at the link below 👇. You will notice there is a **version number (v0.36.0)**. Please, I don't want you to install outdated version of nvm, in regards to when you are reading this. Check the up to date script form [github](https://github.com/nvm-sh/nvm)

```bash
 curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.36.0/install.sh | bash
```

**2. Now add these line to your ~/.bashrc , ~/.profile ,~/.zshrc file to have it automatically sourced upon login:**

```bash
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm.
```

**3. Ensure that nvm was installed correctly with `nvm --version` which should return the verison of nvm installed.**

```bash
nvm --version
```

**4. Installing the version of Node.js you want.**

{{<boxmd>}}

- Install the latest version with **nvm install node**
- Use the latest version with **nvm use node**
- Install the latest LTS version with **nvm install --lts**
- Use the latest LTS version with **nvim use --lts**
  {{</boxmd>}}

#### Using nvm to manage Node.js.

<br>

Congratulations! You've now got **nvm - a tool to easily allow you to manage and swap out the versions of Node.js you've got installed locally**. Now, let's get you started with doing just that.

##### 1. Install the latest Node.js version

To install the latest available version of Node.js, you can use the following command:

{{<boxmd>}}
**nvm install node**
{{</boxmd>}}

Next, to use that version of Node.js in any new shell, you can simply run the use command:

##### 2. Install the latest Node.js LTS version

To install the latest available LTS version of Node.js, you can run the following command:

{{<boxmd>}}
**nvm install \-\-lts**
{{</boxmd>}}

And to use that latatestTS version of Node.js in any new shell, you can simply run the use command:

{{<boxmd>}}
**nvm use \-\-lts**
{{</boxmd>}}

List available verison using **ls-remote**.

{{<boxmd>}}
**nvim ls-remote**
**nvim ls-remote \-\-lts**
{{</boxmd>}}

#### Fixing nvm slowing terminal initialisation.

<hr>

When I started using **nvm** , since then my terminal has been very slow to start up. The root cause of the problem is that the **(nvm) initialisation script**, the one that gets added to your **~/.bashrc** or **~/.zshrc** on install takes about **500ms to run**. The reason for this slowness is because nvim is written completely in bash.

Summarized problems you will face when you add the above line in your **.bashrc** or **.zshrc** is that:

- **nvim will add an overhead startup on near 500 Milisecond which is noticable, and your terminal initialisation will seem slow.**
- **Since you are adding the script to bashrc or zshrc. The script will run each time you open a new terminal instance. Considering its not frequetly needed script.**

This solution was taken from here [growingwithweb.com](https://www.growingwiththeweb.com/2018/01/slow-nvm-init.html). Feel free to read the blog post to understand what is written. From the blog above , the following solution was arrived at.

**Replace the nvm call you had added to bashrc with the following.**

```bash
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi
```

This version 👆will defer **nvm** initialisation until either **nvm** , **node** or npm is run, at which point it will also unalias all the command so they work of the **PATH** as normal and run the requested command. It also contains the niceties that comes standard such as **checking for the files and bash completion.**

Few more improvements to handle a larger number of commands more easily in order to cover my commonly globaly installed **npm** cmmands.

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

Thanks for reading this post.
