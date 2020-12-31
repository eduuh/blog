---
title: 'Quickly Navigating to Specific Parent Directory Using bd'
description: 'Quckly navigating directory to specific Parent Directory using bd command in Linux'
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 🤖
tags:
  - linux
categories:
  - cli
---

To come back to previous directory then you have to type **cd ..**. To go back to directories then you have to type **cd ../..**. It's normal in Linux but if you want to come back from 10th directory to **4th** directory, then it's horrible to use cd.

To handle the situation easily we have a solution in Linux , we can go with bd commands.

### What's is bd command?

**bd** command allows users to quickly go back to a parent directory in Linux instead of typing **cd ../../../** repeatedly.

You can List the contents of a given directory without mentioning the full path.

```bash
ls `bd_Direcotory_Name`
```

It supports following other commands such as **ls, ln , echo, zip, tar** etc.

Also , it allow us to execute a shell file without mentioning the full path **bd**.

```bash
'bdp/shell_file.sh'
```

### Installing Bd in commandLine.

This is how got to set up bd on my **Arch linux** installation.

```bash
sudo wget --no-check-certificate -O /usr/local/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd
sudo chmod +rx /usr/local/bin/bd
```

I then created a Alias to my **aliasrc** file. The file is located at **~/.config/aliasrc**

```bash
alias \
	bd=". bd -si"
```

### Add AutoCompletion to Your bd setup.

```bash
wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd
```
