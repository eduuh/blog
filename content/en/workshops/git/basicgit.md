---
author: "Edwin Muraya"
title: "Basic Git WorkShop"
date: 2020-11-08T12:00:02+38:00
description: "Learn how to use git to be great."
draft: true
hideToc: true
enableToc: false
enableTocContent: true
authorEmoji: 👻

tags:
- cli 
series:
- git
- devops

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

## Learning Objectives

{{<boxmd>}}

1. **Get to Learn what Git is**
2. **Learn about some Usefull linux tools**
3. **Learn basic Cli tools.**
4. **Tip and Tricks when Using Git**
5. **Learn How to use Git To Understanding Opensource Project**
6. **Practical Uses of Git as a daily driver apart from projects**
   {{</boxmd>}}

### Requirements

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

From these step lets continue stepwise.

##### 0. To use git we'll be using the Terminal.

If you don't have much experience with the terminal and basic commands. I will try my best to explain alot of the stuff as we go along. Some of the reason i choose to use command Line. In command line, you can't get away without learning, but using a gui you can work with tools even without understanding to how they work.

1. With command line you can easily build repeatable data processes.
2. Command line skills make you more flexible.
3. It's Less resource intesive.
4. Unix shell skills Transfer well to other shells.
5. If you type faster, you are more productive.

##### 1. **First-Time Git Setup.**

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
**\$ git config \-\-list \-\-show-origin**
{{</boxmd>}}

##### Lets set Your Identity.

The first thing you should do when you install Git is to set your **user name and email address**. This is important information since **git commit** uses this information. Make sure you replace the values with you informations preferably the same information as **github**.

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

##### 2. Standard ways to get help.

There are a few ways to **learn about a command** in **linux**. Whether you are and **inexperienced terminal user or experienced**, you won't always know the right thing to type into the Linux Terminal. There are quite a few tools build into the terminal to help you along.

The formats to get get help are in the form: All this form are usually equivalet they will give you the same **man pages**.
{{<boxmd>}}
**1. \<command> help \<verb>**
**2. \<command> \<verb>**
**3. \<man> \<commad> \<verb>**
{{</boxmd>}}

We just installed git, Lets see how we could get help for any command in git.

```bash
man git
man git init
git help init
```

Lets understand a man Page. 👇

![man pages](/images/git/gitbasic/man.png)

The **man** command shows detailed manulas for each command.

If you just want to see a general overview of the commands. You could use the **shorthand version**

```bash
git init -h
```

![git shorthand version](/images/git/gitbasic/helpsh.png)

Some more examples for the **shorthand help** command.

{{<boxmd>}}
**git add -h**
**git init -h**
{{</boxmd>}}

##### 3. Lets Create a Directory and Navigate into It.

To begin, open up a terminal and move where you want to place the project on your local machine using the **cd (change directory)** command.

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

##### 4. Lets initialize our git Repository.

To initialize is to create a **git repository** using the **init** command. When creating a new project on your local machine using git, you'll first create a new **repository** (or often 'repo', for short)

{{<boxmd>}}
**git init**
{{</boxmd>}}

![git init](/images/git/gitbasic/gitinit.png)

##### 5. Let add a few files.

If your project is **open source** it usually a good idea to add a **License file**. I will use an **npm tool** to generate the license to our repository.

Lets first install the **tool**. Assuming you had installed node. If you haven't you should install nodeJs.

```bash
sudo npm i -g generate generate-license
```

Once installed lets use the command **gen license.** After that run **ls** command to confirm you file is generated.

```bash
gen license:mit
# enter your author name
ls
```

![generate mit](/images/git/gitbasic/genmit.png)

👆 **ls** command is used to list out files in a directory.

{{< alert theme="success" dir="ltr" >}}
**Lets learn how git thinks of files.**
{{< /alert >}}

Files in git are usually in either two states:

1. **Tracked.**
2. **Untracked files.**

Right now in our **local repository** we have a single file **license**. To find out the state of the file we use the **git status** command.

![status files](/images/git/gitbasic/status1.png)

{{< alert theme="success" dir="ltr" >}}
👆 **LICENSE** file is untracked. From this Take note that **new files** you add to your repository will be untracked by default. **Untracked files** message means that there's a file in the directory that Git isn't keeping track of.
{{< /alert >}}

We could request git to track our file using the **git add** command. After the command make sure you run **git status**

{{<boxmd>}}
**git add LICENSE**
{{</boxmd>}}

![git add](/images/git/gitbasic/gitadd.png)

👆 git knows that **LICENSE** is a **new file**.

##### 7. Lets save a snapshot of a file to our git repository.

{{<boxmd>}}
**git commit -m "Added MIT license to our repository"**
[master (root-commit) 04a57fe] Added MIT license to our repository
1 file changed, 21 insertions(+)
create mode 100644 LICENSE
{{</boxmd>}}

##### 8. Lets Make a change to the file.

The change could be changing the **authors name**. Open the file with your editor and manually edit the authors name. After you do that run **git status**.

![git status](/images/git/gitbasic/status.png)

👆 git knows that **LICENSE** is a **Modified**.

**Note** the modifications are not automatically save by git. You will still need to explicity save them.

{{<boxmd>}}
**git add LICENSE**
**git commit -m "Change the Licenses Author name"**
{{</boxmd>}}

![git commit1](/images/git/gitbasic/gitcommit1.png)

{{< alert theme="success" dir="ltr" >}}
I have show you how to, now lets jump to the **why** we are doing this.
{{< /alert >}}

![git areas](/images/git/gitbasic/gitareas.png)

##### The working Tree

The working Tree is the are where you are currently working. It is where your files live. This are is also know as the **untracked area of git.** If you make changes here you and dont explicity save them to git, you will lose the changes made to your files.

This loss of changes occurs because git is not aware of the files or changes in the **working directory** until you tell it to pay attention to theme.

##### The Stagin Area(Index)

The **Stagin Area** is when git start tracking and saving changes that occurs if files. This changes reflect in the **.git** directory. You tell git that I want to track these specific files, the git says okay and moves them from your working Tree to the Staging Area.

How do you add files to your stagin Area? Running the command **git add <filename>**. If you want to add the whole tree run the command **git add .**

#### The Local Repository.

The Local Repositroy is everything in your .git directory. Mainly what you will see in you local Repository are all your checkopoints or commits. It is area that saves everthing **so don't delete it**

This are all the steps we did.

{{<boxmd>}}

1. **touch README** . Touch command adds a new file to the directory.
2. **ls** to confirm 2 files.
3. **git status** to see the status of the repository.
4. **git add README** to **stage** the file.
5. **git status** to see what happens.
6. **git commit -m "Added readme file to repository"** to save to the .git folder.
7. **echo "## our Open source project" > README** to add the line to the file.
8. **git status**
9. **git add README**
10. **git commit -m "Added a heading line to README file"**
    {{</boxmd>}}

##### file movement diagram. Understanding git Snapshot concept.

I want to show you how you could lose your changes without event knowing about it.

- Create a new file **README**. A new file is **empty**.

{{<boxmd>}}
**touch README**
{{</boxmd>}}

- Lets add README to the staging are using **git add**. Git add a Snapshot of README to the staging area. **Note the snapshot is empty** also run a **git status**

{{<boxmd>}}
**git add README**
{{</boxmd>}}

- Lets add some content to the file using the **echo** command. If run **git status\* you will notice that the file is **modified\*\*.

{{<boxmd>}}
**echo "## Understnding concept of snapshot" > README**
{{</boxmd>}}

- Lets commit our changes. Now what git does. It took the file from the stagin area and commit/stored it to our git directory.

{{<boxmd>}}
**git commit -m "Added readme file"**
{{</boxmd>}}

- Lets see all the files that are in the **.git** repository using the **git ls-files**.Makes sure you see the **README** file.

{{<boxmd>}}
**git ls-files**
{{</boxmd>}}

- Before you remove the README file lets confirm the files content with **cat** command.

{{<boxmd>}}
**cat README**
{{</boxmd>}}

- Lets remove the README file that is in my **working directory** and then restore it from the **git repository**, and confirm if our content made it to our repository.

{{<boxmd>}}
**rm README**
{{</boxmd>}}

- confirm the file files is gone with the **ls** command.

{{<boxmd>}}
**ls**
{{</boxmd>}}

- Check the **git index** again to see, if removing a file from the **working directory** has an effect to the **git repository.**. You find that the README file is intact.

{{<boxmd>}}
**git ls-files**
{{</boxmd>}}

- Lets restore our README file from our git repository to our working directory using the **restore** command.

{{<boxmd>}}
**git restore README**
{{</boxmd>}}

- Finaly lets check the content of the file. What you notice is that **your file is empty**.

{{<boxmd>}}
**cat README**
{{</boxmd>}}

The files is empty since you did not add the changes to staging area. The write way to do this could be, to avoid losing your work.

- Lets add a new file **CONTRIBUTING.md**

{{<boxmd>}}
**touch CONTRIBUTING.md**
{{</boxmd>}}

- Run **git status**. CONTRIBUTING.md is **untracked file**

```bash
git status
```

- Add CONTRIBUTING.md to the staging area.

```bash
git add CONTRIBUTING.md
```

- Add content to the CONTRIBUTING.md file.

```bash
echo "## Contributing code of conduct" > CONTRIBUTING.md
```

Note the **>** character is used to replace the content of a file. To append new content at the end of the file you use **>>**

```bash
echo "1. Be good to people" >> CONTRIBUTING.md
```

- Lets see the content of the file

```bash
cat CONTRIBUTING.md
```

- Add the changes. Tells git to make a new snapshot with the **changes.**

```bash
git add CONTRIBUTING.md
```

- Lets DELETE all the files . When we use **git** to restore them.

```bash
rm  *
```

- is a wildcard with a meaning of **all files**. Not by default **rm** commands cannot delete directories. **.git** folder is **safe**.

- confirm all files are gone.

```bash
ls -la # -a used to list out hidden files.
```

##### 9. Lets do a review of what we just did.

##### 10. lets remove file from the repository.

All we have done is added files to the repository. Now lets remove the a file from repos
when you remove files from the repository. git provides commands to remove files from .git **git rm** deletes files from repository + filesystem.

Note: **git rm** does not remove file from the **index** until you commit your changes.

##### 11. git log --list commits

Logs options

- p stands for **patch** (small changes/feauture)

  commits + changes {big}
  {{<boxmd>}}
  **git log -p**
  {{</boxmd>}}

commits + changes {big} anly 2 changes.
{{<boxmd>}}
**git log -p 2**
{{</boxmd>}}

commits + changes {big} anly 2 changes.
{{<boxmd>}}
**git log -p 2**
{{</boxmd>}}

commits + changes {big} anly 2 changes.
{{<boxmd>}}
**git log --stats 2**
{{</boxmd>}}

online shows **commitid** and **commitmessage**

{{<boxmd>}}
**git log --pretty=online**
{{</boxmd>}}

{{<boxmd>}}
**git log --pretty=online --graph**
{{</boxmd>}}

You could also use since=2.weeks

{{<boxmd>}}
**git log --pretty=online --graph --since=2.weeks**
{{</boxmd>}}

Since takes can also take in **hours**, **minutes**.
If you are working with a few more people , you could decide to view logs for a **specific** person.

Typing the above command is not ideal. Git has a concept of **aliases**, a method of shortening long commands to a small command. you could want to do something like **git tree** to rep **git log --pretty=online --graph**

To create aliase for git we use the **git config** command with the format.

{{<boxmd>}}
git config alias.tre = "log --graph"
git config alias.tr = "command"
{{</boxmd>}}

#### Undoing Things. (I undo stuff all the time, so do you)

A scenario is that you commit files. Later you realize you did not commit all the files in that commit and you don't want to create a commit for a single file. Don't worry you can change this. Git will not edit the commit, it will create a new commit with your file in there. To create a new commit with all your files using **git commit --amend**

{{<boxmd>}}
touch app.js
console.log('Hello world')
git add app.js
git commit --amend
{{</boxmd>}}

###### Working with remotes.

To be able to collaborate on a git project you will need to manage a **remove repository**.Remote repository are version of your project that are hosted on the **internet** or **network somewhere**.

Working with remotes is the ability to **upload** and **download** you code from other computers i.e **github**,**azure devops** , **gitlab**

- git term for downloading is **cloning**
- git term for uploading is **pushing**

Note you are not limited to using one **remote** from your project. You could use **multiple git servers**

When we communicte through the internet. there are some stuff that are usuall involved.

1. **Protocals** - Http , ssh
2. **Url** - location on internet.

**Most git servers** both **http and ssh** for a moment.

**Https** stands Hypertext Transfer protocal secure. Used for a secure communication protocal using **TLS, SSL**. We could either have.

1. Http over TLS.
2. Http over ssl

- **github support** file uploads and downloads using both **Http and ssh**. Both protocals have **unique urls**.

**SSH**. using ssh protocal, you can connect and authenticate to remote servers using **ssh keys**. This requires setting up **ssh** and adding your public key to github.

- Lets start of with **http**, we will come back to **ssh** later. Http require sign in with **username** and **passwords** or use of tokens.

##### Lets go to github.

1. go to site **github.com/eduuh**.
2. Create a remote repository. Click on a new repository.
3. Have a choice of either public or private.
4. Set a description.
5. Lets connect that remote repositry to our local repository.

When you create a new repository on github you get a **quick setup** documentation. You have an option to select either **https or ssh**.

When we want to push an existing repo from cli.

- Tell the local repository the url to point to in the internet.

```bash
git remote add origin https:
```

- The second command creates a branch.

```bash
git branch -M main
```

- To upload your local repository to **git repository**.

```bash

```

- But we are not limited to this set up we could create multiple remotes. I don't know of a case you would want to do this. But why not? let do try.

- When we create an **agile project**.

  - By default **azure devops has more to offert that github**
    - **git server (azure Repos)**, **Azure boards (planning)**, **Pipelines**

- With github you could also achieve alot without **azure devops** with **github actions**.

- To add a second remote url you could run the command.

```bash
git remote add devops "url"
```

- To list out the available remotes for a project you could use the command.

```bash
git remote -v
```

#### Fetching and Pulling from Remotes.

- By default github uses the **main** branch.
- **git(locally)** uses the **origin** as the default remote.

```bash
git push origin main
```

- To push to the other remote.

```bash
git push devops main
```

- To download(clone) code you would use the command.

```bash
git pull devops
```

##### Removing remotes / Renaming.

- To view all the remotes (available)

```bash
git remote -v
```

- To rename the remote files.

```bash
git remote rename devops dev
```

- To remove a remote.

```bash
git remote remove devops
```

#### Review of the Process.

- Create a **local repository**
- Added files and commited them to the git repo.
- Create a new project
- Specify public/ private.
- Set decription.
- Take Http url from github.
- Set remote
- Create an online branch from **cli**
- Push the repository to github.

These are 9 steps to upload some files to a server. This is not ideal. You need to be a little bit efficient. This is where [hub](https://github.com/github/hub) comes in.

Hub is a **command-line tool** that makes git easier to use with **github**. It wrap **git** in order to extend it with extra features and commands that make working with github easier. Hub has **man page**.

###### Installing hub.

Install it from your package manager.

```bash
sudo pacman -S hub
```

- Confirm installation by checking the version of hub. The command should show the version of **git and hub**

```bash
hub version
```

- Tell hub that you prefer **https** to ssh git clone urls.

```bash
git config --global hub.protocal https
```

##### Stay Productive on the commandLine.

Hub makes it easy to **clone or create** repository, browse project page, share logs or code snippets via **gist**.

- Clone you own project.

```bash
hub clone dotfiles
```

- Open current project's issues pages.

```bash
hub browse --issues
```

- To delete our repo from github. By default the **token** given out to hub tool, does not have delete functionally enabled by default. But you could enable it in the **settings> developer settings> activate/check > delete repo**

```bash
hub delete test
```

confirm delete by typing **yes**.

##### Lets remove remotes for our repository.

```bash
git remote remove dev
git remove remove origin
```

Using hub reduces the 9 step to only two step. Lets create repository on github using hub from cli.

```bash
hub create -p -d "Learn the basics of git and tips to using gits."
```

```bash
hub push origin main
```
