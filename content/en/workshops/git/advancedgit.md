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

# Section 1

Hello am Edd and I will be taking you through this workshop.By the end of this workshop, if you follow along you have a completely different understanding of `Git` and how you work with it. 

> ##### [How we will go along]()    
-----------------------------
I will start will a `short demo` on the `command line` to introduce the new material. 
After a bit we will have some exercise for you to practise what we were going through. After you  finish the exercises we are 
then going to it together, to make sure you understand.


## Requirements

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

> #### [Notes]()

People use git for different use cases. You should try to use the idea from this workshop and incoporate them to your workflows.


I have divided this workshop into sections , and after each sections. Am going to give an exercise which you will attempt. And then we are going to them together.

Lets focus more on doing and understanding the theory. This is what i mean. Instead of writing down the notes focus on trying out the **commands**. You have all these notes with you.

Git is a tool to helps you,but not  work against you.

##  Git concepts
> #### Untracked Files
New files that git have not requested to track previously.

> #### Working Area
Worked that is tracked by git that has been modified but have not yet been commited.

> #### Staging Area
Modified files that have been marked to go the next commit.

This are terms that will appear mostly in this workshop.

### How is information stored.

At its core, git is like a key value store.

1. **Value** = Data (our files)
2. **Key** => Sha1 Key

> #### Key
----------

Its a **crytographic hash function**. Given a piece of data , it produces a **40 - digit hexadecimal numbers.** You will see this in a bit. 

This **value should always be the same if the given Input it the same**.

> #### Value
--------------- 
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

>#### Lets initialize a repository
-------------------
```bash
git init
# Initialized empty Git repository in $HOME/username/dir/.git/
```
The initialized repository is store at `.git` directory.

Whey you **delete** this folder in a repository you actually blow up the repository, but you retains the files that were availble in the working area.

> #### question: where are blob stored?
--------------------------------------

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

## Do this Step by step
1. **`Create an empty directory and initialize a new repository`**

Copy the command as it will work.

* `mkdir` makes a directory. 
*  `cd` move into the directory
* `git init` initiaze the repository

```bash
  mkdir test ; cd test ; git init
```
One you initialize a repository **a .git** folder is created where all git information is stored.

The **.git** folder have a few empty directories. If you have never checked the **.git** directory **lets start now**.


2. `Check the folder structure of the `.git` directory.`
```bash
ls -la .git

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
You should have the same `hash` code as i get here as long us you use the same content as i did.

This time the **git hash function** command takes a path to a file unlike intially where **echo** was used to input to the **stdin** of the **function**

4. `Something i realize with the **ls -la** command that actually the blob is a file. We can just read from it since it compressed into a **c binary** file. Lets try fo fun`

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

6. **Question**: How can we see the content of the blob??

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

## Useful commands

 command           | detail
-------------------| ----------------------
**mkdir** <path> | creates a directory 
**git init**  | initialize git in the directory
**ls -la .git** | lists the content of the **.git** directory
**find .git/object/ -type -f** | list all files available in a directory
**git hash-object -w <path>** | Saves the files to a git object store.
**git cat-file -p <objectid>** | pretty print the content of the object in the git object store.

##  [ Exercise 1](#)
These are some exercise to get used to the idea of storing to and
retrieving files from git objects store.

1. > create a new directory, and initialize it.
2. > look inside the .git folder. make sure you indetify folders and files
3. > use a text editor or the command line to create multiple files and write some text to it.
4. > use git hash function to generate the `sha1` hash and save the object to the git object store.
5. > Use git command to inspect the object in the database.


## Under the Hood of a commit
For a commit to be complete we need to store **the information about thefile**

The basic way git store information is using **blob** and **trees** .

Our blob does not store all the information.

1. filenames.
2. directory structure.

#### Question: wheres is this information stored in git?
#### Trees
A **git tree object** creates a hierachy between files in the git repository and the directory structures.
Every **commit** holds a **single tree** . A tree holds the following informantion.

Tree points  to other.

1. blob
2. Also point to other trees.

Metadata of the **tree**

 * **type** of pointer
 * **filename** of directory name
 * **mode** (excutable file, symbolic link,..)

## Lets do it step by step
Let's start with a new sample repository again,but this time we doing things manually, so we **get the feeling of what is happening under the hood**.

For the repository we created a while back lets delete the `.git` folder . and initilize a new repository.


```bash
rm -rf .git
# create a file again
echo 'Hello , Edwin' > greeting.txt
git init 
git add greating.txt
```
Lets say it all start when we add the file to the **index / staging area**. When I added the file to , **a change occured in my repository** this can't be view as a commit yet but there is a command to see what happened.
 
```bash
git ls-files --stage
# 100644 9f704ffe0495c8f1416cc004f5638e06e78bf14e 0       greeting.txt
```
We have not commited anything yet but we already have **an object** in our repo. Let get the hash id of 
our content in the **file** we already know how to do that.

```bash
git hash-object greeting.txt
# 9f704ffe0495c8f1416cc004f5638e06e78bf14e
```
You realizes the the **hash key** is the same as that of the content of the **greeting.txt** 

You could also use the **cat-file -t** on the hash to see the type of the object it represent. At this case you will find that its a blob. 

###### the same file will always result with the same blob.

```bash
git cat-file -t 9f704ffe0495c
# blob
```

At this point , The **blob** is not reference by any tree and there are no commits yet. At this point the object is anly referenced from a file named **.git/index** which reference the blob and the tree that makes up the current index.

##### Lets make a tree

```bash
$ git write-tree #
438fa6e39f5e86e72bd959b0c12019f1e39cc70d
```
A **tree** containing the same **blob** or **sub-blobs** will always have the same **hash id**.  We dont have a commit but we have a tree now.

> Lets make a commit manually by using the tree directly

```bash
echo 'Initial commit' | git commit-tree 438fa6e39f5e
# 672df89e038ea79fdac61e8686afe65d07b49dbb
```

the raw commit function takes the tree's hash id and makes a **commit object** to hold it. If i wanted the commit to have a parent i could specify the parent commit with **-p** .

Note my commit **hash id** and your will be different since it uses **my name** and **the current date** as the content to generate the commit object.

#### let see a commit object.
A commit is a code snapshot.

A commit points to 
1. A tree
2. A parent commit

and contains metadata: The content used to generate the **Sha1** files.
> author and committer
> date
> message
> parend commit (one or more)

Identical content is only store once. 

#### Optimization - Packfiles and Deltas

1. Git object are compressed .
2. As files change, their content remains mostly similar.
        
        you might add a method here or there.

3. Git optimize for this by compressing  these files together, into a **Packfiles**.
4. The packfile stores the object and `deltas` , of the differences between one version of the file and the next.
5. Packfiles are generated when:
    You have too many objects , during garabage collection, or **during a push to remote.**

Git perform a garbage collection once in a few weeks or when you explicity request it to.

You kind of start to understand what happens during a git push where you see that message. 
   > `compressing deltas`
The `sha1` of the commit is the hash of all this information.

![commit graphical](./../../static/graphical.png)

#### Practically

1. lets perfom a git status on the repo we created.

```bash
git status
    On branch master

    No commits yet

    Untracked files:
    (use "git add <file>..." to include in what will be committed)

    learn-copy.txt
    learn.txt

git add . # add all the files to the staging area
git commit -m "finished working on gitworkshop"
    [master (root-commit) 3cb087a] finished working on git workshop
    2 files changed, 4 insertions(+)
    create mode 100644 learn-copy.txt
    create mode 100644 learn.txt

tree .git/objects
    .git/objects/
    ├── 1e
    │   └── 234f233918794921501400511445247278c890
    ├── 3c
    │   └── b087a3be11296eee71a0527dfe77a139688d68
```

Note after a commit, git provide the first character of the `sha1 hash` identifier for the commit. for this case its **3cb087a** . 

A commit object is also store similary to the blobs.

When you look into the `.git/objects` directory using the tree
command. you notice that the commit create a folder structure and has an object in it.

#### Git-file -T (Type) and -P (PRINT) THE CONTENT

```bash
$  git cat-file -t 3cb087a
    commit

$  git cat-file -p 3cb087a
tree 1e234f233918794921501400511445247278c890
author eduuh <edwinkamaumuraya0@outlook.com> 1581803358 +0300
committer eduuh <edwinkamaumuraya0@outlook.com> 1581803358 +0300

finished working on git workshop
```

#### What we Learn from this 
> We can't change the Commits! You cannot rewrite history.
we can't go back and  change the **author** or any other data.

* If you change any data about the commit, the commit will have a new `SHA1` hash.

* Even if the files don't change the date will and this result to a new `hash`

* This give use the sense of high security in git and you will always know that your commit history will always maintaint its integrity. No one in your team can mess with your commit message without becoming obvious.

* It also secures agaish corruption. If files on the disk change, the repository will notify that the content do not match.

## REFERENCES 
-------------------

**POINTERS TO COMMITS**  . Are stored in `.git/refs` directory

Examples of References.

* tags      => **Points to a speciefic commit. They don't change : used to version you code.**
* branch    => **Points to the latest commit.**
* HEAD      => **Point to the current branch**

#### Folder Stucture of the `.git` folder
```bash
# Just copied a section.It is bigger that this.
        ├── HEAD
        ├── index
        ├── info
        │   └── exclude
        ├── logs
        │   ├── HEAD                        # point to the latest commit
        │   └── refs
        │       ├── heads                   # all the branches lives here
        │       │   ├── git1
        │       │   ├── git2
        │       │   └── master
        │       └── remotes
        │           └── origin
        │               ├── HEAD
        │               └── master
```
##### Note: the branches live in the **.git/refs/heads/master**
let check the master branch and see what it points to. we could use the **cat** command.

```bash
cat .git/refs/heads/master/
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1

# Confirm this with git log
git log HEAD --oneline
#3811dbf (HEAD -> git2, origin/master, origin/HEAD, master, git1) Section one: part one covered

#head is the pointer to the current branch
cat .git/HEAD
# ref: refs/heads/git2
```
There are instance when head can point to **commits** we are goint to review the cases.

#### Questions:  Why are checkouts in git really fast? 
This is because, **there in no pulling in other data.** but its just **changing the pointers.**
## Review: Places where code lives

1. Working area
2. Staging area
3. Repository

##### Working area
The files in your working area that are also not in the staging area are not handled by git.

Also called **untracked files**

#### The staging area

* What files are going to be part of your next commit.
* the staging area is how git knows what will change between the current commit and the next commit.

##### Tip: a clean staging area isn't empty! consider the baseline staging area as being an exact copy of the latest commit.


#### The Repository
The files git knows about ! Contans all of your commit.

the repository is stored in the `.git` folder.

### Moving files in & of the staging area

command         |  Action           |
----------------|-------------------|
git add <filename> | Add a file to the next commit.
git rm <file> | delete a file in the next commit
git mv <file> | rename a file in the next commit:

#### Git ADD -p
1. One of my favorite tools

allows you to stage commits in hunks Interactively
It's especially useful if you've done too much work for one commit.


### Unstage files fron the staging area

Not removing the files

You're replacing them with a copy that's currently in the repository.

![gitstaging](./../../static/gitstagingarea.png)

#### Git STASH

This is usually a way to save uncommited work. The stash is **safe** from destructive operations.

    changing between branches which requires you to have
    commited all your changes.

![gitsafe](./../../static/gitstash.png)


#### Git stash Basic use


Command | Action    
---------|-----------------
git stash   | stash changes
git stash list  | list stashed changes
git stash show stash{0} | show content of the stash
git stash apply | apply the last stash to the working directory
git stash pop   | applys the last stash and deletes it
git stash drop stash{0} | deletes a specified stash from memory


By default `git stash` stash tracked files that are either in the repository or staging area.


#### Advanced STASHING - Operations
Let give a scenario. You have added a new file in the repository and you dont want to `git add` it yet, but you need
to switch to a different branch. Advanced stashing comes in 
handy. If you switch to a different branch with untracted files
in your working area you could accidentally commit this file.

##### Keeping untracted file it a stash

Command  | Action
----------|------------
git stash --include-untracked | Stash even the untracked files (very uselful)
git stash -all | Use this with caution. Stashes even ingnored files
git stash save "WIP: making progress on foo" | Names stashes for easy reference
git stash branch <optional brance name> | Make a new branch from a stash
git checkout <stash name> --filename | Grab a single files from a stash
git stash pop | applies the last stash. Does not apply if there is a conflict
git stash drop stash@{0} | Remove the specified stash
git stash clear | Removes all the stash

## Follow along Exercise : Git Concepts

### Prerequisite
You should have the [`advanced-git-exercises`](https://github.com/eduuh/Advanced-GitWorkshop) repository cloned locally. Checkout the `git2` branch to begin:

```
$> git checkout git3
Switched to branch 'git2'
```

1. Create a new folder and initialize it as a git repo
2. Create a file, stage it, and commit it to your new repo
3. Look at your `.git` folder, using `tree` if you have it
4. Inspect the objects in your `.git/objects` folder using `git cat-file`. See if you can find the tree, blob, and commit objects for your recent commit.
5. Look at your `.git/HEAD` and `.git/refs/heads/master` files and see if you can figure out where these references are pointing to.

### Solutions

#### Step 1 - Initialize the Repo
Create a new sample project folder. Run `git status` to see that it is not yet a git repository. Use `git init` to initialize it as a repository.

```
$> mkdir -p ~/projects/sample

$> cd ~/projects/sample

$> git status
fatal: Not a git repository (or any of the parent directories): .git

$> git init  # if not using my repo
Initialized empty Git repository in /eduuh/projects/sample/.git/
```

#### Step 2 - First Commit
Create a new document, stage it for a commit, then commit it to your repository.

```
$> echo 'Hello World!' > hello.txt

$> git add hello.txt

$> git commit -m "Initial commit"
[master (root-commit) aceb9e8] Initial commit
 1 file changed, 1 insertion(+)
 create mode 100644 hello.txt
```

#### Step 3 - View the .git Folder
Using `tree`, look in your `.git/objects` folder, you should now see three objects, represented by long SHA1 hashes. These represent the tree, blob, and commit that we created in the last step.

```
$> tree .git

.git
├── COMMIT_EDITMSG
├── HEAD
├── config
├── description
├── index
├── info
│   └── exclude
├── logs
│   ├── HEAD
│   └── refs
│       └── heads
│           └── master
├── objects
│   ├── 43
│   │   └── 388fee19744e8893467331d7853a6475a227b8
│   ├── 58
│   │   └── 1caa0fe56cf01dc028cc0b089d364993e046b6
│   ├── 98
│   │   └── 0a0d5f19a64b4b30a87d4206aade58726b60e3
│   ├── info
│   └── pack
└── refs
    ├── heads
    │   └── master
    └── tags
```

#### Step 4 - Inspect the Objects:
Note: The SHA1 hash for your commit will be different than the one displayed here. The SHA1 hash for your `blob` and `tree` will be the same as mine, as long as the content is the same.

One of the objects should be a tree object. The tree contains the filename `hello.txt` and a pointer to the blob.

If you are working on a big repository it might be obvious what your object is but you could use the **commit** to get to the tree.
Using the **git cat-file**

use git log to get the latest commit **sha1** key hash.


The commit object contains a pointer to the tree, along with metadata for the commit, such as the author and commit message.

```bash
git log | head -n 1

# git --no-pager log --oneline 
#d49019

git cat-file -t d49019
# commit


git cat-file -p d49019

tree f21db101b5860d09c98d808ae21aaa96fa512414
parent dd160f7cbcaef119f7fb3063df6e9d0607b5e89c
author eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300
committer eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300
```

```
# inspect the tree
$> git cat-file -t f21db101b5860
tree

$> git cat-file -p f21db101b5860
100644 blob 88a21c6d5ef21e36b68142ccee7aaa6e8344acc2    LICENSE
100644 blob 672c2366c2e9e734bb808b1acccc3722c3265800    README.md
040000 tree 04b14ff559132da3a2223e7ff70fee0ad330b43e    exercises
040000 tree 3dbfb8a9affa3a8eef5aee2b516a15716b940fda    gitimages
100644 blob 18c5b29d788326339b39df657ad2c9134de2ac45    gitlogo.png
100644 blob 24997081c3c51eeac9df4309dbcc9452112a8f1f    gitstuff.txt
100644 blob 9f704ffe0495c8f1416cc004f5638e06e78bf14e    greeting.txt
100644 blob 980a0d5f19a64b4b30a87d4206aade58726b60e3    hello.txt
040000 tree d77e62d1e686822d0c406d06b559c0694d24d8d9    notes
040000 tree cb9d9e857b50525267342b20a040c4911bc61416    scripts
```

The blob object, pointed to by the tree, contains the contents of the file `hello.txt`

```
$> git cat-file -t 980a0d5
blob

$> git cat-file -p 980a0d5
Hello World!
```

###### Note: our very first commit, it doesn't have a parent. The next commit we make will point to our initial commit as the parent. 

#### Step 5 - Look at refs

Let's look under the hood at our `HEAD` variable. `HEAD` is just git's pointer to "where you are now," usually referring to the current branch. More on this later. We can see that right now, it points to our current branch - `master`

Now, if we look at our `master` reference, we can see that it points to the latest commit.

```
$> cat .git/HEAD
ref: refs/heads/git2

$> cat .git/refs/heads/master
d49019211c6a7a4afddd64b1bc5192a042b80ede
```
`d490192...` is the hash of the commit we saw in the last step. You can confirm this by running `git log`

```
$> git log --oneline | head -n 1
43388f Initial commit
```

Git stores references in the `.git/refs/heads/` directory, and the `HEAD` pointer in `.git/HEAD`

We can verify this by creating a new branch.

```
$> git branch new_branch
```

The `git branch` command will create a new branch without switching to it.

Now, if we look in `.git/refs`, we'll see two branches. The `master` branch, which is created by default, and `new_branch`.

```
$> tree .git/refs
.git/refs
├── heads
│   ├── master
│   └── new_branch
└── tags

```

##### Note : To create a branch and switch to it you could use the checkout command

```bash
git checkout -b <new_branch_name>
```

## Merge Conflict

A **Merge conflict*** usually happens when you attempt to merge two branches, but the files have diverged in different ways. When this happens git stops until the conflict are resolved.

#### Lets create a conflict 
Initially am in master.

Lets check all the files that are available in the current branch.

```bash
git ls-files  # does this list untracked files ?
```

* Create a file **hello.txt**
```bash
touch hello.txt
echo "Hello Edwin" > hello.txt

# cat to see the content
cat hello.txt

git ls-files # this t
```
* Create a new branch form the master and switch to it. The simplest way to achieve this is 

```bash 
git checkout -b git2

# Future me decides. the greeting should be in swahili and overwrites

echo "Habari Yako Bwana Edwin" > hello.txt

# cat to see the content now
# Habari Yako Bwana Edwin 
```
* Add the new change to the staging area and commit the change.

```bash
git add hello.txt
git commit -m "Changed the greating to Swahili"

```
* Let checkout to **master** and try to merged the **git2** to master.

```bash
git merge git2
```
## Follow along Exercise- References

### Overview
In this exercise, we'll take a look at our references (`refs`) and create some lightweight and annotated tags. Then we'll make a dangling commit from a "detached HEAD" state and learn why this isn't a great idea.


### Prerequisite
You should have the [`advanced-git-exercises`](https://github.com/eduuh/Advanced-GitWorkshop) repository cloned locally. Checkout the `git3` branch to begin:

```
$> git checkout git3
Switched to branch 'exercise3'
```


### Exercise
1. Check the value of your `HEAD` variable (hint: look in `.git`) and confirm you're pointed at the `git3` branch.
2. Use `show-ref` to look at your other heads.
3. Create a lightweight tag and confirm that it's pointing at the right commit.
4. Create an annotated tag, and use `git show` to see more information about it.
5. Get into a **"detached HEAD"** state by checking out a specific commit, then confirm that your HEAD is pointing at this commit rather than at a branch.
6. Make a new commit, then switch branches to confirm that you're leaving a commit behind.

#### Solutions
##### Step 1 - Where's your HEAD?
Assuming you checked out the `git3` branch in Step 0, your `HEAD` should be pointing to `git3`. You can corroborate this with `git branch`:

```
$> cat .git/HEAD
ref: refs/heads/exercise3

$> git branch
  git1
  git2
* git3
  master
```

##### Step 2 - Where are your refs?
Use `git show-ref` to see which commits your HEADs are pointing at. You should see one for every branch you have, as well as every remote branch we've interacted with. Yours may look slightly different.

```
$> git show-ref --heads
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/heads/git1
56b0fe1d853f9e09a131a851c93e2c92ba8a6bf2 refs/heads/git2
d49019211c6a7a4afddd64b1bc5192a042b80ede refs/heads/git3
d9a034a13998d11ed74e678bbe37e29259242beb refs/heads/master
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/remotes/origin/HEAD
dd160f7cbcaef119f7fb3063df6e9d0607b5e89c refs/remotes/origin/git2
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/remotes/origin/master
f94045e34e98329df15b098615268f91c2107eea refs/stash

You can see for yourself that our `master` branch is pointing to our "Initial commit"


$> git cat-file -p d49019211c6a7a4afddd64b1bc5192a042b80ede
tree f21db101b5860d09c98d808ae21aaa96fa512414
parent dd160f7cbcaef119f7fb3063df6e9d0607b5e89c
author eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300
committer eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300

Initial commit
```

Whereas our `git3` branch is pointing to our newer commit from git2:

```
$> git cat-file -p d49019211c6a7a4afddd64b1bc5192a042b80ede
tree f21db101b5860d09c98d808ae21aaa96fa512414
parent dd160f7cbcaef119f7fb3063df6e9d0607b5e89c
author eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300
committer eduuh <edwinkamaumuraya0@outlook.com> 1582476695 +0300

Initial commit
```


##### Step 3 - Lightweight Tags:
Lightweight tags are simply named pointers to a commit. Make a new tag, then confirm that it points to the correct commit using `show-ref`:

```bash
$> git tag git2tag

$> git show-ref 
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/heads/git1
56b0fe1d853f9e09a131a851c93e2c92ba8a6bf2 refs/heads/git2
d49019211c6a7a4afddd64b1bc5192a042b80ede refs/heads/git3
d9a034a13998d11ed74e678bbe37e29259242beb refs/heads/master
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/remotes/origin/HEAD
dd160f7cbcaef119f7fb3063df6e9d0607b5e89c refs/remotes/origin/git2
3811dbf83556ffc5d50f9ac3a387b8f29c3d06c1 refs/remotes/origin/master
f94045e34e98329df15b098615268f91c2107eea refs/stash
d49019211c6a7a4afddd64b1bc5192a042b80ede refs/tags/git2tag

$> git show-ref --tags # to filter only tages
d49019211c6a7a4afddd64b1bc5192a042b80ede refs/tags/git2tag
```
Our current HEAD, `.d490192..` has now been tagged as `git2tag`. 

You can also do a reverse lookup using `git tag --points-at`:

```bash
$> git tag --points-at d490192
my-exercise3-tag
```

##### Step 4 - Annotated Tags:
Annotated tags serve the same function as regular tags, but they also store additional metadata:

```bash
$> git tag -a "git2tagannotatedtag" -m "this is my annotated tag for exercise3"

$> git show exercise3-annotated-tag
tag git2tagannotatedtag
Tagger: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 11:27:03 2020 +0300

this is my annotated tag for exercise3

commit d49019211c6a7a4afddd64b1bc5192a042b80ede (HEAD -> git3, tag: git2tagannotatedtag, tag: git2tag)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Sun Feb 23 19:51:35 2020 +0300

    Initial commit

diff --git a/hello.txt b/hello.txt
new file mode 100644
```

Using `git show`, we can see all of the pertinent information about our `git2tagannotatedtag`We see the tag metadata at the top - who made the tag and when, as well as the tag message. Below that, we see the commit that was tagged, and then the diff between the tagged commit and its parent.

##### Step 5 - Detached HEAD
Now we're going to venture into a "detached HEAD" state. Use `git checkout` to checkout the latest commit directly. You'll get a scary-looking warning about your HEAD being detached. You can confirm this by looking at `.git/HEAD` and seeing that it's now pointing to a commit hash, instead of `refs/heads/exercise3`

```bash
$> git log --oneline
d490192 (HEAD -> git3, tag: git2tagannotatedtag, tag: git2tag) Initial commit
dd160f7 (origin/git2) continue reading the shell scripting book . finished today one hour
96aa314  finished working on Section one part two
3811dbf (origin/master, origin/HEAD, git1) Section one: part one covered
9be8c2f Initial commite348ebc Testing the emergency git-casting system
43388fe Initial commit

$> git checkout d49019 
Note: checking out 'd49019'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at e348ebc... Testing the emergency git-casting system

$> cat .git/HEAD
e348ebc1187cb3b4066b1e9432a614b464bf9d07
```

##### Step 6 - Create a Dangling Commit
Even though our `HEAD` is now pointing at a specific commit - instead of a branch or tag - we can still make commits. Go ahead and make a new commit, then confirm that our `HEAD` is now pointing at this new commit:

```bash
$> echo "This is a test file" > dangle.txt

$> git add dangle.txt

$> git commit -m "This is a dangling commit"
[detached HEAD 510b8d7] this is a dangling commit
 Date: Fri Feb 28 11:39:28 2020 +0300
 1 files changed, 1 insertion(+)
 create mode 100644 dangle.txt
 
$> git log --oneline
510b8d7 (HEAD) this is a dangling commit
d490192 (tag: git2tagannotatedtag, tag: git2tag, git3) Initial commit
dd160f7 (origin/git2) continue reading the shell scripting book . finished today one hour
96aa314  finished working on Section one part two
3811dbf (origin/master, origin/HEAD, git1) Section one: part one covered
9be8c2f Initial commit

$> cat .git/HEAD
510b8d7e663539778d20a93a262e337b8115b080
```

But wait. Because our new commit - `510b8d7` in this case - was made in a detached `HEAD` state, it doesn't have any references pointing to it. It's not part of a branch, and has no tags. This is called a Dangling Commit. You'll see this warning if you try to switch branches:

```bash
$> git checkout exercise3
D       exercises/2.exercisetwo.md
Warning: you are leaving 1 commit behind, not connected to
any of your branches:

  510b8d7 this is a dangling commit

If you want to keep it by creating a new branch, this may be a good time
to do so with:

 git branch <new-branch-name> 510b8d7

Switched to branch 'git2'
Your branch is ahead of 'origin/git2' by 3 commits.
  (use "git push" to publish your local commits)
```

Here, git is warning you that you're leaving this commit dangling. If you wish, you may create a new branch that points to this commit. Git does a periodic garbage collection and will eventually delete any commits that don't have a reference pointing to them.

#### Git Rerere 

Stands for **(Reuse and Recorded Resolution)**
Git save how you resolve a conflict and when this conflict arise in the future git will use the same
resolution to solve the conflict.

Useful for:
1. Long lived feature branch and when you are perfoming a refactor.
2. When rebasing a repository.

Turn it on. It usually disabled by default.

```bash
# use --global flag to enable for all projects.
git config rerere.enabled true
```
Note: it would be nice you you activate this `feature per project basis.`
### Some Common Commands

> 1. checkout a branch and create some changes.  Use `git checkout  <brachname>
> 2. `git --no-pager log --online`
> 3. perform a git merge using the command `git merge <branchname>` Performs a merge using a `fast forward` 
> 4. Use a `git reset --hard HEAD^`
> 5. Perfom a git merge without fastforward. `git merge --no-ff <branchname>`
> 6. Git log with a graph. `git log --no-pager --graph`
> 7. Switch to the previous branch. `git checkout -`
> 8. use git rerere diff to resolve your conflict. `git rerere diff`
> 9. lets reset to go back to where we were intially. `git reset --hard HEAD^`

## Commits
### Useful commits.
Good commits are important since they help preserve the history of a `codebase`. the help with
> debugging and troubleshooting
> creating release notes
> code reviews
> rolling back
> assosiate the code with an issue to a ticket

* Commit message should be in future tense.
* Short Subject followed by a black line.
* A description of the current behaviour , a short summary of why the fix is needed and also mentions 
side effects.

#### Anatomy of a Good Commit
1. Good commits messages
2. Encapulates one logic idea.
3. Does't have introduce breaking changes i.e test passes.

### Git log -> Used to examine History
The vanilla `git log` is not very helpful but there are alot of flags that helps navigate our repo much easier.

#### Case scenario
You could notice that a bug was introduced  `20 minutes ago` and flags such as `since` could help your alot.

```bash
   git log --since = "yestaday"
   git log --since ="2 weeks ago"
```

#### git log follow: 

Used to track the changes of the files logs files that have been moved or renamed. 
```bash
 git log --name-status --follow --<file>
```

#### git log --grep
search for commits messages that match a reqular expressions. 

```bash
git log --grep <regexp>
```
This command can be mixed $ matched with other git flags.

```bash
git log --grep=migrations --author=edwin --since="2 week ago"
```

#### git log diff-filter
selectively incleds or exclude files that have been.
1. (A)dded    
2. (D)eleted
3. (M)odified

```bash
 git log --diff-filter=R --stat
```
### Referencing commits
This Stuff confused me and might confuse you as well. Take your time here.

1. ^ or ^n
   * <no args> == ^1 : The parent commits
   * n : the nth parent commit.

2. ~ or ~n
  * <no args> : === ~1 the first commit back following the 1st parent.
  * n(th) : nth number of commits back, following only the 1st parent.

Note ^ and ~ can be combined.

### Referencing commits : Diagram
- Both commits nodes b and c are parent of commit node A. Parent commits are orderde left-right.




- How could we reference?

A  =  A^0
B  = A^  = A^1 = A~1
C  = A^2
D = A^^ = A^1^1 = A~2

This refereces are usually usefull incase you want to *reset/revert* 
You could decide to revert to 3 commits back without loging to find the sha1 code and usind that.

```bash
git reset --hard HEAD^   / resets to the parent commit.
git reset --hard HEAD^2  / resets to the second parent.
```

## More commands
### Git show
```bash
git show <commit-id>  #Show commits and content
git show <commit-id> --stat  #show files changed in commit. 
git show <commit> Look at a file from another commits.
```
### Diff
Diff show you changes 
1. Between commits
2. between the staging area and repository
3. What's in the working area.

```bash
git diff   # Unstaged changes
git diff --staged
```
### Diagram diff with ven diagram

![logdiffvendiagram](/images/logdiffven.png)

This will show all changes in Branche B that are not availabe in Branch A. 
```bash
# Examples
git diff scripting..master
git diff scripting...master
git diff scripting master
```
### Checking merged or not branches
Checking which branched are merge with master and could be cleaned up.
```bash
git branch --merged master

git branch --no-merged master
```

## Exercise Five - History and Diffs

### Overview
In this exercise, we'll practice making a good commit, take a look at some of the interesting command line arguments for `git log`, use `git show` to get more information about a commit, then take a quick look at `git branch`.

### Prerequisite
You should have the [`advanced-git-exercises`](https://github.com/eduuh/Advanced-GitWorkshop)  repository cloned locally. Checkout the `git4` branch:

```
$> git checkout git4
Switched to a new branch 'git4'
```

### Exercise
1. Practice creating a well-crafted commit - look at the format given on the slides for help.
2. Use `git log` to find commits created since yesterday. Rename a file and use the `--name-status` and `--follow` options to `git log` to track down when the file was renamed, and what it used to be called. Use `--grep` to search within commit messages, and `--diff-filter` to find renamed and modified files from `git log`.
3. Use `git show` to get more information about a specific git hash.
4. Try the `--merged` and `--no-merged` options to `git branch` to see which branches have been merged into `master` (or not).

### Solutions

#### Step 1 - Make a Good Commit
We've all made commits with short, "silly", or otherwise unhelpful messages. Let's practice making a solid commit message for use in this example.

```
# Change your `hello.txt` to say [greeting] [noun]! however you want to change it.

$> cat hello.txt
[greeting] [noun]!

# Rename hello.txt to hello.template

$> git mv hello.txt hello.template
$> # if you do a git status you will realize that hello.template is renamed.

$> git add hello.template

$> git commit

# This will open your text editor
# Type the following...
Replacing greeting with tokens for i18n

Currently, hello.txt contains both Spanish and English.
Let's replace Hola with a [greeting] token, and Mundo
with a [noun] token. That way, we can localize hello.txt for
any language!

# Save and exit your editor

[exercise5 4b2b90e] Replacing greeting with tokens for i18n
 1 file changed, 1 insertion(+), 1 deletion(-)
```

#### Step 2 - Git Log
Let's take a look at our new commit using `git log`. First we'll see how to see all commits in the log since yesterday:

```
$> git log --since="yesterday"
commit 886265f1cd786eec7bf48548f290d162d5307051 (HEAD -> git4)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:32:28 2020 +0300

    Replaced greeting with varibles for i18n
    
    Currently, hello.txt contains both spanish and English.
    Let's replace with a [greeting] token and Mundo with a [noun] token.
    that way, we can localize hello.txt for any language!

commit e7410d10d86edd1bca30f4fa4dbd2e80385518fd (master)
Merge: d9a034a cb0ba30
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:00:46 2020 +0300

    Merge branch 'git3'
```

Things can get tricky when trying to track down changes to files when they've been renamed. Here we see how to use `git log` to find the commit where `hello.txt` was renamed to `hello.template`. The `--follow` command will continue following the file backward in history, showing its filename for every commit:

```
$> git log --name-status --follow --oneline hello.template
886265f (HEAD -> git4) Replaced greeting with varibles for i18n
A       hello.template
```

Ever spent too much time trying to track down a commit in Github? Use `git log --grep` to quickly find a commit. We can chain this with other flags. Let's find all the internationalization commits that the author `eduuh` has added in the last two weeks:

```
$> git log --grep=i18n --author=eduuh --since=2.weeks
commit 886265f1cd786eec7bf48548f290d162d5307051 (HEAD -> git4)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:32:28 2020 +0300

    Replaced greeting with varibles for i18n
    
    Currently, hello.txt contains both spanish and English.
    Let's replace with a [greeting] token and Mundo with a [noun] token.
    that way, we can localize hello.txt for any language!

```

We can use `--diff-filter` to find commits where files have been renamed:

```
$> git log --diff-filter=R --find-renames
4b2b90e Replacing greeting with tokens for i18n
```

Or to find commits where files have been modified:

```
$> git log --diff-filter=M --oneline
fec9e7b Changing Hello to Hola
afa34a6 Changing World to Mundo
e348ebc Testing the emergency git-casting system
```

#### Step 3 - Git Show
Now that we've mastered `git log`, how do we actually see what happened in a commit? Let's use `git show` to find out.

```
$> git log --grep=i18n --oneline
 886265f1cd7 Replacing greeting with tokens for i18n

# Let's see the full commit and diff for 4b2b90e

$> git show  886265f1cd7
commit 886265f1cd786eec7bf48548f290d162d5307051 (HEAD -> git4)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:32:28 2020 +0300

    Replaced greeting with varibles for i18n
    
    Currently, hello.txt contains both spanish and English.
    Let's replace with a [greeting] token and Mundo with a [noun] token.
    that way, we can localize hello.txt for any language!

diff --git a/hello.template b/hello.template
new file mode 100644
index 0000000..7447c60
--- /dev/null
+++ b/hello.template
@@ -0,0 +1 @@
+[greeting] [noun]!
:...skipping...
commit 886265f1cd786eec7bf48548f290d162d5307051 (HEAD -> git4)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:32:28 2020 +0300

    Replaced greeting with varibles for i18n
    
    Currently, hello.txt contains both spanish and English.
    Let's replace with a [greeting] token and Mundo with a [noun] token.
    that way, we can localize hello.txt for any language!

diff --git a/hello.template b/hello.template
new file mode 100644
index 0000000..7447c60
--- /dev/null
+++ b/hello.template
@@ -0,0 +1 @@
+[greeting] [noun]!
diff --git a/hello.txt b/hello.txt
deleted file mode 100644
index 349ec18..0000000
--- a/hello.txt
+++ /dev/null
@@ -1 +0,0 @@
:...skipping...
commit 886265f1cd786eec7bf48548f290d162d5307051 (HEAD -> git4)
Author: eduuh <edwinkamaumuraya0@outlook.com>
Date:   Fri Feb 28 12:32:28 2020 +0300

    Replaced greeting with varibles for i18n
    
    Currently, hello.txt contains both spanish and English.
    Let's replace with a [greeting] token and Mundo with a [noun] token.
    that way, we can localize hello.txt for any language!

diff --git a/hello.template b/hello.template
new file mode 100644
index 0000000..7447c60
--- /dev/null
+++ b/hello.template
@@ -0,0 +1 @@
+[greeting] [noun]!
diff --git a/hello.txt b/hello.txt
deleted file mode 100644
index 349ec18..0000000
--- a/hello.txt
+++ /dev/null
@@ -1 +0,0 @@
-Hola! Edwin
```

#### Step 4 - Git Branch
Let's say you're working on a complicated codebase with a `master` branch and lots of feature branches. Some of your coworkers forget to clean up their branches when they're done (we're all guilty). Which branches have been merged into `master` and can be cleaned up? Which branches haven't been merged yet? If you've been following along, yours may look different.

```
$> git branch --merged master
  git1
  git2
  git3
  master

$> git branch --no-merged master
 * git4
```
