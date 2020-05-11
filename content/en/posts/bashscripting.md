---
title: "Bashscripting"
date: 2020-04-11T16:02:40+03:00
draft: true
linktitle: ""
title: "Bashscripting Workshopt"
categories: ["comandline","linux"]
tags: ["productivity",""]
weight: 30

image : images/configurations.png

author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---
## The Linux Workshop

### The Linux Command Line

Before you can dive into working with the linux command line and shells, you should first understand what linux is, where it came form and how it works.

> ### What is Linux

If  you've never worked with Linux before, you may be confused about so many different versions are available.

First, four main part makes up a linux system:

    1. The Linux kernel
    2. The Gnu Utilities
    3. A graphical desktop enviroment
    4. Application software.

Each of these parts has a specific job in the linux system. No part is very useful by itself.

### Looking into the Linux Kernel.

The core of the Linux system is the **kernel**. The kernel controls all the hardware and sofware on the computer system, allocating hardware when necessary and executing software when required.

If you've been following the Linux world at all, no doubt you've heard the name **Linus Torvalds**. Linus is the person responsible for creating the first linux kernel softwae whe he was a student at university of Helsinki. He intended it to be a copy of the Unix system, at the time a popular operating system used at many universities.

After developing the linux kernel, linux released it to the internet community and solicited suggestions for improving it. This simple pross started a revolution in the world of computer operating sytems.Soon Linux was reciving suggestions from students as well as professional programmers from around the world. Allowing anyone to change programming code in the kernel wold result in complet chaos. To simplify things, linux acted as a central poing for all improvement suggestions. It was ultimately Linux's decision whether or not to incorporate suggested code in the kernel.

This same concept is still in place with the linux kernel code, except that instead of just linux controlling the kernel code, a team of developers has taken on the task.


The kernel is primarily responsible for four main functions:
      System memory management
      Softwae Program management
      Hardwae management
      Filesystem management

## System Memory Management

One of the primary functions of the operating system kernel is **memory management**. Not only does the kernel manages the physical memory available on the server, but it can also create and manage virtual memory, or memory that does not actually exist.

It does this by using space on the hard disk, called the **swap space**. The kernel swaps the contents of virtual memory location back and forth from the swap space to the actual **physical memory**. This allows the system to think there is more memory available than what physically exists.


The **memory locations are grouped into blocks called pages**. The kernel locates each page of memory either in the physical memory or the swap space. The kernel then maintains memory page that indicates which pages are in physical memory and which pages are swapped out of disk.


## Softwae Program Management

The linux operating system calls a running program a *process*. A process can run in the foreground, displaying output on a display, or it can run in the background.

The kernel creates the first process, called the **init process**, to start all other processes on the system. When the kernel starts, it loads the init process into virtual memory. As the kernel starts each additional process, it gies it a unique area in virtual memory to store the data and code that the process uses.

Some linux implementations contain a table of processes to start automatically on bootup. On linux systems, this table is usually located in the special file **/etc/inittabs**.

Other systems (such as the popular Ubuntu linux distribution) Utilze the */etc/init.d** folder, which contains scripts for starting and stopping individual application at boot time. The Scrips are started via entries under the **/etc/rx.d** folders where X is a run level.


## Hardware Management

Any device that the Linux system must communicate with needs driver code inserted inside the kernel code. The drive code allows the kernel to pass data back and forth to the device, acting as a midlle man between application and the hardware. Two methods are used for inserting device driver code in the Linux kernel.

1. Driver compiled in the kernel.
2. Driver modules added to the kernel.

The only way to insert device driver code was to recompile the kernel. Each time you added a new device to the system, you had to recompile the kernel code. This process became even more inefficient as Linux kernel supported more hardware. Fortunately Linux developers devised a better method to insert driver code into the running kernel.

Programmers developed the concept of kernel modules to allow you to insert driver code into a running kernel without having to recompile the kernel. A kernel module could be removed from the kernel when the device was finished being used.

The linux system identifies hardware devices as special files, called **device files**. There are three classification of device files:

      1. Character
      2. Block
      3. Network.

## Filesystem management

The linux kernel can support different types of filesystems to read and write data to and from hard drives. Besides having over a dozen filesystems to read and write data to and from hard drive. Besides having over a dozen filesystems on its own.


## The GNU utilities

The **Gnu Organization (GNU stands for GNU's not Unix) developed a complete set of unix utilities but had no kernel system to run them on. These utilities were developed under a software pilosophy called **open source software (OSS).**

## The core Gnu Utilities
The **Gnu** coreutils package consists of three parts:

  1. Utilities for handling files
  2. Utilities for manipulating text
  3. Uitlities for managing process.


## Basic bash shell commands.

* The default shell used in many Linux distribution is the GNU bash shell.

# Starting the Shell

The GNU bash shell is a program that provides interactive access to the linux system. It runs as a regular program and is normally started whenever a user logs in to a terminal.

The **etc/passwd** file contains a list of all the system user accounts, along with some basic configuration information about each user. Here is an entry


  edd:x:1000:1001:edd:/home/edd:/usr/bin/bash

Each entry has seven data fields, with fields separated by colons. The system uses the data in these fields to assign specific features for the user.

  The above line means.

     **edd** logs into linux system and **bash** program is automatically started.
There are two methods of login into a linux box.

a. Virtual console terminal. requires a **cli prompt**
b. Graphical login. requires a graphical emulator.

## Using the Shell Prompt.

When you log in to a linux virtula console. you get access to the shell **cli prompt** . The prompt is your gateway to the shell. The place you input commands.

    The default prompt symbol is a **dollar sign ($)

Different distribution uses different format of prompt. Examples

    * Ubuntu looks like
            - edwin@server:~$
    * CentOs Linux or Manjano
            - [edwin@server:~$]
The prompt is meant to provide useful information.

    edwin -> Current user Id
    server -> name of the system

`Note` that the promp is not static. It could be changed to suit your need.

## Interacting with the bash Manual

The **man** command provides access to the manual pages stored on the linux system. Entering the command **man** followed by another command provids that utility's manual entry. Try

    man xterm

When you use the **man** command to view a command's manual pages, they ared displayed with somethong called a **pager**.

A `pager` is a utility that allows you to page through displayed text. Thus, you can page through the man pages by pressing the **spacebar**, or can go line by line using the **enter key**. you could olso use **arrow keys**

When you finish with the man pages, press the **q** key to quit. when you quit you are taken back to the **prompt**.

There are also the information pages called **info** pages.

## Navigating the Filesystem

When you log into the system and reach the command line prompt, you are in your home directory.

### looking at hte Linux Filesytem.

If you're new to the linux sytem,you may be confused by how it refences files and directories, especially if you're used to the way microsoft windows system does.

Linux stores files within a single directory structure calle a **virtual directory**. The virtual directory contains files paths from all the storage devices installed on the computer, merged into a single directory structure.

The linux virtual directory structure contains a single base directory, called the **root**. Directories and files beneath the root directory are listed based on the directory path used to get to them.

In linux you will see files paths similar to the following

      /home/edd/Documents/test.md

Notice the path does not provide the **drive** the file is stored on.

Linux virtual directory is how it incorporate each storage device. The first hard drive installed in a linux system is called the **root drive**. The root drive contains the virtual directory core. Everythings else builds from there.

On the **root drive**, Linux can use a special directory as **mount points**. Mount points are directories in the virtual directory where you can assign additional storage devices. linux cause files and directory to appear within these mount opind directories.


## Common Linux Directory Names

| Directory   | Usage                                        |
|-------------|----------------------------------------------|
|  /          | root of the **virtual directory** , no file placed|
| /bin        | binary directory,where many GNU user-leve utilities |
| /boot       | boot directory, where boot files are stored |
| /dev        | device directory,where linux creates user directory |
| /etc        | system confiuguration files directory |
| /home       | home directory, where linux creates user directory |
| /lib        | Libray directory, where system and application libray files are stored |
| /media      | media directory, a common place for mount points for removable media |
| /mnt        | mount directory, another common place for mount points used for removable media |
| /opt        | optional directory, often used to store third-party software packages and data files |
| /proc       | process directory, where current hardware and process infromation is stored |
| /root       | root home directory |
| /sbin       | system binary directory, where many GNU admin-level utilitise |
| /run        | run directory, runtime data is held during system operation |
| /srv        | Serviced directory, local services store files |
| /sys        | System directory, where system hardware information files are stored |
| /var        | Variable directory, for files that change frequently, i.x log |


Common linux directory are based on **Filesystem Hierarchy Standard**(FHS).
You can move around the **virtual directory** using a graphical interface. To move around the virtual directory from a cli prompt.

## Traversing directory

Use the **directory command (cd)** to move your shell session to another directory in the linux filesystem.

The **cd** command may take a single parameter, **destination**. The destination parameter can be expressed using twi different methods.

## Using absolute directory references

You can reference a directory name within the virtual directory system using an **absolute directory reference.** .

An absolute path reference always begins with a forwa slash (/) indicating the virtual directory system's root.

    /usr/bin

With the absolute directory reference there's no doubt as to exactly where you want to go. To move to a specific location in the Filesystem usind the absolute directory reference, you just specify the full pathname in the **cd** command.

    cd  /use/bin # move to the directory

Prompt originalyy had a tilde (~) in it. After the change to a new directory occurred, the tilde was replaced by **/usr/bin.**.

If your prompt has not been configured to show the shell session's current absolute directory location, then you can display the location via a shell command. The **pwd** command display the shell session's current directory location.

    edwin@server  /usr/bin/$ pwd
     /usr/bin

You can move to any leve within the entire **Linux virtual directory** structure from any level usind the absolut refence:

    edwin@server: /usr/bin/$ cd /var/log

note: think of absolute as a full path.

## using Relative directory references

**Relative directory referece** allow you to specify a destination directory reference relative to your current location. A Relative directory reference doest start with a folowrd slash.


Relative directory reference starts with eithe a directory name (if you're traversing to a directory under your current directory) or a special character.

  edd@edd:~/Documents$ ls
  edd@edd:~/Documents$ cd ~/Desktop

You can use a relative directory reference with the *cd* command is any directory containg subdirectoroies. You can also use a special character to indcate a relative directory location.

The two special character used for *relative directory reference** are :

    * The single dot (.) to represent the current directory
    * The double dot (..) to represent the parent directory
You can use the single dot but it doesn't make sense to use it with the cd command.  The double dot character is extremely handy when trying to traverse a directory and need to go to your **Downloads** directory.

   edwin@server: ~/Documents$ pwd
   /home/edd/Documents
   edwin@server: ~/Documents$ cd ../Downloads
   edwin@server: ~/Downloads cd ../Downloads

  .. takes you back up one level to your home directory.


> ## Use absolute path if it makes sense to use.

## Listing Files and Diretory.

To list the content of a directory we use the **ls** command.

### Displaying a basic Listing
The ls command at its most basic form displays the files and directory located in your current directory.

    $ ls
  aur                       Downloads     package-lock.json  README.md  Videos
  bunnyflydotfiles_colemak  input         Pictures           snap       yay
  Desktop                   Music         Public             Templates
  Documents                 node_modules  readme.md          text.txt

If you don't have a color terminal emulator, you can use the -F parameter with the **ls** command to the easily distinguish files from directory. Using the -F parameter produces the following ouput.

  $ ls -F
  aur/                       Downloads/     package-lock.json  README.md   Videos/
  bunnyflydotfiles_colemak/  input/         Pictures/          snap/       yay/
  Desktop/                   Music/         Public/            Templates/
  Documents/                 node_modules/  readme.md          text.txt

The -F parameter flags the directoies with a forward slash (/) to help identipy them in the listing.

The basic **ls** command can be somewhat misleading. It shows the files and directory contained in the current directory. Linux often uses hidden files to store configuration information.

To display hidden files along with normal files and directories, use the -a parameter. Here is an example of using the -a parameter with the ls command.

    $ ls -a
    .                         .dotfiles      package-lock.json  .viminfo
    ..                        .dotnet        Pictures           .vscode-oss
    aur                       Downloads      .pki               .Xauthority
    .bash_history             .gitconfig     .profile           .Xclients

All the files beginning with a period, hidden files.
Notice that three files begin with **.bash**

The -R parameter is another options the **ls** command can use. Called the recursive option, it shows files are contained within subdirectories.

    $ ls -F -R

    Desktop/                   Music/         Public/            Templates/
    Documents/                 node_modules/  readme.md          text.txt

    ./aur:
    st-luke-git/

    ./aur/st-luke-git:
    PKGBUILD

    ./bunnyflydotfiles_colemak:
    dotfiles/

    ./bunnyflydotfiles_colemak/dotfiles
## Displaying a Long Listing
**ls** command doesn't produce much information about each files. For listing additional information, another parameter is *-l*.

    $ ls -l
    drwxr-xr-x 3 edd edd  4096 Apr 12 00:14 aur
    drwxr-xr-x 3 edd edd  4096 Apr 13 01:43 bunnyflydotfiles_colemak
    drwxr-xr-x 3 edd edd  4096 Apr 12 13:15 Desktop
    drwxr-xr-x 2 edd edd  4096 Apr 11 23:24 Documents
The long listing format lists each file and subdirectory on a single line.
The listing shows additional useful information.

    1. The file type - Such as
          - directory (d),
          - file (-),
          - linked files (1),
          - Charater device (c)
          - Block device (b)
    2. The file permissions.
    3. The number of file hard links.
    4. The file owner username.
    5. the file primary group name.
    6. The file byte size.
    7. The last time the file was modified.
    8. The filename or directory name.

## Filtering listing output

To look for information about a file is also possible by using the **ls** command.

    $ ls -l text.txt
    -rw-r--r-- 1 edd edd 1 Apr 13 09:45 text.txt
Here we used bracket with two choices of character **[tx]** t and x . brackets could be used to liss ranges of characters.

     $ ls -l tex[a-z].txt
    edd@edd:~$ ls -l tex[a-z].txt
    -rw-r--r-- 1 edd edd 1 Apr 13 09:45 text.txt
    -rw-r--r-- 1 edd edd 0 Apr 14 18:30 texz.txt

You could also specify what shoud not be included in the search result.

    edd@edd:~$ ls -l tex[!z].txt
    -rw-r--r-- 1 edd edd 1 Apr 13 09:45 text.txt
  The second file texz.txt does not get listed in the result.

## Handling Files

The shell provids many file manipulation command on the linux filesystem.

> #### 1. Creating Files

The **touch** command is used to create empty files in the system.

    edd@edd:~$ touch test_one
    edd@edd:~$ ls -l test_one
    -rw-r--r-- 1 edd edd 0 Apr 14 18:51 test_one
The touch command creates the new file you specify and assign your username as the owner.

The **touch** command can also be used to change the modification time. This is done without changing the content of the file.

## Copying files
Copying files and directories from one location in the filesystem to another is a common practise for system administrators. The **cp** command provides this feature.

In its most basic form, the cp command uses two parametes. 1. The source object and the destination object.

    $ cp test_one test_two
    $ ls -l test_*

If you don't answer y, the file copy does not proceed. You can also copy a file into a pre-existing directory.

    $ cp -i test_one /home/edd/Documents/
    edd@edd:~$ ls -la /home/edd/Documents/
    total 8
    drwxr-xr-x  2 edd edd 4096 Apr 14 20:18 .
    drwx------ 27 edd edd 4096 Apr 14 20:15 ..
    -rw-r--r--  1 edd edd    0 Apr 14 20:18 test_one
The new file is now under the Documents subdirectory, using the same filename as the original.

You could easily use relative path directory reference.

     $ cp -i test_one Documents/
     $ ls -l Documents
You read about thes special symbols that can be use in relative directory refences. One of them:

     - The single dot (.)  represents previous directory.
     - cp -i /etc/NetworkManager/NetworkManager.conf .

It's hard to see that single dot!. Using the single dot symbols is much easier than typing a full destination object name, when you have long source object names.

The -R paramets is powerful **cp** command option. It allows you to recursively copy the contents of an entire directory in one command.

      $ ls -Fd *txt
      edd@edd:~$ ls -Fd *txt
      text.txt  texz.txt

You can also used wildcard metacharacters in your cp commands.

    $ cp *scripts  mod_scripts/
    $ ls -l mod_scripts
This command copied any files that ended with script to *mod_scripts*.

## Using tab auto-complete

When working at the command line, you can easily mistype a command, directory name, or filename. The longer a directory or filename, the greater the chance that you will mistype it.

This is where **tab auto-complete** can be a lifesaver. Tab auto-complete allows you to start typing a filename or directory name and then press the tab key to have the shell complete it for you:

    $ ls really*

## Linking files

Linking files is a great option available in the linux filesystem. If you need to maintain two (or more) copies of the same file on the system. Instead of having separate physical placeholder in a directory that points to the real location.

    1. A symbolic link
    2. A hard Link.

**A symbolic link** is simply a physical file that points to another file somewhere in the virtual directory structure. The two symbolically linked together files do no share the same contents.

To create a symbolic link to a file, the original file must pre-exist. We can the use the **ln** command with the -s option to create the symbolic link.

    edd@edd:~$ ln -s text.txt  text_link
    edd@edd:~$ ls -la tex*
    lrwxrwxrwx 1 edd edd 8 Apr 14 20:49 text_link -> text.txt
    -rw-r--r-- 1 edd edd 0 Apr 14 18:30 texz.txt
The -> symbol displayed after the symbolic link file's long listing shows that it is symbolically linked to the file data-files.

Also note the size of the symbolic link and the actual file.The symbolic link size is 8 bytes while the actual file is 18 bytes.

    edd@edd:~$ nvim text.txt
    edd@edd:~$ ls -la tex*
    lrwxrwxrwx 1 edd edd  8 Apr 14 20:49 text_link -> text.txt
    -rw-r--r-- 1 edd edd 18 Apr 14 20:53 text.txt
    -rw-r--r-- 1 edd edd  0 Apr 14 18:30 texz.txt
Another way to tell these linked files are separate physically files is by viewing their inod numbers. The inode numbers of a file directory is a unique identification number that the kernel assigns to each object in the filesystem.

    edd@edd:~$ ls -i *tex*
    3685885 text_link  3686544 text.txt  3686536 texz.txt
The example above have 3685885 and 3686544. They are different files.

A **hard link** create a separate virtual file that contains information about the original file and where to locate it. They are physically the same file. When you reference the hard link file.

      [edd@edd ~]$ls -l hard*
      -rw-r--r-- 1 edd edd 0 Apr 14 21:06 hard_one
      [edd@edd ~]$ln hard_one hard_link
      [edd@edd ~]$ls -li hard*
      3685885 -rw-r--r-- 2 edd edd 0 Apr 14 21:06 hard_link
      3685885 -rw-r--r-- 2 edd edd 0 Apr 14 21:06 hard_one
We used **-li** command to show both the inode number and long listing for the inode number. This is because they aer physically the same file. The files are exactly the same size.

> ### Note: you can only create a hard link between files on the same physical medium. To create a link between files under separate physical mediums, you must use a symbolic link.

If you use the cp command to copy a file that's linked to another source file, all you're doind is making another copy of the source file. You can just create a new symbolic link to the original file (no problem).

## Renaming files

Renaming files is called **moving files**. The *mv* command is available to move both files and directories to another location or a new name:

    [edd@edd ~]$touch fall
    [edd@edd ~]$ls -li f?ll
    3686536 -rw-r--r-- 1 edd edd 0 Apr 14 21:17 fall
    [edd@edd ~]$mv fall fzll
    [edd@edd ~]$ls -la f?ll
    -rw-r--r-- 1 edd edd 0 Apr 14 21:17 fzll
Notice that moving the file changed the name from **fall** to **fzll**.The inode number is retained and timestamp value. **mv** commad affect only a files name.
You can also **mv** to change location.

    $ mv <file> <destination>
you can also used the mv command to move entire directories and their contents:

    [edd@edd ~]$ls -li bunnyfylcolemak
    total 4
    3801890 drwxr-xr-x 5 edd edd 4096 Apr 13 09:48 dotfiles
    [edd@edd ~]$mv bunnyfylcolemak colemakdotfiles
    [edd@edd ~]$ls -li colemakdotfiles
    total 4
    3801890 drwxr-xr-x 5 edd edd 4096 Apr 13 09:48 dotfiles

The directories entire content are unchange. The only thing that changes is the name of the directory.

### Deleting files

Whether it's to clean up a filesystem or to remove a software package, you always have opportunities to delete files.

Deleting is called **removiing**. the command to remove files in the bash shell is *rm*. The basic form of the rm command is simple.

Notice that the *i* command parameter prompts you to make sure that you're serious about removing the file. Thes shell has no recycle bin or trashcan. After you remove a file , it's gone forever.

## Managing Directory

Linux hass a few commands that works for both files and directory (such as the cp command) and some that work only for directories. To create a new directory, you need to use a specific command.

### Creating directory

Creating a new directory in Linux is easy -Just use the mkdir command:

    $ mkdir new_dir
    $ ls -ld new_dir

The system create a new directory named new_dir.

    [edd@edd ~]$mkdir new_dir
    [edd@edd ~]$ls -ld new_dir
    drwxr-xr-x 2 edd edd 4096 Apr 14 23:16 new_dir

You can create directory and subdirectories in "bulk" if needed.

     $ mkdir new_dir/sub_dir/under_dir
    [edd@edd ~]$mkdir new_dir/sub_dir/under_dir
    mkdir: cannot create directory ‘new_dir/sub_dir/under_dir’: No such file or directory

To create several directory and subdirectories at the same time, you need to add the **-p** parameter.

    $ mkdir -p new_dir/sub_dir/under_dir
    $ ls -R new_dir

The -p option on the mkdir command makes any missing parent directories as needed. A parent directories is a directory that contains other directories at the next level down the directory tree.

## Deleting directories

There are lots of opportunities for bad things to happens when you start deleting directories . The shell tries to protect us from accidental catastrophes as much as possible.

    $ touch new_dir/my_file
    $ ls -la new_dir
    $ rmdir new_dir

**rmdir** command works only for removing empty directories.
Ti fix this, we must remove the file first. Then we can use the rmdir command on the now empty directory:

    $ rm -i new_dir/my_file
    $ rmdir new_dir

Check the directory structure using the **tree** command.


    edwin@edwin:~$ tree small_dri/
    small_dri/
    ├── a_file
    ├── b_file
    └── c_file

    0 directories, 3 files
    edwin@edwin:~$ rm -rf small_dri/
    edwin@edwin:~$ tree small_dri/
    small_dri/ [error opening dir]

    0 directories, 0 files

The rm -rf command gives no warnings and no fanfare which is extremely dangerous tool to have, especially if you have superuser privileges.

## Viewing Files Content

You can use several commands for looking inside files without having to pull out a text editor utility.


### Viewing the file type.

The file command is a handy little utility to have around. It can peek inside of a file and determine just what king of file it is.

    [edwin@edwin ~]$nvim edd.txt
    [edwin@edwin ~]$file edd.txt
    edd.txt: ASCII text

Binary executable programs. The file command determines the platform that the program was complile for and what type of library it requires.

Now that you know a quick method for viewing a file's type.

## Viewing the whole file.

### Using the cat command

The cat command is a handy tool for displaying all the data inside a text file.

      [edwin@edwin ~]$cat edd.txt
      This is test

## Monitoring Disk Space
Some command line commands can help you manage the media environment on your linux system.
To be able to monitor your disk space you need to understand how to mounting media works.

Most of the linux distribution out there have the ability to automatically mount specific types of `removable media`. A removable media device is a media that can be easily removed from the pc, such as `CD-ROMs` and `USB memory sticks`.

## The mount command.
The command used to mount media is called mount. The `mount` command displays a list of media devices currently mounted on the system.

	$ mount
	proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
	sys on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
	dev on /dev type devtmpfs (rw,nosuid,relatime,size=8017640k,nr_inodes=2004410,mode=755)
	run on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
	/dev/sdb6 on / type ext4 (rw,noatime,discard)
The mount command provides four pieces of information.

   1. The device filename of the media.
   2. The mount point in the virtual directory where the media is mounted.
   3. The filesystem type.
   4. The access status of the mount media.

The last entry in the preceding example is a `USB memory stick`. To manually mount a media device in the virtual directory, you must be logged in as the root user or use the `sudo` command to run the command as the root user. The following is the basic command for manually mounting a media device.

    mount -t type device directory

The type parameter defines the filesystem type under which the disk was formatted. Linux recognizes lots of different filesystems types. If you share removable media withe your winows PCs, you are most likely to run into thes types:

	* vfat : Windows long filesystem
	* ntfs : Windows advanced filesystem used in Windows NT, XP, and Vista.
	* iso9660 : The standard CD-ROM filesystem.
Mount USB memory stick at device `/dev/sdb1` at location `/media/disk` you could use such a command.

          mount -t vfat /dev/sdb1  /media/disk

After a media device is mounted in the virtual directory, the rood user has full access to the device, but access by other users is restricted. You can control who has access to device using directory permissions.

The `-o` options allows you to mount the filesystem with a comma-separated list of additional options. These are popular option to use:

  1. ro: Mount as read-only
  2. rw: mounts as read-write
  3. User: Allow an ordinary user to mount the filesystem
  4. Check=none: Mount the filesystem without performing an integrity check.
  5. loop: Mounts a file.

### The Unmount command.

To remove a removable media device, you should never just remove it form the system Instead, you should alwayst unmount it first.

The command used to unmount devices is `unmount` (yes, there's no "n" in the command, which get confusing sometimis). The format of the unmount command is pretty simple.

	umount [directory | device ]
The unmount command gives you the choice of defining the media device by either its device location or its mounted directory name. If any Program has a file open on a device the system won't lets you unmount it.

	[dwm@edwin ~]$ sudo umount test
	umount: /home/dwm/test: target is busy.
	[dwm@edwin ~]$

## Using the df command.

Sometimes, you need to see how much disk space is available on an individual device. The df command allows you to easily see what's happening on all the mounted disks.

	Filesystem     1K-blocks     Used Available Use% Mounted on
	dev              8017640        0   8017640   0% /dev
	run              8027328     1456   8025872   1% /run
	/dev/sdb6      123443708 16536504 100593580  15% /
	tmpfs            8027328        0   8027328   0% /dev/shm
	tmpfs            8027328        0   8027328   0% /sys/fs/cgroup
	tmpfs            8027328        4   800

The df command shows each mounted filesystem that contains data.  As you can see from the mount command, some mounted devices are used for internal system purposes. The command displays the following.

  1. The device location of the device.
  2. How many 1024-byte blockes of data it can hold.
  3. How many 1024-byte blocks are available.
  4. The amount of used Space as percentage.
  5. The mount point where the device is mounted.

A few different command line parameter are available with the df command, most if which you'll never use. One popular parameter is -h, which shows the disk space in human readable form, usually as an M for Megabytes or a G for gitabytes.

	[dwm@edwin ~]$ df -h
	Filesystem      Size  Used Avail Use% Mounted on
	dev             7.7G     0  7.7G   0% /dev
	run             7.7G  1.5M  7.7G   1% /run
	/dev/sdb6       118G   16G   96G  15% /
	tmpfs           7.7G     0  7.7G   0% /dev/shm
	tmpfs           7.7G     0  7.7G   0% /sys/fs/cgroup
	tmpfs           7.7G  4.0K  7.7G   1% /tmp
	tmpfs           1.6G   12K  1.6G   1% /rp

## Using the du command

With the `df command you can easily see when a disk is running out of space`. The next problem for the system administrators is to know what to do when that happens.

the `du command shows the disk usage for a specific directory`. this is a quick way to determine if you have any obvious disk hogs on the system. by default, the du command displays all the files directories and subdirectories under the current directories, and it shows how many disk blocks each files or directories takes.

```du
[dwm@edwin ~/mount/mycodes/blog]$ du
0       ./.git/branches
39      ./.git/hooks
1       ./.git/info
11      ./.git/logs/refs/heads
2       ./.git/logs/refs/remotes/origin
|                   |
V                   V
no.of block          path of directory

```

The number to the left of each line is the `number of disk blocks that each files or directory takes`. The listing starts at the bottow of a directory and works its way up through all the files and subdirectories.

You can use a few command line parameters with the du command to make things a little more legible:
```du
-c: Produces a grand total of all the files listed.
-h:Prints sizes in human readable form.
-s: summarrizes each argument

```

## Working with Data Files

Handling the information and making it useful can be difficult. Linux system provide several command line tools to help you manage large amount of data. This section covers the basic command that every system administrator as well as any everyday linux user.

### Sorting data

Thes `sort` commands does what it says: `it sorts data`.

By default, the `sort` comman sorts the data linux in a text file using standard sorting rules for the language you specify as the default for the session.

```sort
[dwm@edwin ~]$ sort file1
four
one
three
two

```
By default , `sort` recognizes everything in a files as characters and performs a `character sort`. To recognize number we use `-n parameter` which tells the sort command to recognize numbers as numbers instead of characters and to sort them based on their numerical values.

charcter sort
```sort
[dwm@edwin ~]$ sort file2
1
10
2
23
3
3
43

```
sort with -n prameter. (Numerical sort)

```sort
[dwm@edwin ~]$ sort -n file2
1
2
3
3
10
23
43
45
```
Another commmon parameter that's used is -M, the month sort. Linux log files usually contain a timestamp at the beginn of the line to indicate whe the event occurred.

```sort
  Sep 12 04:30:10 testbox smart[2312]: Device: /dev/sda, opened
```
The `-k` and `-t` parameter are handy when sorting data that uses fields, such as the /etc/passwd file. Use the -t parameter to specify the field separator character, and ues the -k parameter to specify which field to sort on.

To sort the password file based on numerical userid, just do this:

```sort
[dwm@edwin ~]$ sort -t ':' -k 3 -n /etc/passwd
root:x:0:0::/root:/bin/bash
bin:x:1:1::/:/usr/bin/nologin
daemon:x:2:2::/:/usr/bin/nologin
mail:x:8:12::/var/spool/mail:/usr/bin/nologin
ftp:x:14:11::/srv/ftp:/usr/bin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/usr/bin/nologin
```
Now the data is perfectly sorted on the third field which is the numerical userid value.The `-n` is great for sorting numeriacal outputs, such as the outputs of the du command:

```sort
[dwm@edwin ~]$ du -sh * | sort -nr
800M    Documents
650M    visual-studio-code-bin
516K    video-200511-1019-38.mkv
328K    node_modules
252M    test
44K     package-lock.json
36K     LICENSE
33G     VirtualBox VMs

```
Notice that the `-r` option also sorts the value in desceding order, so you can easily see what files are taking up the most space in your directory.

### Searching for data.

Often in a large file, you must look for a specific line of data buried somewhere in the middle of the file. Instead of manually scrolling throught the entire file, you can let the grep command search for you. The command line Format for the grep command is:

```grep
grep [option] pattern [file]
```
The `grep` command search either the input or the file you specify for lines that contains character that match thes specified pattern. The outputs from grep is the lines that contains the matching pattern.

Here are two simple example of using the grep command with the file1 used above command.

```grep
[dwm@edwin ~]$ grep three file1
three

```
The grep command produces the line that contains the matching pattern. If you want to reverse the search (outputs the lines that don't match a pattern) use the `-v` parameter.

```grep
[dwm@edwin ~]$ grep -v t file1
one
four

```
If you need to find the line number where the mapching patterns are found, use the `-n` parameter.

```grep
[dwm@edwin ~]$ grep -n t file1
2:two
3:three

```
If you need to find the line number where the matching pattern are found use the `-n` parameter.

If you just need to see count of how many lines contains the matching pattern, use the -c parameter:

```grep
[dwm@edwin ~]$ grep -c t file1
2

```
If you need to specify more than one matching pattern, use the -e parameter to specify each individual pattern:

```grep
[dwm@edwin ~]$ grep -e t -e f file1
two
three
four

```
The grep command uses basic `unix-style regular expression to match patterns`. A unix-style regular expression uses special character to define how to look for matching patterns.

Example of using a regular expression in a grep search.

// TODO : regular expression does not work on my system

The `egrep` command is an offshoot of `grep`, which allows you to specify `POSIX` extended reqular expression, which contains more characters for specifying the matching pattern.

## Compressing Data.
No doubt you've used zip files. Linux contains several files compression utilities. Although this may sount great, it often lead to confusion and chaos when trying to download files.

Linux file compression utilities

Utility| File Extension |Description
-------|----------------|-----------
bzip2|.bz2| Uses the Burrow-Wheeler block sorting text compression algorithm and huffman coding
compress|.z|Original Unix file compression Utility:starting to fade away into obscurity
gzip|.gz|The Gnu Project's compression utility; uses Lemperl-ziv coding
zip|.zip|The unix Version of the PKZIP program for windows
