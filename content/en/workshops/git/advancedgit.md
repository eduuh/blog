---
author: "Edwin Muraya"
title: "Advanced Git WorkShop"
date: 2020-02-19T12:00:06+09:00
description: "Guide to git expert"
draft: false
hideToc: false
enableToc: true
enableTocContent: false
authorEmoji: 👻
tags:
- version control
- Productivity
- git
- github

image: images/git/giticon.png

author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description


---

#### Advanced Git WorkShop

Hello am Edd and I will be taking you through this workshop.By the end of this workshop, if you follow along you have a completely different understanding of `Git` and how you work with it.

##### How we will go along
I will start will a `short demo` on the `command line` to introduce the new material.
After a bit we will have some exercise for you to practise what we were going through. After you  finish the exercises we are
then going to it together, to make sure you understand.


### Requirements

1. **Command Line** that support unix style commands
2. **git version > 2.0** (check with git --version)
3. **[github.com](github.com)** account
4. **[This Repository](https://github.com/eduuh/Advanced-GitWorkshop)** 👇
```bash
         git clone git@github.com:eduuh/Advanced-GitWorkshop.git
```

Are we all good at these requirements. Okay Let get into it.

I know when we learn git we memorize 6 command  the rest of git is usually a `black box` that we don't explore. We reach at a point where we really on the GUI tool available for working with git. I.e `visual studio code`.Today we are going to go a `lot deeper to git` away from this basic commands and explore `git` further.

My "~~assumption~~" is you are familiar with this commands. ***Don't worry if you are a beginner you will get into pace soon.***


 Command                | Action
------------------------|--------------------------------
        **git clone**   | clone a remote repository : **github**, **gitlab** , **azure repos**
        **git push**    | Push local repository to remote service
        **git fetch**   | Pull changes to a local repository
        **git pull** -f | **git fetch** + **git merge** (used flags right)
        **git init**    | Initialize a repository locally
     **git add & git commit**  | Add changes to a local repository.


*If you are not famialiar with the above commands. Please bare with me, this are usually common concept that we can't do without them. When we come across them i will explain to you what they do.*

I felt this way untill i decided its time to **level up a little bit** and come out of my confort zone. Using `GUI` tools. In my case **visual studio code**.

Do you feel this way?
![gitfeeling](/images/gitfeeling.png)

Its a sad place to be. ***Are you exited to not do this anymore!?***

I will try to get you out of this showing you how to **use git the right way.**

Before you delete you could decide to look up some manual page for git online and this is what you might get.

WAT?

![git manual](/images/gitmanual.png)

The **SYNOPSIS**  ~~WTH~~ does it mean??

> git refers to its self as **A stupid content tracker** funny
  But this depends on how your use case and mood.

> #### Notes

People use git for different use cases. You should try to use the idea from this workshop and incoporate them to your workflows.

> ####
I have divided this workshop into sections , and after each sections. Am going to give an exercise which you will attempt. And then we are going to them together.

Lets focus more on doing and understanding the theory. This is what i mean. Instead of writing down the notes focus on trying out the **commands**. You have all these notes with you.

Git is a tool to helps you,but not  work against you.

#### Git concepts
> #### Untracked Files
New files that git have not requested to track previously.

> #### Working Area
Worked that is tracked by git that has been modified but have not yet been commited.

> #### Staging Area
Modified files that have been marked to go the next commit.

This are terms that will appear mostly in this workshop.

## How is information stored.

At its core, git is like a key value store.

1. **Value** = Data (our files)
2. **Key** => Sha1 Key

> #### Key

Its a **crytographic hash function**. Given a piece of data , it produces a **40 - digit hexadecimal numbers.** You will see this in a bit.

This **value should always be the same if the given Input it the same**.

> #### Value
Git store  the **compressed** data in a blob , along with the metadata in a header. Holds the **identifier of the**, **size of the content** and the **content** itself.

**Note:** The content is compressed and when you cat into it you will get a whole lot of nothings.

#### Under the Hood - Lets create a git hash object.

Git will take **our content** and use it to generate the `hash` key. For now we could supply some content to git using **echo command**.

If you  run the command. Here we are **piping** the output of the echo command to the git hash function requesting to use the **stdin**

The hash function returns the a **hash** which should be the same for all of us.**your can try this**

```bash
echo hello | git hash-object --stdin
# ce013625030ba8dba906f756967f9e9ca394464a
```
We already know some tools that are used to generate **sha1** keys. For my system I believe its **openssl**

lets generate **Sha1** using **openssl**
```bash
 echo hello | openssl sha1
# (stdin)= f572d396fae9206628714fb2ce00f72e94f2258f
```
Thes hash are different. This is because git hash function **prepends thes string "blob" followed by the file size and a null to the file's content before hashing.

This is how git calculates the **sha1** for the file (in git term a blob)

Git calculate the files metadata + content , not just the content.
```bash
# sha1("blob" + filesize + "\0" + data)  # not \0 is a null byte
```

When you run the hash function on the same content you will always get the same result.

### Lets initialize a repository
```bash
git init
# Initialized empty Git repository in $HOME/username/dir/.git/
```
The initialized repository is store at `.git` directory.

Whey you **delete** this folder in a repository you actually blow up the repository, but you retains the files that were availble in the working area.

> #### question: where are blob stored?

We are going to rerun the command that ask git to generate a `sha1` key for the content but this time we pass a option , **-w** that indicates we want to **write the object to the git repo.**

```bash
echo hello | git hash-object -w --stdin
ce013625030ba8dba906f756967f9e9ca394464a
```
Take a note at the `hash` generated at this point. and lets access how it is saved in the git folder.

> lets do some clean up first

Remove the `hooks` directory in the repository, so that it does not get into our way.

```bash
rm -rf .git/hooks  # r => recusive f => folders
```

Now you can **tree** into the **.git** folder to pic at all the content.

Note if you have alot of files in your working directory u are going to have a longer structure. ***The output look something like.
```bash
tree .git/
```
```bash
.git/
├── branches
├── config
├── description
├── HEAD
├── index
├── info
│   └── exclude
├── logs
│   ├── HEAD
│   └── refs
│       ├── heads
│       │   └── master
│       └── remotes
│           └── origin
│               └── HEAD
├── objects
│   ├── 07
│   │   └── 9830d5ae8de34a3faf6bd8ff8b680684948bec
│   ├── ce
│   │   └── 013625030ba8dba906f756967f9e9ca394464a
```
Our initial `sha1` file was **ce013625030ba8dba906f756967f9e9ca394464a**.

##### what do you notice?
1. Our blob is stored in the object folder. You can't see that yet but you will.

2 Inside a subfolder which picks the **first two char of the blob** (ce)

3.The blob object as the rest of the char **(013625030ba8dba906f756967f9e9ca394464a)**

### Do this Step by step
1. Create an empty directory and initialize a new repository

Copy the command as it will work.

* `mkdir` makes a directory.
*  `cd` move into the directory
* `git init` initiaze the repository

```bash
  mkdir test ; cd test ; git init
```
One you initialize a repository **a .git** folder is created where all git information is stored.

The **.git** folder have a few empty directories. If you have never checked the **.git** directory **lets start now**.


2. Check the folder structure of the `.git` directory.
```bash
ls -la .git
```
```
drwxr-xr-x 7 edd eduuh 4096 Feb 15 19:45 ./
drwxr-xr-x 3 edd eduuh 4096 Feb 15 19:45 ../
drwxr-xr-x 2 edd eduuh 4096 Feb 15 19:45 branches/
-rw-r--r-- 1 edd eduuh   92 Feb 15 19:45 config
-rw-r--r-- 1 edd eduuh   73 Feb 15 19:45 description
-rw-r--r-- 1 edd eduuh   23 Feb 15 19:45 HEAD
drwxr-xr-x 2 edd eduuh 4096 Feb 15 19:45 hooks/
drwxr-xr-x 2 edd eduuh 4096 Feb 15 19:45 info/
drwxr-xr-x 4 edd eduuh 4096 Feb 15 19:45 objects/
drwxr-xr-x 4 edd eduuh 4096 Feb 15 19:45 refs/
```
3. Remove the `.git/hooks` folder. you dont need for now
```bash
rm -rf `.git/hooks`
```
4. Look at the folder structure in a graphical way using the tree command.

```bash
tree .git/
```
3. Lets add a file in our repository. Using the echo command you can **redirect** the output to a file.

```bash
# will write the line ot gitstuff.txt file
echo 'an awesome guide to git' > gitstuff.txt

# you can check the content of the file using cat command
cat gitstuff.txt

git hash-object -w gitstuff.txt
# 24997081c3c51eeac9df4309dbcc9452112a8f1f
```
You should the same `hash` code as i get here as long us you use the same content as i did.

This time the **git hash function** command takes a path to a file unlike intially where **echo** was used to input to the **stdin** of the **function**

4. Something i realize with the **ls -la** command that actually the blob is a file. We can just read from it since it compressed into a **c binary** file. Lets try fo fun

lets us the find command to look for all files. Since we now know the blob are store in the **object** we could narrow our search in **directory**.

```bash
find .git/object/ --type f
# .git/objects/24/997081c3c51eeac9df4309dbcc9452112a8f1f
```
We've created our first object! this is a binary file that holds what we just saved.

##### Note
The **object id** is choosen based on the **content** of the object. This is how git stores our object. Let me use the right word here **content-addressable filesystem**.

5. Lets try to save the same file again.

```bash
git hash-object -w gitstuff.txt
```
Because it the same content, nothing changes we will receive the same **sha1 hash key**

6. #### Question: How can we see the content of the blob??

When you cat `pathtofile` you will get a whole lot of **nothing**.To be more accurate **a binary output**

Lets try

```bash
# use the find command to get the path
 find .git/objects -type f
# .git/objects/24/997081c3c51eeac9df4309dbcc9452112a8f1f

cat .git/objects/24/997081c3c51eeac9df4309dbcc9452112a8f1f
# xK��OR02aH�SH,O-��MUH/�LIU(�WH�,���
```

Git provides a functions to view the content of blobs.**cat-file**

* -p => print out **pretty print**
* -t => print out the type

For this command you use the **sha1 hash** as the arguement.

```bash
git cat-file -p 24997081
# an awesome guide to git

git cat-file -t 24997081
# blob
```

#### Useful commands

 command           | detail
-------------------| ----------------------
**kkdir** <path> | creates a directory
**git init**  | initialize git in the directory
**ls -la .git** | lists the content of the **.git** directory
**find .git/object/ -type -f** | list all files available in a directory
**git hash-object -w <path>** | Saves the files to a git object store.
**git cat-file -p <objectid> | pretty print the content of the object in the git object store.

This takes you to [exercise one](exercises/1exerciseone.md)




#### We need other stuff, right?
Our blob is missing information.

1. filenames.
2. directory structure.

wheres is this information stored in git?
> ## Tree
Git stores filename , directory structure here.
a **tree** contains pointers (using sha1).
> to blobs.
> to other trees.

and `metadata`

 * **type** of pointer
 * **filename** of directory name
 * **mode** (excutable file, symbolic link,..)

Has anyone ever tried to add empty directories to git?
git can't of dont store empty directories.


Identical content is only store once.

## Other Optimization - Packfilse and Deltas

1. Git object are compressed
2. As files change, their content remains mostly similar.
3. Git optimize for this by compressing  these files together, into a Packfiles.
4. The packfile stores the object and `deltas` , of the differences between one version of the file
and the next.
5. Packfiles are generated when:
    You have too many objects , during gc, or during a push to remote.

 You kind start to understand what happens during a git push where you see that message.
   > `compressing deltas`

## Commit OBJECT
A commit is a code snapshot.

A commit points to
1. A tree

and contains metadata:
> author and committer
> date
> message
> parend commit (one or more)

The `sha1` of the commit is the hash of all this information.

![commit graphical](./../../static/graphical.png)

#### Practically

1. lets perfom a git status on the repo we created.

        $ git status
        On branch master

        No commits yet

        Untracked files:
        (use "git add <file>..." to include in what will be committed)

        learn-copy.txt
        learn.txt

        $ git add . # add all the files to the staging area
        $ git commit -m "finished working on gitworkshop"
        [master (root-commit) 3cb087a] finished working on git workshop
        2 files changed, 4 insertions(+)
        create mode 100644 learn-copy.txt
        create mode 100644 learn.txt

        $ tree .git/objects
        .git/objects/
        ├── 1e
        │   └── 234f233918794921501400511445247278c890
        ├── 3c
        │   └── b087a3be11296eee71a0527dfe77a139688d68

Note after a commit, git provide the first character of the `sha1 hash` identifier for the commit. for this case its **3cb087a** .

When you look into the `.git/objects` directory using the tree
command. you notice that the commit create a folder structure and has an object in it.

#### Git-file -T (Type) and -P (PRINT) THE CONTENT

        $  git cat-file -t 3cb087a
         commit

        $  git cat-file -p 3cb087a
        tree 1e234f233918794921501400511445247278c890
        author eduuh <edwinkamaumuraya0@outlook.com> 1581803358 +0300
        committer eduuh <edwinkamaumuraya0@outlook.com> 1581803358 +0300

        finished working on git workshop


## Take away from this
> We can't change the Commits!

* if you change any data about the commit, the
commit will have a new `SHA1` hash.

* even ef the files dont change the date will .

####  This give use the sense of high security in
git and you will always know that you commit history will always maintaint its integrity. No one in your team can mess with your commit message without becoming obvious.

It also secures agaish corruption. If files on the disk change, the repository will notify that the content do not match.

#### REFERENCES - POINTERS TO COMMITS
> tags
> branch
> HEAD  -> a pointer to the current commit.

#### Why are checkout in git really fast?
This is because, it not pulling in other data. but its just changing the pointers.


### Three areas where code lives

1. Working area
2. Staging area
3. Repository

##### Working area
The files in your working area that are also not in the staging area are not handled by git.

Also called **untracked files**

#### The staging area

* What files are going to be part of your next commit.
* the staging area is how git knows what will change between the current commit and the next commit.

Tip: a clean staging area isn't empty!
consider the baseline staging are as being an exact copy of the latest commit.



#### The Repository
The files git knows about !
Contans all of your commit.

the repository is stored in the `.git` folder.

### Moving files in & of the staging area

Add a file to the next commit.

    git add <filename>

delete a file in the next commit

    git rm <file>

rename a file in the next commit:

    git mv <file>

### Git ADD -p
1. One of my favorite tools

allows you to stage commits in hunks
Interactively

It's especially useful if you've done too much work for one commit.


### Unstage files fron the staging area

Not removing the files

You're replacing them with a copy that's currently in the repository.

![gitstaging](./../../static/gitstagingarea.png)

### Git STASH

This is usually a way to save uncommited work.

The stash is **safe** from destructive operations.

    changing between branches which requires you to have
    commited all your changes.

![gitsafe](./../../static/gitstash.png)


#### Git stash Basic use

Stash changes

    git stash

list changes

    git stash list

show content

    git stash show stash@{0}

apply the last stash

    git stash apply

apply specific stash

    git stash apply stash@{0}


by default `git stash` stash tracked files that are either in the repository or staging area.

#### Advanced STASHING - Operations
Let give a scenario. You have added a new file in the repository and you dont want to `git add` it yet, but you need
to switch to a different branch. Advanced stashing comes in
handy. If you switch to a different branch with untracted files
in your working area you could accidentally commit this file.

##### Keeping untracted file it a stash

    git stash --include-untracked
##### you this with cautions

    git stash -all

this could add even ingored files.

##### Name stashes for easy reference

    git stash save "WIP: making progress on foo"

##### start a new brance from a stash

    git stash branch <optional branch name>

##### Grab a single files from a stash

    git checkout <stash name> --<filename>

##### Remove the last stash and applying changes

    git stash pop

tip : doest remove if there are a merge conflict

##### Remove the last stash

    git stash drop stash@{0}

##### Remove all stashes

    git stash clear


### Exercise

