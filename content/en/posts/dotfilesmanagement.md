---
description: Efficient way to manage configuration files in a linux system.
date: 2020-12-12:37:37+03:00
draft: false
linktitle: 'Efficient way to manage configuration files in a linux system.'
title: 'Dotfiles sync with bare repository'

tags: ['cli']
series: ['git']

image: images/dotfiles.png

author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

weight: 5

#### A simpler way to manage your dotfiles

Hey there am edd. I was having trouble with configuration files since I started using **docker** for my **development**. I realized I was reconfiguring each time I recreated a new environment. For consistecy and time saving , I decided it would be great if could sync my dotfiles using **git and github** and when creating **new enviroments.**

I wrote the solution in this post, for easy reference if i need to in the future.

#### What are dotfile

**Dotfile are file in the linux system that starts with a period**. They are mainly used to store configuration files for the User instance for various applications. For me the dotfiles that i would love to manage are as follow.

{{<boxmd>}}

- **i3 (window manager)**
- **tmux (terminal multiplexer)**
- **zathura (pdf reader)**
- **nvim (text editor)**
- **dwm (dynamic window manager.)**
- **st**
  {{</boxmd>}}

Both **dwm** and **st** are suckless programs.According to suckless philosophy, application are configured from the source code instead of using configuration files (also possible through patchs). I use Lukes build for [dwm](https://github.com/eduuh/dwm) and [st](https://github.com/LukeSmithxyz/st). You will notice that I forked dwm from luke build. I needed to customizing keybings to colemak keyboard layout.

Yes **setup.sh** this is a custom setup script that i maintain to initially setup a new installation with all the setting and softwares i need in my system. Could be used to

{{<boxmd>}}

- **setup the configuration files managed by the git repository.**
- **Setup my keyboard mapping to the way a need them to be .**
  {{</boxmd>}}

The keyboard mapping i love most, and spend alot of time setting it up is **Remapping caps lock to act as a control key when pressed together with other character, and behave as Escape when pressed alone.**

I would love to automate the process , so that i don't even think about it. Like most folks(know this from my research), I use git to manage my **dotfiles**. This lets me have a versioned backup for my configurations, and if something breaks (and it often does) I can revert to a working configuration fairly easily. I came across a post of how to manage the dotfiles without the need for any **symlinking**.

The key idea is really simple: make **\$HOME the git work-tree.** The normal way of doing this would be to do a **git init in you \$HOME**, but that would totally mess up git commands if you have other repositories in your \$HOME (also, you probably don't want your entire \$HOME in a git repository.

We will **create a dummy folder and initialize a bare repository**.Essentially a git repo with no working directory in there. **All git commands will be run with our dummy as the git directory, but \$HOME as the work directory.**

#### Git bare Repository.

A git repository is a repository that is created without a **Working Tree** but just the contents of what is typically in the .git directory.

**Why this setup?**

_A bare repository is typically used as a Remote Repository that is sharing a repository amoung several different people._ You don't do work right inside the remote repository so there's no working Tree.

##### Manage your dotfiles with bare repository (First Time).

#### Requirements.

{{<boxmd>}}
**1. Git installed.**
**2. Create a remote dotfile repository on github or any other service.**
{{</boxmd>}}

Setting this method up the first time is really easy. First, let's create our bare repository. I chose to name my placeholder **.dotfiles**. Ofcourse you can use any name.

```bash
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```

Now for fun part. We will make an alias for running git commands in our **.dotfiles** repository. I'm calling my alias `dotfiles:` .Make sure you reference the right `dotfiles` folder which are anywhere within your **\$HOME folder**.

This alias references the **git binary** and also indicates the Home folder as your working tree.

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Add this alias to your **.bashrc**. From now any git operation you would like to do in the .dotfiles repository can be done by the dotfiles alias. The cool thing is that you can run dotfiles from anywhere.

Source the url of the remote dotfiles folder and use it to configure the origin.
Lets add a remote and also set status now to show untracked files since there will be a long list of Untracked files. You will only track a few of the files.

```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin https://github.com/eduuh/dotfiles.git
```

#### Adding the conf to Source control.

Note: Avoid using **dotfiles add .** since you don't want to and your home folder to your dotfile repository.

example:

```bash
dotfiles add .bashrc
dotfiles commit -m "added bash configuration file to source control"
```

#### Setting Up a New Machine With existing Configuration.

#### Method 1

Assumtion is that you are using the above described method to store your **dotfiles**.Make a backup folder first and backup the default configuration available for your application. But in most cases you man not have them.

Setting this method up the first time is really easy. First, let's create our bare repository. I chose to name my placeholder **.dotfiles**. Ofcourse you can use any name.

```bash
mkdir \$HOME/.dotfiles
git init --bare \$HOME/.dotfiles
```

Set up the alias for the current session using the command.

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Set up the remote github repository.

```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin https://github.com/eduuh/dotfiles.git
```

Pull in the changes form your remote repository.

```bash
dotfiles pull origin master
dotfiles reset --hard HEAD # ovewrites the Home Directory**
```

#### Method 2

Assuming that your configuration are in github. To set up your computer using your configs is simple.

To set up a new machine to use your version controlled config files, all you need to do is to clone the repository on your new machine telling git that it is a bare repository:

Perform the above steps.

```bash
git clone --separate-git-dir=\$HOME/.dotfiles https://github.com/eduuh/dotfiles.git
```

However, some programs create default config files, so this might fail if git finds an existing config file in your **\$HOME**. In that case a simple sol is to clone to a temporayry directory and then delete it once you are done:

Create the alias file.

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

The last step is to override everything in home directory with the new files you want there.

```bash
dotfiles reset --hard HEAD
```

Since you want to use your dotfiles. That means you don't care about the default configuration files presents in your linux box.

##### Using the dotfiles alias

For the Dotfiles repository, Your will use **dotfiles instead of git**. Use it as you normally use git commands.
Example of some Commands:

A **commit** command.

```bash
dotfiles commit -m "zshrc => zsh oh my god configuration files "
[master 64a553b] zshrc => zsh oh my god configuration files
1 file changed, 91 insertions(+)
create mode 100644 .zshrc
```

A **push** action.

```bash
dotfiles push
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.45 KiB | 1.45 MiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/eduuh/dotfiles.git
7d507e7..64a553b master -> master
```

The **repository will be downloaded** but there might exist some configuration files in your home directory to make sure you are using the right configuration file use git checkout to actually copy the copy in your repository to the working directory.

```bash
dotfiles checkout $HOME/.bashrc
```

Or easy is to **checkout to the latest commit**. Remember Head points to the latest commit use that.

```bash
dotfiles reset --hard HEAD
HEAD is now at 64a553b zshrc => zsh oh my god configuration files
**64a553b** at this time this is my latest commit.
```

Do not worry **git reset --hard** copied files available in your `repository` to both the **staging area** and the **working area** . It should not mess with your untracted files which i believe they are many, since this is a repository monitoring the \$HOME directory.

**There you go. No symlink mess.**

My dotfiles are [here](https://github.com/eduuh/dotfiles) for reference.
