---
author: "Edwin Muraya"
title: "Basic Git WorkShop"
date: 2020-11-08T12:00:02+38:00
description: "Learn how to use git to be great."
draft: true
hideToc: true
enableToc: true
enableTocContent: false
authorEmoji: 👻
tags:
- Cli 
categories: 
- Git
series:
- git
- DevOps
image: images/git/giticon.png
pinned: true
author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description

pinned: true
---

Welcome, lets get into the task ahead.

### Learning Objectives

{{<boxmd>}}

1. **Get to Learn what Git is**
2. **Learn about some Usefull linux tools**
3. **Learn basic Cli tools.**
4. **Tip and Tricks when Using Git**
5. **Learn How to use Git To Understanding Opensource Project**
6. **Practical Uses of Git as a daily driver apart from projects**
   {{</boxmd>}}

#### Requirements

1. **Command Line** that support unix style commands.
2. **node > 8.0.** We will be using some npm cli tools\_
3. Some **npm packages** Install them once with the command 👇
   **npm install --global generate generate-gitignore generate-license**
4. **git version > 2.0** (check with git --version)
5. Create a **[github.com](https://www.github.com)** account
6. Create a **[Azure Devops](https://www.dev.azure.com)** account
7. (**github/hub**)[https://github.com/github/hub]

### Lets Get started.

<hr>

#### What is Git?

**Version control** is a system that records changes to a files or set of files over times so that you can recall specific version later.

- Git was initially designed and developed by **Linus Torvalds** for linux kernel development.
- Git is a free software distributed under **GNU General License Version2**.

Git manages the Version of **Files**. Nearly **any type of files** on a computer.

- Some **Opensources books** are version controlled.
- You could use git for **markdown notes**.
- For Graphic or Web designers. you could want to **keep every version of an image or layout**.
  We will install all the above tools when we get to using them .

Using Git is Wise as a Developer since.

1. It allow you to **revert** selected files back to a previous state.
2. Revert the entire project back to previous state.
3. Compare changes over time.
4. See who last modified something that might be cousing problems.
5. To view who instroduced an issue and when, and more.

Using **version control system vcs** means that if you screw things up or lose files, you can easily recover with little overhead.

Git s

##### Lets install / Verify Our installs

{{< tabs Arch Ubuntu windows>}}

{{<tab>}}

**Arch and Manjaro we use pacman package manager.**

When Installing Git . Ensure you install the **latest version of git** by first updating your distribution to ensure their are using the latest sources.

{{< alert theme="danger">}}
**sudo pacman -S git**
{{< /alert >}}

![arch installation image](/images/git/gitbasic/pacman.png)

{{<boxmd>}}
let's check if git is working correctly
\$ **git version**
{{</boxmd>}}

{{</tab>}}
{{<tab>}}

**Debian-based Distribution, such as Ubuntu**
{{< alert theme="danger">}}
**sudo apt install git**
{{< /alert >}}

![Debian based distribution](/images/git/gitbasic/ubuntu.png)
{{</tab>}}

{{<tab>}}

- Installing **git.**
  - [visit git scm site and download the executable](https://git-scm.com/) - After you have the exe. Install you normally do with other software.
    {{</tab>}}

{{< /tabs >}}

<hr>

> ##### First-Time Git Setup.

Git comes with a tool called **git config** that lets you get and set configuration variables that controls all aspects of how Git looks and operates. These varible can be stored in three different places.

1. **/etc/gitconfig** file.
   System wide configurations. Configures git for all users on the system. To set configuration at this level with the **git config** tool you pass in option **\-\-system**

   - Because this is a system configuration file, you will need **adminstrative or superuser privileges** to change it.

2. **~/.gitconfig** or **~/.config/git/config** file.
   Git configuration specific personally to you, the user. You can make Git read and write to this file specifically by passing the **\-\-global** option.

3. **config**
   File specific to the git directory (that is **.git/config**) or whatever repository you're currently using. You can force Git to read and write to this file with the **\-\-local** option.

Each level overrides values in the Previous level, so values in **.git/config** trump those in **/etc/gitconfig**.

To show all your setting and where they are coming from use.

{{<boxmd>}}
**\$ git config --list --show-origin**
{{</boxmd>}}

##### Your Identity.

The first thing you should do when you install Git is to set your **user name and email address**. This is important information since **git commit** uses this information.

{{<boxmd>}}
**git config --global user.name "eduuh"**
**git config --global user.email "edwin@github.com"**
{{</boxmd>}}

Many of the **GUI** tools will help you do this when you first run them. My attempt 👇

![Authoship attempt](/images/git/gitbasic/author.png)

This information is added to the **~/.gitconfig** file. You can confirm with

{{<boxmd>}}
**cat ~/.gitconfig**
{{</boxmd>}}

##### Standard ways to get Help from CLI

##### Lets Create a Directory and Navigate into It.

- **mkdir** is a cli tool used to make directories.
  {{<boxmd>}}
  **mkdir gitbasics**
  {{</boxmd>}}
- We have created an empty folder. Lets navigate into it

- **cd** using to **change directory**

  {{<boxmd>}}
  **cd gitbasics**
  {{</boxmd>}}

![createdire](/images/git/gitbasic/createdir.png)

```

```

```

```

