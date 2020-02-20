---
title: "Mngdotfilelikeapro"
description: Efficient way to manage configuration files in a linux system.
date: 2020-02-12T11:37:37+03:00
draft: false
linktitle: ""
title: "Managing Dotfiles Like a Pro"
categories: ["comandline","linux"]
tags: ["productivity",""]
weight: 30

image : images/configurations.png
---
### A simpler way to manage your dotfiles

Hello am edd I have been having trouble with configuration since i started using `docker` for my `development`.
For consistecy and time saving , i decided it would be great to manage my dotfiles using `git and github` and when creating `new enviroments`.

I wrote the solution in this post, for easy reference if i need to in the future.


### What a dotfile

Dotfile are file in the linux system that starts with a period. They are 
mainly used to store configuration files for the User instance for various
applications. For me the dotfiles that i would love to manage are as 
follow.

	1. .bashrc or .zshrc (dependent on the shell your using.)
	2. .vimrc
	3. .setup.sh
Yes `setup.sh` this is a custom setup script that i maintain to initially setup a new installation with all the setting and softwares i need in my
system.Could be used to 

 1. setup the configuration files managed by the git repository.
 2. Setup my keyboard mapping to the way a need them to be .

  The keyboard mapping i love most, and spend alot of time setting it up
  is `Remapping caps lock to act as a control key when pressed together wi  with other character, and behave as Escape when pressed alone.

I would love to automate the process , so that i dont even think about it.
Like most folks, I use git to manage my dotfiles. This lets me have a 
versioned backup for my configurations, and if something breaks (and it
often does) I can revert to a working configuration fairly easily. I came across a post of how to manage the dotfiles without the need for any 
`symlinking`. 

The key idea is really simple: make `$HOME` the git `work-tree`. The normal way of doing this would be to do a `git init` in you `$HOME`, but that
would totally mess up git commands if you have other repositories in your
$HOME (also, you probably don't want your entire $HOME in a git repository.

We will create a dummy folder and initialize a bare repository.Essentially
a git repo with no working directory) in there. All git commands will be run with our dummy as the git directory, but $HOME as the work directory.

### First Time Setup

Setting this method up the first time is really easy. First, let's create
our bare repository. I chose to name my placeholder `.dotfiles` 

```bash
	mkdir $HOME/.dotfiles
	git init --bare $HOME/.dotfiles
```

Now for fun part. We will make an alias for running git commands in our
`.dotfiles` repository. I'm calling my alias `dotfiles:` .Make sure you reference the right `dotfiles` 
folder in you home folder.

```bash
	alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Add this alias to your `.bashrc`. From now any git operation you would like to do in the .dotfiles repository can be done by the dotfiles alias. The
cool thing is that you can run dotfiles from anywhere.

Lets add a remot and also set status now to show untracked files.

```bash

	dotfiles config --local status.showUntrackedFiles no
	dotfiles remote add origin https://github.com/eduuh/dotfiles.git

```

### Setting Up a New Machine
To set up a new machine to use your version controlled config files, all
you need to do is to clone the repository on your new machine telling git that it is a bare repository:

```bash

	git clone --separate-git-dir=$HOME/.dotfiles https://github.com/eduuh/dotfiles.git

```
However, some programs create default config files, so this might fail if git finds an existing config file in your $HOME. In that case a simple sol is to clone to a temporayry directory and then delete it once you are done:

```bash
 	git clone --separate-git-dir=$HOME/.dotfiles https://github.com/eduuh/dotfiles.git
```

So this might fail if git finds an existing config file in your $HOME. In that case, a simple solution is to clone to a temporary directory , and then delete it once you are done: 

	git clone --separate-git-dir=$HOME/.dotfiles https://github.com/eduuh/dotfiles.git --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/  
	
	rm -r tmpdotfiles

The last step is to add the `dotfile` alias in your `bashrc` or `zshrc` according to the shell you are
using.

```bash


```
#### Using the `dotfiles alias`

For the Dotfiles repository, Your will use `dotfiles instead of git`. Use it as you normally use git
commands.

Example of some Commands:

A `commit` command.
```bash
$ dotfiles commit -m "zshrc => zsh oh my god configuration files "
[master 64a553b] zshrc => zsh oh my god configuration files
 1 file changed, 91 insertions(+)
 create mode 100644 .zshrc

```
A `push` action.
```bash
$ dotfiles push
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.45 KiB | 1.45 MiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/eduuh/dotfiles.git
   7d507e7..64a553b  master -> master
```


There you go. No symlink mess.

My dotfiles are [here](https://github.com/eduuh/dotfiles) for reference.













