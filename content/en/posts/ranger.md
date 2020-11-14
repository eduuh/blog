---
title: "Ranger"
date: 2020-05-27T15:03:52Z
draft: false

description: "Ranger is a console / terminal visual file manager written in Python and with VI key bindings. Ranger is a file manager with a different graphical interface." 

linktitle: "ranger"
title: "Ranger - Visual file manager"

categories: ["config"]
tags: ["cli"]

image : images/ranger.png
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

#### **Ranger**

Ranger is a **console / terminal visual file manager written in Python and with VI key bindings**. Ranger is a file manager with a different graphical interface.

Ranger use the _Miller colums visual modes_ support up to nine tabs and most of the key bindings are the same off vi/ vim text editor.

#### Objective.

Install and configure the Ranger file manager.

> ###### Installation.

To install ranger is pretty simple using your package manager. Since am using **arch** linux , my package manager is **pacman and yay for Aur packages**.

{{<boxmd>}}
**pacman -S ranger**
{{</boxmd>}}

##### Distributions.

Ranger is available in the repositories of most major distribution. And when am talking about distribution i mean **distros** such as **ubuntu, manjaro, arch ,debian and others**. You can use google to confirm how to get ranger working in your installation.

#### Difficulty

**Easy**. Trust me it is pretty simple to get started using ranger. When You Use it you are not going back. This statement is only true if you use **vim** before and you know how to touch type.

#### Conventions

- **\#** - requires given **linux commands** to be executed with root privileges either directly as a root user or by use of **sudo** command.
- **\$** - requires give linux commands to be executed as a **regular non-previleged user**.

#### Introduction.

If you enjoy working in the command line like me, but you want some more simple file mangement and operation tool other than the common commands, it might be time to move to a command line-based file manager, like ranger.

Ranger enables some powerful features for managing your files while preserving the light weight control that the command line provides. It that's not enough, Ranger's controls and commands are all based around vim bindings.

#### Installing Ranger.

Ranger is available in just about every distribution's main repositories. Use you package manager to install it. The package name is almost always **ranger**.

#### Navigationg with Ranger.

Ranger's layout is based on colums . Moving left through the colums moves you up through the directory tree, ending at the filesystem. Moving right, moves you down through the directories.

In each columns(directory) you see a listing of the files and directories inside it. When you finally arrive at a file, Ranger will open it based on how it's configured to respond to that extension in.

{{<boxmd>}}
**~/.config/ranger/rifle.conf**
{{</boxmd>}}

Ranger use vi key bindings.If you dont know what thi is please first checkout This topic.

#### Basic Commands.

**Ranger has build in command for handling file operations**. Once again, these commands are largely based on vim, so if you're familiar with vim, you'll have no problem adopting this tool.

To copy a file , press **yy**. Then , to paste it, press **pp**.

#### Copying / Deleting Multiple files.

##### Using spacebar to Select Multiple Files.

You can select multiple files with the **space bar** before pressing **yy** or **dd** to copy or move multiple files at once.

Note after selecting the files you can then follow the action you want to do which could be.

{{<boxmd>}}

1. **Copy/yank files --yy**
2. **Delete files --dd**
3. **Rename files --aa**
   {{</boxmd>}}

#### Moving multiple files across different directories.

If you want to move multiple files across different directories, you can use **ya** and **da** to add each grouping to a list of files being relocated. After you have everything you want to move , use **pp** to **paste/move** them all.

#### Exiting ranger.

Exiting Ranger is easier than exiting vim.
Press **q** to quit.

#### Command Interface

There's also a couple of useful commands that require you type into the command interface. Like **vim**, _Ranger_ has a command interface that activates when you press :.

Once command that you defintely want is a search.

_Ranger's is straightforward._

{{<boxmd>}}
**:rename newname.txt**
{{</boxmd>}}

**Do you want to rename a bunch of files at once?** Ranger has an excellent tool for that too. `Select the files that you want to rename with the space bar. When you're done, enter the command to open up your editor with the list of file names. Edit them and save. Ranger will do the rest.`

{{<boxmd>}}
**:bulkrename**
{{</boxmd>}}

#### File associations

When you open up a file with Ranger, it will search its configuration for the right application and open the file. You can edit that configuration to tell Ranger which programs you prefer to associate with each file type.

Before you go about **modifying configurations, you need to copy them** just incase you mess things up and you want to revert back to the default. Ranger has an easy command for that too. Ranger has an easy command for that too.

**\$ ranger --copy-config=all**

Ranger will create local copies of its configuration files at **~/.config/ranger**. It'll make several files, but for now, you only need one, **rifle.conf**.

Open up that file in your editor. The default settings are pretty good. They have a logic behing them. Each grouping is divided up by file type. Those groups contain a series of line that tell ranger which programs to look.

##### My Remaps

Just to remind you that **i type using colemak keyboard layout**, The default configuration for ranger is optimized for qwerty layout. For the case on my **nvim** usage i made some custom remapping from **h,j,k,l** to **h,n,e,i**. I want all my environment to be consistent to this custom keybindings. Check how i achieve this.

{{<gist eduuh 668d23fe31aadd5ef3860b9022f3dcce>}}

To checkout all my ranger **rc.conf** file. Checkout my [dotfile repository](https://github.com/eduuh/dotfiles/blob/master/.config/ranger/rc.conf).

Thanks for reading. Next write on _ranger_ i will explain my **rc.conf** configuration line by line and the **riffle.conf** file too.
