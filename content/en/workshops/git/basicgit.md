---
author: "Edwin Muraya"
title: "Basic Git WorkShop"
date: 2020-11-08T12:00:02+38:00
description: "Learn how to use git to be great."
draft: false
hideToc: true
enableToc: false
enableTocContent: false
authorEmoji: 👻

tags:
- cli 
series:
- git
- devops

image: images/git/giticon.png
author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorDesc: Selftaught Web and Mobile Developer # author description
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
7. **Automation with github worflow**
8. **Creating a portfolio static site and deploying it azure with github pages.**
   {{</boxmd>}}

#### Requirements

1. **Command Line** that support unix style commands.
2. **Choose editor**.
3. **node > 8.0.** We will be using some npm cli tools\_
4. Some **npm packages** Install them once with the command 👇
   **npm install --global generate generate-gitignore generate-license**
5. **git version > 2.0** (check with git --version)
6. Create a **[github.com](https://www.github.com)** account
7. Create a **[Azure Devops](https://www.dev.azure.com)** account
8. [github/hub](https://github.com/github/hub)

##### Step one: Installations.

#### This is your checklist:

- [] Access to terminal.
- [] Install Git.
- [] Sign up for a **github account**.
- [] Choose editor.

##### Step 1: Work Environments: Access To Terminal.

- **Mac**: use **Terminal**
- **Windows**:
  - Option 1: [Power shell](https://www.digitalcitizen.life/simple-questions-what-powershell-what-can-you-do-it)
  - Option 2: **Git bash**.
  - Option 3: **Use WSL (Ubuntu) (must be installed prior to workshop) (for advanced users)**
- **Linux**.

##### Step 2: Installation of Git.

- **Mac**: [Git for mac download](https://git-scm.com/download/mac)
- **Windows**:
  - [Git for Windows (Git Bash)](https://gitforwindows.org/)
- **Linux**:
  [Install Git on Linux](https://www.atlassian.com/git/tutorials/install-git#linux)

Confirm Git is installed by typing `git --version` on your terminal

##### Step 3: Sign up for a GitHub Account

- [github.com](https://github.com/)
- Save your **user ID and password** somewhere you can easily find it

##### Step 4: Choose a Graphical Editor

- Try Visual Studio Code
  - [Visual Studio Code](https://visualstudio.microsoft.com/downloads/)
- OR one of these other editors
  - [Sublime Text 3](https://www.sublimetext.com/)
  - [Atom](https://atom.io/)
  - [Notepad++](https://notepad-plus-plus.org/) (for Windows)
- R users: can use RStudio's editor

##### What is Git. ?

Git is a distributed **version control** system.

<hr>

##### Command Line Basics.

##### Standard ways to get help.

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

##### Lets set Your Identity (on local computer).

The first thing you should do when you install Git is to set your **user name and email address**. This is important information since **git commit** uses this information. Make sure you replace the values with you informations preferably the same information as **github**.

{{<boxmd>}}
**git config --global user.name "eduuh"**
**git config --global user.email "edwin@github.com"**
{{</boxmd>}}

Many of the **GUI** tools will help you do this when you first run them. My attempt 👇

![Authoship attempt](/images/git/gitbasic/author.png)

This information is added to the **~/.gitconfig** file. To verify these additions, type:

<kbd> git config --list </kbd>

{{<boxmd>}}

**cat ~/.gitconfig**
{{</boxmd>}}

As a helpful step, you may want to set Git to use your favourite editor. I believe in windows you will have to enter the fullpath, of the software if you did set it during installation.

```bash
git config --global core.editor code
```

##### Lets Create a Directory and Navigate into It

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

##### Lets initialize our git Repository

To initialize is to create a **git repository** using the **init** command. When creating a new project on your local machine using git, you'll first create a new **repository** (or often 'repo', for short)

{{<boxmd>}}
**git init**
{{</boxmd>}}

![git init](/images/git/gitbasic/gitinit.png)

For the curius, you should also see the **.git** subdirectory. This is where all your repository's data and history is kept.

```bash
ls -a .git
```

you will see 👇.

```bash
branches  config  description  HEAD  hooks  info  objects  refs
```

##### Let add a few files

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

###### 7. Lets save a snapshot of a file to our git repository.

{{<boxmd>}}
**git commit -m "Added MIT license to our repository"**
[master (root-commit) 04a57fe] Added MIT license to our repository
1 file changed, 21 insertions(+)
create mode 100644 LICENSE
{{</boxmd>}}

###### 8. Lets Make a change to the file

The change could be changing the **authors name**. Open the file with your editor and manually edit the authors name. After you do that run **git status**.

![git status](/images/git/gitbasic/status.png)

👆 git knows that **LICENSE** is a **Modified**

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

Lets talk about the areas of git

##### The working Tree

The working Tree is the are where you are currently working. It is where your files live. This are is also know as the **untracked area of git.** If you make changes here you and dont explicity save them to git, you will lose the changes made to your files.

This loss of changes occurs because git is not aware of the files or changes in the **working directory** until you tell it to pay attention to theme.

##### The Stagin Area(Index)

The **Stagin Area** is when git start tracking and saving changes that occurs if files. This changes reflect in the **.git** directory. You tell git that I want to track these specific files, the git says okay and moves them from your working Tree to the Staging Area.

How do you add files to your stagin Area? Running the command **git add <filename>**. If you want to add the whole tree run the command **git add .**

##### The Local Repository

The Local Repositroy is everything in your .git directory. Mainly what you will see in you local Repository are all your checkopoints or commits. It is area that saves everthing **so don't delete it**.

###### The mail analogy

In Git, you first add content to the **staging area** by using **git add**. This is like putting the stuff you want to send into a box. You finalize the process and record it into the **git index** by using **git commit**. This is like sealing the box - It's now ready to send.

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

##### File movement diagram. Understanding git Snapshot concept

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

We should now have some commits in the repositories. To see all the commits so far we use **git log**.

```bash
git log
```

The log should show all commits listed from most recent first to least recent. You would see various information like.

1. The name of the author.
2. The date it was commited.
3. A commit _SHA_ number.
4. The message for the commit.

You should also see you most recent commit., however git log does not show the files involved in each commit. To view more information about a commit, use git show.

```bash
git show
```

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

In this section, we are going to add more changes, and try to recover from mistakes.

A scenario is that you commit files. Later you realize you did not commit all the files in that commit and you don't want to create a commit for a single file. Don't worry you can change this. Git will not edit the commit, it will create a new commit with your file in there. To create a new commit with all your files using **git commit --amend**

```bash
touch app.js
console.log('Hello world')
git add app.js
git commit --amend
```

Lets make some more changes to the **app.js**.

```bash
touch consol.log("more changes") >> app.js
```

What did we change? A very useful command is **git diff**. This is very useful to see exactly what changes you have done.

```bash
git diff
```

You should see something like the following:

##### Stagin area again

Now let's add our modified file, **app.js** to the staging area. Do you remember how ?

Next , check the **status** of **app.js**. Is it in the staging area now?

##### Undoing

You notice I mespelled the name **console** in the our last change. Now my code is broken and it cannot run anymore. One advantage of a staging are is to enable us to back out before we commit - whic is a bit harder to back out of is you commit. Remembering the mail analogy. It's easier to take mail out of the cardboard before you seal it that after.

Here's how to back out of the stagin area:

```bash
git reset HEAD app.js
```

Compare the **git status** now to the git status from the previous section. How does it differ?

Your stagin are should now be empty. What happened to our change? It's still there. We are now back to the state just before we added this file to staging area . Going back to the mail analogy, we just took our letter out of the box.

##### Undoing 2

Sometimes we did not like what we have done and we wish to go back to the last recorded state. In this case, we wish to go back to the state just before we added the latest change.

To accomplish this we use git checkout, like so:

```bash
git checkout app.js
```

You have now un-done your changes. You file is now empty.

Lets first talk about remotes. The we will talk about branching.

###### Working with remotes

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

{{<boxmd>}}

- Create a **local repository**
- Added files and commited them to the git repo.
- Create a new project
- Specify public/ private.
- Set decription.
- Take Http url from github.
- Set remote
- Create an online branch from **cli**
- Push the repository to github.
  {{</boxmd>}}

  These are 9 steps to upload some files to a server. This is not ideal. You need to be a little bit efficient. This is where [hub](https://github.com/github/hub) comes in.

Hub is a **command-line tool** that makes git easier to use with **github**. It wrap **git** in order to extend it with extra features and commands that make working with github easier. Hub has **man page**.

#### Branching

Most large code bases have at least \*two branches** - a **live branch** and a **development\*\* branch. The live branch is code which is Ok to be deployed on to a website, or downloaded by customers. The development branch allow developerst to work on features which might not be bug free. Only once everyone is happy with the development branch would it be merged with the live branch.

Creating a branch in Git is easy. The **git branch** command, when used by itself, will list the branches you currently have.

```bash
git branch
```

The \* should indicate the current branch you are on, which is **master**. If you wish to start another branch, use **git checkout -b (new-branch-name)**

```bash
git checkout -d @development
```

Try git branch again to check which branch you are currently one:

```bash
git branch
```

The new branch is now created. Now lets' work in that branch. To swicth back to the new master.

```bash
git checkout @master
git checkout @development
```

Let's perform some commits now.

```bash
echo console.log("Am in a new brach"); > test.js
git add app.js
git commit -m "Added new js line"
```

Now, let's compare them to the master branch. Use **git diff**.

```bash
git diff master
```

Basically what the above output says is that **test.js** is present on the **@development** brach but is absent on the **@master** branch.

#### Now you see me, now you don't

Git is good enough to handle your files when you switch betwwen branches. Switch back to the **master** branch. Try switching back to the master branch.

Now, where's our **test.js** file?

```bash
ls
```

As you can see the new file you created is the other branch has disappeared. No worries though, it is safely tucked away, and will re-appear when you switch back to that branch.

Now , switch back to the **@development** branch and check that the **app.js** is now present.

#### Merging

We now try out merging. Eventually you will want to merge two branches together after the conclusion of work. **git merge** allow you to do that.

Git merging works by first switching the branch you want to into , and then running the command to merge the othre branch in.

We now want to merge our **@development** branch into master first, switch to the master branch.

```bash
git checkout master
```

Next, we merge the **development** branch into master.

```bash
git merge development
```

Do you see the following output?

// TODO add output

You have to be in the branch you want merge into and then you always specify the branch you want to merge.

At this point , you can also try out **gitk** to visualize the change and how the two branches have merged.

#### Merge Conflicts

Git is pretty good at merging automagically, even when the same file is edited.Ther are however some situations where the same line of code is edited there is no way a computer can figure out how to merge.

This will trigger a conflict which you will have to fix. We now practise fixing merge conflicts. Recall that conflicts are caused by merges which affect the same block of code.

Heres' is a branch I prepared earlier. The branch is called **conflict**.

// TODO Simulating a conflict.

### Fixing a conflict

You should see a **conflict** with the **app.js** file This measn that the same line of text was edited and commited on both the master and **@development**. The output below telss you the current situation.

// TODO Merge conflict

If you open the **app.js** file , you will see something similar as below.

// TODO file with merges conflict markers.

Git users pretty much standard conflict resoluiton markers. The top part of the block which is is everything between **<<<<<< HEAD and ==========** is what was in your current branch.

The bottom half is the version that is present from the **@development** branch. To resolve the conflict , you either choose one side or merge them as you see fit.

For example, I might decide to choose the version from the **@development**

Now try to **fix the merge conflict**. Pick the text that you think is better.
Once I have done that, I can the marke the conflicts as fixed by using \*git add and git commit\*\*

Don't leave the **conflict markers** in your code.

```bash
git add app.js
git commit -m "fixed conflict"
```

#### Setting up SSH keys

#### Step 1b: Go to `.ssh` directory

```bash
cd .ssh
```

> my example

**Note:** If you do not have the `.ssh` directory, you can create it

- if you are in your home directory:

```bash
mkdir .ssh
```

- if you are not in your home directory:

```bash
mkdir ~/.ssh
```

#### Step 1c: Generate `id_rsa` keypair files if needed

- **Note:** these `id_rsa` files contain a special password for your computer to be connect to network services (Ex: GitHub, AWS).
- Check to see if these files exist by typing <kbd> ls -alt</kbd>
- If you do not have these two files (`id_rsa` and `id_rsa.pub`), create them by typing:

```bash
ssh-keygen
```

- Hit **enter** **3 times**

> my example

```bash
% pwd
/Users/reshamashaikh/.ssh
% ls
% ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/reshamashaikh/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/reshamashaikh/.ssh/id_rsa.
Your public key has been saved in /Users/reshamashaikh/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:jmDJes1qOzDi8KynXLGQ098JMSRnbIyt0w7vSgEsr2E reshamashaikh@RESHAMAs-MacBook-Pro.local
The key's randomart image is:
+---[RSA 2048]----+
|   .=+           |
|.  .==           |
|.o  +o           |
|..+= oo          |
|.E.+X.  S        |
|+o=o=*oo.        |
|++.*o.+o.        |
|..*.oo           |
|o= o+o           |
+----[SHA256]-----+
% ls
total 16
-rw-------  1   1675 Dec 17 12:20 id_rsa
-rw-r--r--  1    422 Dec 17 12:20 id_rsa.pub
%
```

#### Step 1d: Copy `ssh` key to clipboard using `pbcopy` command

<kbd> pbcopy < ~/.ssh/id_rsa.pub </kbd>

Verify the key has been copied to the clipboard by printing the contents at your terminal:  
<kbd> pbpaste </kbd>

#### Windows Users

Step 1: [How to Create SSH Keys with PuTTY on Windows](https://www.digitalocean.com/docs/droplets/how-to/add-ssh-keys/create-with-putty/)

---

### STEP 2 (for both Mac and Windows users): Add `ssh` key to GitHub

- go to your [GitHub account](https://github.com/) (create one if you don't have one, and save your user name and password somewhere easily accessible for you.)
- click on your avatar/profile picture (upper right of screen)
- go to `Settings`
- on left of screen, select `SSH and GPG keys`
- Select <kbd> New SSH key </kbd>
- for "Title": entitle it "GitHub key"
- for "Key": paste key from clipboard here
- click <kbd> Add SSH key </kbd>
- save, exit, confirm GitHub password as requested

##### > Installing hub.

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
