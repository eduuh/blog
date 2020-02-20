---
author: "Edwin Muraya"
title: "Advanced Git WorkShop"
date: 2020-02-19T12:00:06+09:00
description: "Guide to git expert"
draft: false
hideToc: false
enableToc: true
enableTocContent: false
author: eduuh
authorEmoji: 👻
tags: 
- version control
- Productivity
- git
- github

image: images/git/giticon.png
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


### Overview
 
#### Section 1: Part 1

    1. What is Git?
    2. Working with Area, staging area ,Repository
    3. Staging Area Deep Dive
    4. References, commits ,Branches
    5. Stashing

#### Section 2: Part 2

    1. Merging + Rebasing
    2. History + Diffs
    3. Fixing Mistakes
    4. Rebase
    5. Forks, Remote Repositories

#### Section 3: Part 3

    1. The Danger zone (how you could mess things up)
    2. Advanced tools
    3. Customizations: - configs, Ignore, Hooks, Templates
    4. Social git : intergrating Github with CI tools.
    5. Advanced Github: working with github api.


##### WHY USE THE COMMAND LINE?

>  **Don't get me wrong here. here are some of my thoughts.**

##### Too much Automation as a hinderance to learning !

This is the best time to be a software developer. Tools are now geered to automation which make our lifes as `dev` easy. But i think to much automation bring us to stead state. Where we can't progress the learning proceess. Our human nature loves the easier way out and we get to a state we are more relient on the tools and not mastering the fundamentals.
`This is one of the reason i stoped using visual studio`.

They are **many tools** out there that help to **automation of git to the most advanced stuff for you under the hood.** Going down to this road means you are never going to understand `git internal` and you will be sort of relient to the gui tools for their automation. **Trust me when mistakes rise you will be left into the dust by your automation tools.**

### Section 1
--------------
> ###### Using Command Line :   (Am using zsh in ubuntu)

I want you to learn the `fundamentals` and we are going to **use git how it was designed to be used.** 

> #### lets get started

### How does git store information
> At its core, git is like a key value store.


* The **Value** = **DATA**
*  The **Key** = **Hash of the Data**

You can then use the key to retrieve the content.

### The Key - (SHA1)

> Its a crytographic hash function

> Given a piece of data , it produces a 40- digit hexadecimal number.

> This value should always be the same if the given input it the same

### The Value - Git blobs  

* git stores the **compressed** data in a blob, along with the
metadata in a header.

* the identifer **blob**

* the size of the content

* \0 delimeters
 
* content

### Under the hood - Git hash object (blob)

Asking git for the SHA1 of content.

    $ echo 'hello' | git hash-object --stdin

    $ ce013625030ba8dba906f756967f9e9ca394464a

**Try this and you will get the above same output.**

There are many tools to generate generate `sha1` keys. For my system
i believe its `openssl`.

Generating the `SHA1` of the content with `metadata`:

    $ echo 'blob 14\0'hello' | openssl sha1
    (stdin)= c6df3e4881a3d16c8bf544ff119151a5dbb8bb26

When you run the hash function on the same content you will always get the same result.

When we do a :

    $ git init 
    Initialized empty Git repository in /home/edd/test/.git/

The git repository is initialized in the `.git` folder.
when you delete this folder you actually `blow up` the repository, but you **code files are retains**.

#### Where are the `blob` stored ?

lets run the above command for asking git to generate a 
sha1 key for our content but this time we want to write the
object to the git repo. we pass `-w` which means its write.

    $ # This generate a blob 
    $  echo 'hello' | git hash-object -w --stdin
    ce013625030ba8dba906f756967f9e9ca394464a
    
    $ # let remove hooks folder. we dont get confused
    $ rm -rf .git/hooks/
    $ tree .git
    .git
        ├── branches
        ├── config
        ├── description
        ├── HEAD
        ├── info
        │   └── exclude
        ├── objects
        │   ├── ce
        │   │   └── 013625030ba8dba906f756967f9e9ca394464a
        │   ├── info
        │   └── pack
        └── refs
        ├── heads
        └── tags

What go you notice ? (**ce013625030ba8dba906f756967f9e9ca394464a**)

1. Our blob is stored in the object folder.
2. Inside a subfolder which picks the first two char of the blob `(ce)`
3. The blob object os the rest of the chars (013625030ba8dba906f756967f9e9ca394464a)

Because of this behaviour our blob will always be same. I don't know a case of two different content that generate the same blob.

#### Lets do this step by step

1. Lets start by creating an empty directory.

```
    $ mkdir gitobject
    $ cd gitobject
```
2. We create a new git repository using `git init ` command

```
    $ git init
    Initialized empty Git repository in /home/edd/gitobject/.git/
```
This command creates a `.git` directory, which is where git stores all informations. if you delete everything in the git repository you can build back your repository.

The command here creates a few other empty directory for us. If you have never used the `.git` directory before lets start now.

```
    $ ls .git   # ll .git to get more info

    $ # ll .git  #same as  (ls -la)
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
   
   $ rm -rf .git/hooks   # remove the hook folder
   $ tree .git/
    .git/
    ├── branches
    ├── config
    ├── description
    ├── HEAD
    ├── info
    │   └── exclude
    ├── objects
    │   ├── info
    │   └── pack
    └── refs
        ├── heads
        └── tags

    8 directories, 4 files
```
3. What we have are the above directories and files. Lets create
some files in our repository.

```
> Storing individual files with the hash object.
    $ echo 'an awesome deep dive to git' > learn.txt
    $ git hash-object -w learn.txt
    b8956fb060e39ac48d4ad69cc6402c13ed38f7aa
```
4. The `hash-object` command takes a path to a file, reads its content and saves the content of the file into a `Git object store`. It return a hex string `**(the ID of the object it just
created.) If we look in `.git/object` we can see something with
the same name.

```
    $ find .git/object/ -type f   # f -> file
    .git/objects/b8/956fb060e39ac48d4ad69cc6402c13ed38f7aa
  
```
We've created our first object! This object is a binary file that holds what we just saved.

You’ll see the first two characters are a directory name. A typical repo has thousands of objects, so Git breaks up objects into subdirectories to avoid any one directory becoming too large.

The `object ID` is choosen based on the `content` of the object.This is how git stores our object - the content of the 
object determines its ID. The techincal name for this is `content-addressable filesystem`.

5. This means that if we try to save the file a second time, because content are the same nothing changes.

```
    $ git hash-object -w learn.txt

```
6. Retrieve objects with the `cat-file`.

```
    $ git cat-file -p b8956fb060e39ac48d4ad69cc6402c13ed38f7aa

```
The  `cat-file` is used to inspect objects stored in git. The `p` flag stands for `pretty text`. It pretty print the content of the object.

## Exercises
These are some exercise to get used to the idea of storing to and
retrieving files from git objects store.

1. > create a new directory, and initialize it.
2. > look inside the .git folder. make sure you indetify folders and files
3. > use a text editor or the command line to create multiple files and write some text to it.
4. > use git hash function to generate the `sha1` hash and save the object to the git object store.
5. > Use git command to inspect the object in the database.

Repeat exercise 3 & 5 a couple of times.

6. > make an edit to your file, then save the new version  to 
git object store. what go you see in `.git/object`.

7. > Delete a file then recreate it with the object store.
8. > what if you save two files with the same content , but different file names. What do you see in the `.git/objects` ?
what do you expect to see.?

### Useful commands

`mkdir <path>`

    create a directory

`git init`

    initialize Git in the current directory

`ls .git`

    list the content of the .git directory

`find .git/objects/ -type -f`
    
    list the files present in `.git/objects
`git hash-object -w <path>`

    save the files to a git object store.

`git cat-file -p <object id>`

    pretty print the content of the object in the git object store


### Notes 
A brief recap of the exercises: steps 1-5 are repeating what we just did earlier.

In exercise 6, you see that git creates an entirely new object

    $ echo 'am enjoying this git session' >> learn.txt
    $cat learn.txt
    an awesome deep dive to git
    Git store is amazing

    $ # you could then use find of tree
    $ tree .git/objects
    .git/objects/
    ├── 99
    │   └── 7c8fb31f2f2d46c4c46931697ea291a87c43ee
    ├── b8
    │   └── 956fb060e39ac48d4ad69cc6402c13ed38f7aa
    ├── info
    └── pack

    4 directories, 2 files

For exercise 7. If you delete the file you can restore if using shell redirection.

    $ rm learn.txt
    $ git cat-file -p 997c > learn.txt
    $ cat learn.txt
    an awesome deep dive to git
    Git store is amazing

You could redirect the content of the blob to create a new file with the same content

    $ git cat-file -p 997c > learn-copy.txt

You can then add it to the `git object store` . Hopefully you can see that git store the content of the files - it is not saving 
anything about our the `file names`. Each object ID is a pointer to some text, but that text isn't associated with the filename.
If you need to save more that one files, we need to know how the files are called .

This takes us to the next section: how we use tree to save the `filename and directory structures.` in our repository.

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

