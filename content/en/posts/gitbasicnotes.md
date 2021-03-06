---
title: 'Vim-Craft Daily Stand up'
description: 'Vim theoritical concepts'
date: 2020-07-28T19:56:17Z
draft: true
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
authorImage: '/images/edd.jpg'
tags:
  - cli
  - notes
series:
  - git
---

### Git Basic to Advanced

The reality you can do this with nearly any type of file on a computer.

1. Opensource books are version controlled.
2. You could also do this for your notes.
3. If you are a graphic or web designer and want to keep every version of an image or layout. You would most certainly do this with Vcs.

It is a wise thing to use since

1. it allows you to revert selected files back to a previous state
2. revert the entire project back to previous state
3. compare changes over time
4. See who last modefied something that might be cousing a problem.
5. Who introducet an issue and when, and more.

using VCS means that if you screw things up or lose files, you can easily recover with little overhead.

Git is a distributed version Control systems.

If you understand what Git is and the fundamentals of how it works, then using git effectively will be much easire for you.

Git stores and think about information in a very different way, and undertanding these differences will help you avoid becoming confused while using it.

**version control system (vcs)** is a software that helps software developers to work together and maintain a complete history of their work.

Listed below are the functions of a **VCS**

1. Allows developers to work simultaneously.
2. Does not allow everwriting each other's changes.
3. Maintains a history of every version.

Following are the types of VCS.

- Centralized version control system (CVCS)
- Distributed/Decentralized version control system.

### Snapshots, Not diffrences.

Git thinks of its data more like a series of snapshots of a miniature filesystem.With git every time you commit, or save the state of your project, git basically takes a picture of what all your files look like at that momemt and stores a references to that snapshot.

To be efficient, if the file has not changed, Git doesn't store the file again, just a link to the previous identical file it has already stored.

Git thinks about its data more like a **stream of snapshots**.

### Nearly Every Operation is Local.

- Most operation in git need only local files and resoruces to operate.
- not dependend on another computer on your network.
- You have entire history of the project right there on your local disk, most operations seem almost instantenouses.
- Git reads history directly form you local database.
- Git can look up the file a month ago adn do a local difference calculation.

- This means that there is very little you can't do if you're offline. You can commit happily and later upload you changes to the server ()

### Git Has integrity.

Everything in Git is checksummend before it is stored and is then referred to by the checksum. Means it's impossible to change the content of any file or directory without Git knowing about this funcitonality.

The mechanism that Git uses for this checksumming is called a SHA-1 hash. This is a 40-character string composed of hexadecimal character (0-9 and a-f) and calculated based on the content file or directory structrue in Git. A SHA-1 has looks something like this.

### Git Generally Only Adds Data.

When you do actions in Git, nearly all them only add data to the Git Database.
It is hard to get the system to do anything that is not undoable or to make it erase in any way.

You can lose or mess up changes you haven't committed yet, but after you commit a snapshot into git , it is very difficult to lose, especially if you reqularly push your database to another repository.

Dont worry with git we can experiment without the danger of severely screwing things up. Git store its data and how you can recover data that seem lost.

#### The Three states.

Pay attention now --- here is the main thing to rember about git if you want the rest of learning process to go smoothly.

Git has three main states that your files can reside in : Modified , staged and commited.

1. **Modified** means that you have changed the file but have not committed it to your database yet.
2. **Staged** means that you have marked a modifed file in its current version to go into your next commit snapshot.
3. **Committed** means that the data is safely stored in you local database.

This leads us to three main sections of a Git project: The working tree, the staging area, and the Git directory.

**The working tree** is a single checkout of one version of the project.
The files are pulled out of the compressed databse in the Git directory and placed on disk for you to use or modify.

**The staging area** is a file, generally contained in your Git directory, that store information about what will go into your next commit. **Technical name is index**

**The git directory** if where Git store the metadata and object database for you project. This is the most important part of git, and it is What is copied when you **clone** a repository from another computer.

The basic Git workflow goes something like this:

1. You modify files in your working tree.
2. You selectively stage just those changes you want to be part of your next commit, which adds only those changes to the staging area.
3. You do a a commit, which takes the files as they are in the staging area and store that snapshot permanently to your git directory.

If a particula version of a file in a **git directory** is considered **committed** it means that the file has been modified and was added to the staging area.

- # What is Git?

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

### Lets Get started.

![git for collaboration](/images/git/gitbasic/colaboration.jpg)

Git is a **prerequisite** for collaborating on **website** or applications. Git is a kind of model for present-day collaboration that is **collaboration among distributed teams, working asynchronously, on a shared body of work.** So while you don't have to love Git, you do have to **know it**.

The first step to loving git is Learning how **Git thinks** doing a comparison to our understanding.

### Thinking in Versions.

There are at least two ares of **our written culture** where making incremental changes, and tracking those changes across multiple versions, is not Just helpful but crucial.

- **law**
- **software source code**.

The basic priciple of a version control system is **instead of keeping only the latest copy of something, you hold on to each successive revision of your work, so that you can refer or revet back to an older version of you need to.**

#### Semi-manual Version Control.

In order to save changes to your repository, there needs to be one version of the project that you can safely make changes to in Version control systems.

You may have projects where we kept copies, My friends who do online writing , they save new versions by using an **Save As** **command** command to give each copy its own name. The go ahead and mark the new filename with current date **geodesy_2020-04-15.pdf**. This is entirely a valid form of version control.

You could see this version control system used for physical books releases.

Using **version control system vcs** means that if you screw things up or lose files, you can easily recover with little overhead.

#### Git as Version Control.

In our **semi-manual** process, we "committed" a new version by making a copy of our working copy, naming it with next sequenctial version number. **Committing changes in Git is , very similar**. For each commit, Git records the **precise state of our files** as they are right now in the repository for later access and retrieval.

Unlike in our manual process, whe had the annoying (and potentially risky) responsibility of making sure new versions were copied into place correctly incresing your efforts.

Git copies new versions incrementally, making references to existing copies of files that haven't changed to conserve disk space.

Git allow you to assign your own names or numbers to versions if you need to, but it also gites you a reliable , unique identifier for every single commit. You dont have to but you could just rely of git to do its thing.

Git offers powerful tools for safely merging changes between different versions of a project not just between different collaborators, but also between multiple variations of the project on one person's computer.

#### Git Perspective.

Using **git** forces you to question you own assumption about how changes works. It demands you to undestand **state**. Rather than having three different files we have three different states of the same file. Git stores all the old versions of the file in each of its **previous states**.

The best thing about git is that its a **matter-of-fact** program around. It never does more that you tell it to do. It can also get you out of a bad states it cannot resolve.

##### Basics.

If you're just starting to Learn Git, I recommend to Sticking to the command line. **Git's command-line interfaces is its mother tongue**. Typing commands and seeing the response Git gives back is a great way to learn about how Git actually works.

The command line is also consistent across the various platforsm Git runs on. If you know how to interact with Git via command, you'll be able to use **Git no matter what kind of computer you're on**. There are graphical Git apps out there which some are very good. You don't have to choose one over the other. You can in fact use the Terminal and a Git app side by side, making commits and pushing changes in the app, where it may be easier.

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
- If you're confortable with either of Window's two standard command-line environments **Command Prompt or PowerShell**, the git installer will give you the option of configuring Git to work with those.
- **By default** the git installer provides its own terminal applications, call **Git Bash** which emulates a **unix-based system such as Os X or Linux** with supports for not just Git but other commands utilities.

- Although **Windows and Linux/OS x** bot support the same encodings for plain text files (ASCII and Unicode), They are different line endings, that is , different characters for denoting line breaks. **Git for windows help use out here by doing conversions automatically**
- One more small difference: while windows path use **back-slashes** and drive letters, as in **C:\Users\edwin\myproject** unix paths use forward slashe. An equivalet could be **/Users/edwin/myproject** (with no leading drive letter, since unix systems dont use them)

  {{</tab>}}

{{< /tabs >}}

<hr>

From these step lets continue stepwise.

### The command Line.

There are a lot of different ways to use git. There are

1. Command-line tools.
2. There are many graphical user interface of varying capabilities.

For this book, we will be using Git on the Command Line. If you know how to run the command-line version, you can probably also figure out how to run the GUI version, while the opposite my not be true

#### Prerequisite

1. expect you to know how to open Terminal (linux)
2. Command Prompt or PowerShell in Windows.

### Install on Linux

In linux we use Package management tools thats comes with your distribution.

if you are on arch or manjaro.

sudo pacman -S git

if you are on ubuntu.

sudo apt install git-all

### Install on windows.

There are a few ways to install git on windows. The most official build is available for download on dhe Git website. Just go to **https://git-scm.com/download/win** and download with start automatically.

You can also use **git chocolatey package**. Not that the chocolatey packaeg is community maintained.

## First-Time Git setup.

Now that you have git on your sytem, you'll want to do a few things to customize your environment. You should have to do thes things only once on any given computer. they'll stick around between upgrades. You can also change them at any time by running throught commands again.

git comes with a tool called **git config** that lets you get and set configuration variable that all aspects of how Git looks and operates. These variables can be stored in three different places.

1. **/etc/gitconfig/** file: Contains values applied to every user on the system and all their repositories. If you pass the option **--system** to **git config** , it reads and write from this file specifically.

2. **~/.gitconfig or ~/.config/git/config** file. Values specific personally to you, the user. You can make git read and write to this file by passing the **--global** option, this affects all the repositories you work on your system.

3. **config** file in the Git directory (that is **.git/config**) of whatever repository you're currently using. Specific to that single repository. You can force git to read from and writ to this file with the **--local** option.

On windows system, Git looks for the **.gitconfig** file in the $HOME directory (C:\Users\$USER for most people)

You can view all your settings and where they are coming from using.

```
git config --list --show-origin

```

### Your Identity.

The first thing you should do when you install Git is set your user name and email address. This is important because every Git commit uses this information, and it's immutable baked into the commits you start creating.

```
git config --global user.name "eduuh"
git config --global user.email "edwin@gmail.com"

```

### Your editor.

Now that your identity is set up, you can configure the default text editor that will be used when Git needs you to type in a message.

If not configured, Git uses your system defalt editor.

If you want to use a different text editor, such as **nvim** , you can do the following.

```
git config --global core.editor nvim
```

On a windows system, if you want to use a different text editor, you must specfy the full path to its executabl file. This can be different depending on how your editor is packaged.

```
git config --global core.editor "full path"
```

lets check our setting to ensure they are okay.

#### Checking Your settings.

If you want to check your configuration settings, you can use the **git config --list** command to list all the setting Git can find at that point.

Since Git might read the same configuration variable value form more than one file, it's possible that you have an unexpected value from more that one file. It's possible that you have an expected value for one of these values and you don't know why.

```
git config --show-origin user.name
```

### Getting help.

If you ever need help whil using Git, there are three equivalent ways to get the comprehensive manual page(manpages) help for any of the git commands.

```
git help <verb>
git <verb> --help
man git-<verb>


```

This commands are nice because you can access them anywhere, even offline. I recommend always using **man pages** before google. **google last.**

If you don't need a full blow manpage help, but just need a quick refresher on the available options for a git command. You can ask for the more concise.

## Git basics.

If you want to get going with git, this is it.
This section covers vast majority of the thing you'l eventually speed your time doing with git.

### Expectations.

1. You should be able to configure and initialize a repository.
2. Begin and stop tracking files and stages and commits changes.
3. Know how to set up git to ignore files.
4. Know how to Undo mistakes quickly and Easily.
5. How to browse the history of your project and view changes between commits.
6. How to push and pull from remote repositories.

### Getting a Git repository.

Can be obtained in two ways.

1. You can take a local directory that is currently not under version control, turn it into a **git repository**.
2. You can clone an existing Git repository from eleswhere'

#### Initializing a Repository in an Existing Directory.

```

```

If you have a project directory that is currently not under version control and you want to start controlling it with Git, you firt need to go to that project's dirctory.

```
mkdir first

cd first

```

This create a new subdirectory named **.git** that contains all of your necessary repoistory files. At this point nothing in your project is tracked yet.

```
npm install --global generate-license
```

👆 The above command install a nice tool we could use to add license to our opensource project. Daah it's a good practise.

git init

This create a new subdirectory named **.git** that contains all of your necessary repository files - **a Git repoisotory skeleton**. At this point, nothing in your project is tracked yet. The contents if the **of git will be covered on Git internals**

```
git add *.c
git add LICENSE
git commit -m "initial project version"

```

### Cloning an Existing Repository.

- Git receives a full copy of nearly all data that the server has.
- Every version of every file for the history of the project is pulled down by default when **git clone is run**

You clone a repository with **git clone <url>**.

```
git clone https://github.com/libgit2/libgit2
```

### Recording changes to the repository.

You'll want to start making change and commiting snapshots to those changes into your repository each time the project reaches a state you want to record.

Remember that each file in your working directory can be in one of two states.

1. **Tracked or untracted.**

Tracked files are files that were in the last snapshot; they can be **unmodified, modified, or staged.**

- Tracked files are files that git knows about.

**Untracked files** are everything else - any files in your working directory that were not in your last snapshot and are not in your staging area.

When you first clone a repository, all your files will be tracked and umodified because Git just checked them out and you haven't edited anything.

### Checking the Status of your files.

The main tool you use to determine which files are in which state in the **git status** command. If you run this command directly after a clone , you should see something like this.

### Push to master by mistake

You need to make suer that no other users of this repository are fetching the incorrect changes or trying to build on top of the commits that you want removed becaues you are about to 
rewind history.

Then you need to "force" push the old references.

```bash
git push -f origin <commit-id_>:brance_name
```
