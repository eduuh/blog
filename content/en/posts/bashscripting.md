---
title: "Bashscripting"
date: 2020-04-11T16:02:40+03:00
draft: true
linktitle: "The Linux Workshop"
title: "Learn CLI and Bash Scripting"
categories: ["comandline","linux"]
tags: ["productivity","bash"]

image : images/configurations.png
author: eduuh # author name
authorEmoji:  🤖# emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description

---


## The Linux Command Line

Before you can dive into working with the linux command line and shells, you should first understand  `what linux is`, `where it came from` and `how it works`.

> #### What is Linux

If  you've never worked with Linux before, you may be confused about so many different versions are available.

First, Four main part makes up a linux system:

1. **The Linux kernel**
2. **The Gnu Utilities**
3. **A graphical desktop enviroment**
4. **Application software.**


Each of these parts has a specific job in the linux system. No part is very useful by itself.

### Looking into the Linux Kernel.

The core of the Linux system is the **kernel**. The kernel:

 * controls all the hardware and sofware on the computer system
 (allocating hardware when necessary and executing software when required.)

If you've been following the Linux world at all, no doubt you've heard the name **Linus Torvalds**. `Linus is the person responsible for creating the first linux kernel softwae whe he was a student at university of Helsinki`. He intended it to be a copy of the **Unix system,** at the time a popular operating system used at many universities.

After developing the linux kernel, **linus released it to the internet community and solicited suggestions for improving it.** This simple pros started a revolution in the world of computer operating sytems.Soon Linux was receiving suggestions from students as well as professional programmers from around the world. Allowing anyone to change programming code in the kernel would result in complete chaos.

To simplify things, linus acted as a central point for all improvement suggestions. It was ultimately Linux's decision whether or not to incorporate suggested code in the kernel.

This same concept is still in place with the linux kernel code, except that instead of just linux controlling the kernel code, a team of developers has taken on the task.


The kernel is primarily responsible for four main functions:

1. [System memory management]()
2. [Software Program management]()
3. [Hardware management]()
4. [Filesystem management]()


### System Memory Management

Not only does the kernel manages the **physical memory** available on the server, but it can also **create and manage virtual memory** (memory that does not actually exist).

It does this by using space on the hard disk, called the **swap space**. `The kernel swaps the contents of virtual memory location back and forth from the swap space` to the actual **physical memory**. This allows the system to think there is more memory available than what physically exists.


The **memory locations are grouped into blocks called pages**. The kernel locates each page of memory either in the physical memory or the swap space. The kernel then maintains memory page that indicates which pages are in physical memory and which pages are swapped out of disk.


### Software Program Management

The linux operating system calls a running program a *process*. A process can run in the foreground, displaying output on a display, or it can run in the background.

The kernel creates the first process, called the **init process**, to start all other processes on the system. When the kernel starts, it loads the init process into virtual memory. As the kernel starts each additional process, it gives it a unique area in virtual memory to store the data and code that the process uses.

Some linux implementations contain a table of processes to start automatically on bootup. On linux systems, this table is usually located in the special file **/etc/inittabs**.

Other systems (such as the popular Ubuntu linux distribution) Utilze the */etc/init.d** folder, which contains scripts for starting and stopping individual application at boot time. The Scrips are started via entries under the **/etc/rx.d** folders where X is a run level.


### Hardware Management

Any device that the Linux system must communicate with needs driver code inserted inside the kernel code. The drive code allows the kernel to pass data back and forth to the device, acting as a midlle man between application and the hardware. Two methods are used for inserting device driver code in the Linux kernel.

1. Driver compiled in the kernel.
2. Driver modules added to the kernel.

The only way to insert device driver code was to recompile the kernel. Each time you added a new device to the system, you had to recompile the kernel code. This process became even more inefficient as Linux kernel supported more hardware. Fortunately Linux developers devised a better method to insert driver code into the running kernel.

Programmers developed the concept of kernel modules to allow you to insert driver code into a running kernel without having to recompile the kernel. A kernel module could be removed from the kernel when the device was finished being used.

The linux system identifies hardware devices as special files, called **device files**. There are three classification of device files:

1. Character
2. Block
3. Network.

### Filesystem management

The linux kernel can `support different types of filesystems to read and write data to` and from `hard drives`. Besides having over a dozen filesystems to read and write data to and from hard drive. Besides having over a dozen filesystems on its own.


### The GNU utilities

The **Gnu Organization (GNU stands for GNU's not Unix) developed a complete set of unix utilities but had no kernel system to run them on. These utilities were developed under a software pilosophy called **open source software (OSS).**

## The core Gnu Utilities
The **Gnu** coreutils package consists of three parts:

  1. Utilities for ~~handling files~~
  2. Utilities for ~~manipulating text~~
  3. Uitlities for ~~managing process.~~


## Basic bash shell commands.

 The default shell used in many Linux distribution is the *GNU bash shell.*

### Starting the Shell

The  **GNU bash shell** is a program that provides interactive access to the linux system. It runs as a regular program and is normally started whenever a user logs in to a terminal.

The **etc/passwd** file contains a *list of all the system user accounts,* along with some basic configuration information about each user. Here is an entry

  edd:x:1000:1001:edd:/home/edd:/usr/bin/bash

Each entry has seven data fields, with fields separated by colons. The system uses the data in these fields to assign specific features for the user.

The above line means.

**edd** log in into linux system and **bash** program is automatically started.

There are two methods of login into a linux box.

1. Virtual console terminal. requires a **cli prompt**
2. Graphical login. requires a **graphical emulator.**

### Using the Shell Prompt.

When you log in to a linux virtula console. you get access to the shell **cli prompt** . The prompt is your gateway to the shell. The place you input commands.

The default prompt symbol is a **dollar sign ($)**

Different distribution uses different format of prompt. Examples

* Ubuntu looks like
	- edwin@server:~$
* CentOs Linux or Manjano
	- [edwin@server:~$]

The prompt is meant to provide useful information.

1. edwin -> Current user Id
2. server -> name of the system


`Note` that the promp is not static. It could be changed to suit your need.

### Interacting with the bash Manual

The **man** command provides access to the manual pages stored on the linux system. Entering the command **man** followed by another command provids that utility's manual entry. Try

```bash
$ man xterm
```

When you use the **man** command to view a command's manual pages, they ared displayed with something called a **pager**.

A `pager` is a utility that allows you to page through displayed text. Thus, you can page through the man pages by pressing the **spacebar**, or can go line by line using the **enter key**. you could olso use **arrow keys**

When you finish with the man pages, press the **q** key to quit. when you quit you are taken back to the **prompt**.

There are also the information pages called **info** pages.

### Navigating the Filesystem

When you log into the system and reach the command line prompt, you are in your home directory.

### looking at the Linux Filesytem.

If you're new to the linux sytem,you may be confused by how it refences files and directories, especially if you're used to the way microsoft windows system does.

Linux stores files within a single directory structure calle a **virtual directory**. The virtual directory contains files paths from all the storage devices installed on the computer, merged into a single directory structure.

The linux virtual directory structure contains a single base directory, called the **root**.Directories and files beneath the root directory are listed based on the directory path used to get to them.

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


Common linux directory are based on **Filesystem Hierarchy Standard(FHS).** You can move around the **virtual directory** using a graphical interface. To move around the virtual directory from a cli prompt.

### Traversing directory

Use the **directory command (cd)** to move your shell session to another directory in the linux filesystem.

The **cd** command may take a single parameter, **destination**. The destination parameter can be expressed using twi different methods.

### Using absolute directory references

You can reference a directory name within the virtual directory system using an **absolute directory reference.** .

An absolute path reference always begins with a forwa slash (/) indicating the virtual directory system's root.

```bash
/usr/bin
```

With the **absolute directory** reference there's no doubt as to exactly where you want to go. To move to a specific location in the Filesystem usind the absolute directory reference, you just specify the full pathname in the **cd** command.

```bash
cd  /use/bin # move to the directory
```

Prompt originalyy had a tilde (~) in it. After the change to a new directory occurred, the tilde was replaced by **/usr/bin.**.

If your prompt has not been configured to show the shell session's current absolute directory location, then you can display the location via a shell command. The **pwd** command display the shell session's current directory location.

    edwin@server  /usr/bin/$ pwd
     /usr/bin

You can move to any leve within the entire **Linux virtual directory** structure from any level usind the absolut refence:

    edwin@server: /usr/bin/$ cd /var/log

note: think of absolute as a full path.

### using Relative directory references

**Relative directory reference** allow you to specify a destination directory reference relative to your current location. A Relative directory reference doest start with a folowrd slash.


**Relative directory reference** starts with either a directory name (if you're traversing to a directory under your current directory) or a special character.

    edd@edd:~/Documents$ ls
    edd@edd:~/Documents$ cd ~/Desktop

You can use a relative directory reference with the *cd* command is any directory containg subdirectoroies. You can also use a special character to indcate a relative directory location.

The two special character used for *relative directory reference**.

* The single dot (.) to represent the current directory
* The double dot (..) to represent the parent directory

You can use the single dot but it doesn't make sense to use it with the cd command.  The double dot character is extremely handy when trying to traverse a directory and need to go to your **Downloads** directory.

     edwin@server: ~/Documents$ pwd
     /home/edd/Documents
     edwin@server: ~/Documents$ cd ../Downloads
     edwin@server: ~/Downloads cd ../Downloads

> ###### Use absolute path if it makes sense to use.

### Listing Files and Diretory.

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

The -F parameter flags the directoies with a forward slash (/) to help identify them in the listing.

The basic **ls** command can be somewhat misleading. It shows the files and directory contained in the current directory. Linux often uses hidden files to store configuration information.

To display hidden files along with normal files and directories, use the -a parameter. Here is an example of using the -a parameter with the ls command.

    $ ls -a
    .                         .dotfiles      package-lock.json  .viminfo
    ..                        .dotnet        Pictures           .vscode-oss
    aur                       Downloads      .pki               .Xauthority
    .bash_history             .gitconfig     .profile           .Xclients

All the files beginning with a period, hidden files.Notice that three files begin with **.bash**

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
### Displaying a Long Listing
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
5. The file primary group name.
6. The file byte size.
7. The last time the file was modified.
8. The filename or directory name.

### Filtering listing output

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

### Copying files

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

### Using tab auto-complete

When working at the command line, you can easily mistype a command, directory name, or filename. The longer a directory or filename, the greater the chance that you will mistype it.

This is where **tab auto-complete** can be a lifesaver. Tab auto-complete allows you to start typing a filename or directory name and then press the tab key to have the shell complete it for you:

    $ ls really*

### Linking files

Linking files is a great option available in the linux filesystem. `If you need to maintain two (or more) copies of the same file on the system.` Instead of having separate physical placeholder in a directory that points to the real location.

1. A symbolic link
2. A hard Link.

**A symbolic link** is simply a physical file that points to another file somewhere in the virtual directory structure. The two symbolically linked together files do  share the same contents.

To create a symbolic link to a file, the original file must pre-exist. We can the use the **ln** command with the -s option to create the symbolic link.

    edd@edd:~$ ln -s text.txt  text_link
    edd@edd:~$ ls -la tex*
    lrwxrwxrwx 1 edd edd 8 Apr 14 20:49 text_link -> text.txt
    -rw-r--r-- 1 edd edd 0 Apr 14 18:30 texz.txt

The -> symbol displayed after the symbolic link file's long listing shows that it is symbolically linked to the file data-files.

Also note the size of the symbolic link and the actual file.The symbolic link size is 8 bytes while the actual file is 18 bytes. The symbolic link file acts like a pointer to the other file on the `virtual directory`.

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

> ###### Note: you can only create a hard link between files on the same physical medium. To create a link between files under separate physical mediums, you must use a symbolic link.

If you use the cp command to copy a file that's linked to another source file, all you're doind is making another copy of the source file. You can just create a new symbolic link to the original file (no problem).

### Renaming files
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

### Managing Directory

Linux hass a few commands that works for both files and directory (such as the cp command) and some that work only for directories. To create a new directory, you need to use a specific command.

### Creating directory

Creating a new directory in Linux is easy -Just use the mkdir command:

    $ mkdir new_dir
    $ ls -ld new_dir

The system create a new directory named new_dir.

    [edd@edd ~]$mkdir new_dir
    [edd@edd ~]$ls -la new_dir
    drwxr-xr-x 2 edd edd 4096 Apr 14 23:16 new_dir

You can create directory and subdirectories in "bulk" if needed.

     $ mkdir new_dir/sub_dir/under_dir
    [edd@edd ~]$mkdir new_dir/sub_dir/under_dir
    mkdir: cannot create directory ‘new_dir/sub_dir/under_dir’: No such file or directory

To create several directory and subdirectories at the same time, you need to add the **-p** parameter.

    $ mkdir -p new_dir/sub_dir/under_dir
    $ ls -R new_dir

The -p option on the mkdir command makes any missing parent directories as needed. A parent directories is a directory that contains other directories at the next level down the directory tree.

### Deleting directories

There are lots of opportunities for bad things to happens when you start deleting directories . The shell tries to protect us from accidental catastrophes as much as possible.

    $ touch new_dir/my_file
    $ ls -la new_dir
    $ rmdir new_dir

**rmdir** command works only for removing empty directories. To fix this, we must remove the file first. Then we can use the rmdir command on the now empty directory:

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


### Using the cat command
Used to view the whole files . The cat command is a handy tool for displaying all the data inside a text file.

      [edwin@edwin ~]$cat edd.txt
      This is test

### Monitoring Disk Space
Some command line commands can help you manage the media environment on your linux system.
To be able to monitor your disk space you need to understand how to mounting media works.

Most of the linux distribution out there have the ability to automatically mount specific types of `removable media`. A removable media device is a media that can be easily removed from the pc, such as `CD-ROMs` and `USB memory sticks`.

### The mount command.
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

### Using the df command.

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

### Using the du command

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

### Searching for data. Grep

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

### Compressing Data.

No doubt you've used zip files. Linux contains several files compression utilities. Although this may sount great, it often lead to confusion and chaos when trying to download files.

Linux file compression utilities

Utility| File Extension |Description
-------|----------------|-----------
bzip2|.bz2| Uses the Burrow-Wheeler block sorting text compression algorithm and huffman coding
compress|.z|Original Unix file compression Utility:starting to fade away into obscurity
gzip|.gz|The Gnu Project's compression utility; uses Lemperl-ziv coding
zip|.zip|The unix Version of the PKZIP program for windows

The **gzip** package is the most popular compression tool in Linux. The gzip package is a creating of the **Gnu** project in their attempt to create a free version of the original unix compress utility. This package includes these files:

1. **gzip** for compressing files.
2. **gzcat** for displaying the contend of compressed text files.
3. **gunzip** for uncompressing files.

These utilities work the same way as the **bzip2 utilities**.

```gzip
[dwm@edwin ~]$ gzip file1
[dwm@edwin ~]$ ls -l fi*
-rw-r--r-- 1 dwm wheel 45 May 11 23:41 file1.gz
-rw-r--r-- 1 dwm wheel 26 May 11 23:47 file2

```
The **gzip** command compresses the file you specify on the command line. You can also specify more than one filename or even use wilcard character to compress multiple files at once.

```gzip
[dwm@edwin ~]$ gzip fi*
[dwm@edwin ~]$ ls -la fi*
-rw-r--r-- 1 dwm wheel 26 May 12 00:48 file1.gz
-rw-r--r-- 1 dwm wheel 26 May 12 00:48 file2.gz
-rw-r--r-- 1 dwm wheel 26 May 12 00:48 file3.gz

```
The **gzip** command compresses every file in the directory that matches the wildcard pattern.

### Archiving data

Although the zip command works great for compressing and archiving data into a single file, it's not the standard utility used in the unix and linux worlds. By far the most popular archiving tool used in unix and Linux is the `tar command`.
The tar command war originally used to write files to a tape device for archiving. It can also write the outputs to a file, which has become a popular way to archive data in linux.

The following is the format of the tar command:

        tar function [option] object1 object2..

Some options for the command includes:

Options|Description
-------|-----------
-C dir | Changes to the specified directory
-f file| Outputs results to file (or device) file
-j     | Redirects outputs to the bzip2 command for compression
-p     | Preserves all file permission
-v     | List files as they are processed
-z     | Redirects the outputs to the gzip command for compression

The options are usually combined to creade the following scenarios. First, you want to create an archive file using this command:

```tar
tar -cvf test.tar test/ test3/
```
The above command creates **an archive file called test.tar** containing the contents or both the test directory and the test2 directory.

```tar
tar -tf test.tar
```
list (but doesn't extract) the content of the tar file test.tar. Finaly, this command:

```tar
tar -xvf test.tar
```
extract the content of the tar file test.tar.If the tar was created from a directory, the entire directory structure is re-created starting at the current directory. This is a common method for distributing source code files for open source application in the linux world.

## Understanding the shell

Now that you know a few shell basics its time to explore the actual shell process. To understand the shell, you need to understand a few cli basics.

A `shell` is not just a cli. It a complicated interactive running program. Entering commands and using the shell to run scripts can raise some interesting and confusing issues. Understanging the shell process and its relationships help you resolve these issues or avoid them altogether.

## Exploring the Shell Types

The bash shell program resides in the /bin directory. A long listing reveals **/bin/bash** is an executable program.

    [dwm@edwin ~]$ ls -lF /bin/bash
    -rwxr-xr-x 1 root root 903504 Feb 17 14:31 /bin/bash*
Also, the zsh installed used for this distribution.

    [dwm@edwin ~]$ ls -lF /bin/zsh
    -rwxr-xr-x 2 root root 869608 Feb 16 20:55 /bin/zsh*

The **default interactive** shell starts whenever a user logs into a virtual console terminal or start a terminal emulator in the GNU. The default system shell is used for system shell script such as those needed at startup.

On some distribution, the default system shell is different that the default interactive shell, such as the `ubuntu distribution`.

    [dwm@edwin ~]$ cat /etc/passwd
    root:x:0:0::/root:/bin/bash
    eduuh:x:1003:998::/home/eduuh:/bin/zsh

Note that the user, **eduuh** has his default interactive shell set to **/bin/zsh**, the zsh shell. But the default system shell is set to **bash**.

You are not forced to stick with your default interactive shell. You can start any shell available on your distribution, simply by typing its filename. For example, to start the **bash** shell.

      [dwm@edwin ~]$ bash
It doest seem like much happened. However the bash shell program started. To exit the bash shell use the **exit command**

### Exploring Parent and child shell Relationships.

The default interactive shell started when a usert logs into a virtual console terminal or starts the terminal emulator in the GUI is a parent shell. A parent shell process provides a cli prompt and waits for commands to be entered.

When the `/bin/bash` command or the equivalent bash command is entered at the cli prompt, a new shell program is created. This is `a child shell`. A child shell also has a cli prompt and waits for command to be entered.

A command to bring all this to clarity.

      [dwm@edwin ~]$ ps -f
      UID          PID    PPID  C STIME TTY          TIME CMD
      dwm        14077    4942  0 11:37 pts/6    00:00:00 -zsh
      dwm        20887   14077  0 12:05 pts/6    00:00:00 ps -f
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ ps -f
      UID          PID    PPID  C STIME TTY          TIME CMD
      dwm        14077    4942  0 11:37 pts/6    00:00:00 -zsh
      dwm        20933   14077  1 12:06 pts/6    00:00:00 bash
      dwm        20950   20933  0 12:06 pts/6    00:00:00 ps -f

The first use of ps -f shows two processes. One process has a process ID of 14077. After running the bash shell .

The second use of `ps -f` shows the bash shell is running with a child process ID of 20933 with the PPID of 14077.

    PPID stands for Parend Process ID

When a child shell process is spawned, only some of the parent's environment is copied to the child shell envirionment.

A child shell is also called a `subshell`. A subshell can be created from a parent shell and a subshell can be created from another subshell.

      [dwm@edwin ~]$ ps -f
      UID          PID    PPID  C STIME TTY          TIME CMD
      dwm        14077    4942  0 11:37 pts/6    00:00:00 -zsh
      dwm        23230   14077  0 12:16 pts/6    00:00:00 ps -f
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ ps --forest
	  PID TTY          TIME CMD
	14077 pts/6    00:00:00 zsh
	23242 pts/6    00:00:00  \_ bash
	23250 pts/6    00:00:00      \_ bash
	23262 pts/6    00:00:00          \_ bash
	23275 pts/6    00:00:00              \_ bash
	23307 pts/6    00:00:00                  \_ ps

Not only does this **exit** command allow you to leave child subshell, but you can also log out of your current virtual console terminal or terminal emulator software as well. Just type exit in the parent shell and you gracefully exit the cli.

### Looking at process lists

You can designate a list of commands to be run one after another. This is done by entering a command list using a semicolon (;) between commands.

    [dwm@edwin ~]$ pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls
The commands all executed one after another with no problems. However, this is not a process list. For a command list to be considered a process list, the command must be encased.

    [dwm@edwin ~]$ (pwd; ls;cd /etc ; pwd ; cd ; pwd ; ls)

The parenthesis does not appear to be a big different, they do cause a very different effect. The very different effect. Adding parentheses and turning the command list into a process list created a subshell to execute the commands.

      [dwm@edwin ~]$ pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls ; echo $BASH_SUBSHELL
      /home/dwm
       d           hd         node_modules                  README.md                  visual-studio-code-bin
       Documents   larb       package.json                  Templates                  visual-studio-code-bin.tar.gz
       [...]
       0
At the very end of the command's outputs, you can see the number zero (0) is displayed. The results are different using a process list.

>##### Note the environment variable (BASH_SUBSHELL) is updated when a child subshell is created in the system.

To indicate if a subshell was spawned, a command using an environment variable is needed here.

      [dwm@edwin ~]$ (pwd ; ls; cd /etc ; pwd; cd ; ls ; echo $BASH_SUBSHELL)
      /home/dwm
       d           hd         node_modules                  README.md                  visual-studio-code-bin
       Documents   larb       package.json                  Templates                  visual-studio-code-bin.tar.gz
       Downloads   LICENSE    package-lock.json             test                       w`
       [..]
       1
In this case, the number one(1) displayed at the output's end.This indicates a subsheell was indeed created and used for executing these commands. You can even create a grandchild subshell by embedding parentheses within a process list:

      [dwm@edwin ~]$ (pwd; echo $BASH_SUBSHELL)
      /home/dwm
      1
      [dwm@edwin ~]$ (pwd; (echo $BASH_SUBSHELL))
      /home/dwm
      2

#### Creatively using subshells

One productive subshell method in the interactive sell uses background mode.

#### Investigating background mode
Running a command in backgrount mode allows the command to be processed and frees up your cli for other uses. A classic command to demostrate background mode is the sleep command.

The sleep command acceptsas a parameter the number of seconds you want the process to wait(sleep). This command is often used to introduce pauses in shell scripts. The command `sleep 10`.

To put a command into background mode, the & character is tacked onto its end. Putting the sleep command into background mode allows a little investigation with the ps command.

      [dwm@edwin ~]$ sleep 10&
      [1] 39047

when a program is put into background , two information were displayed before the shell CLI prompt was returned. The first information item is the background job's number (1) displayeg in brackedt. The second item is the background job's process ID 39047.

The ps command was used to display the various processes. Notice that the sleep command is listed.

In addition to the ps command, you can use the `jobs` command to display background job information. The jobs command displays any use'r process (jobs)a currently running in background mode.

The jobs command shows the job number (1) in brackets. It also displys the job's current status(running) as well.

      [dwm@edwin ~]$ sleep 3000&
      [1] 40318
      [dwm@edwin ~]$ jobs
      [1]+  Running                 sleep 3000 &
      [dwm@edwin ~]$ jobs -l
      [1]+ 40318 Running                 sleep 3000 &

when the backgrund job is finished, its completion status is displayed.
Background mode is very handy. And it Provides a method for creating useful subshells at the CLI.

#### Putting process lists in the background

      [dwm@edwin ~]$ (sleep 2 ; echo $BASH_SUBSHELL ; sleep 2)
      1

A two second pause occurs, the number one (1) is displayed indicating a single subshell level (child subshell level), and then another two-second pause occurs before the prompt returns.Putting the same process list in background mode can caouse a slightly different effect with the commang output.

Putting the process list into the background mode causes a job number and process ID to appear.

      [dwm@edwin ~]$ (sleep 2 ; echo $BASH_SUBSHELL ; sleep 2)&
      [2] 42121
      [dwm@edwin ~]$ 1

      [2]+  Done                    ( sleep 2; echo $BASH_SUBSHELL; sleep 2 )

Using a process list in background mode in one creative method for using subshells at the cli. You can do large amount of processing withing a subshell and not have your termnal tied up withe the subshell's I/O.

Putting a process list in background mode in not the only wat to used subshells creatively at the CLI. CO-processing in another method.

### Looking at co-processing

Co-Processing does things at thes same time. It spawns a subshell in background mode and executes a command witing the subshell:

You can be really clever and combine co-processing withe process lists creating nested subshells. Just type your process list and put the command coproc in front of it.

    [dwm@edwin ~]$ coproc (sleep 10; sleep 2)
    [1] 45198
    [dwm@edwin ~]$ jobs
    [1]  + running    ( sleep 10; sleep 2; )
    [dwm@edwin ~]$ ps --for
    [1]  + done       ( sleep 10; sleep 2; )
    [dwm@edwin ~]$ ps --forest
	PID TTY          TIME CMD
      14077 pts/6    00:00:02 zsh
      45244 pts/6    00:00:00  \_ ps
      40318 pts/6    00:00:00 sleep

> #### Note spawning a subshell can be expensive and slow. Creating nested subshells is even more so!

### Understangding shell Built-in commands.
#### Looking at external commands.

An `external command` sometimes called a filesystem command, is a program that exists outside of the bash shell.They are not built into the shell program. An external command program is typically located in `/bin/ /usr/bin, /sbin or /usr/sbin`.

The ps command is an external command. You can find its filename by using both the `which and the type commands`.

    [dwm@edwin ~]$ which ps
    /usr/bin/ps
    [dwm@edwin ~]$ type -a ps
    ps is /usr/bin/ps
    ps is /bin/ps
    [dwm@edwin ~]$ ls -l /bin/ps
    -rwxr-xr-x 1 root root 133384 Feb  5 12:36 /bin/ps
    [dwm@edwin ~]$ ls -la /usr/bin/ps
    -rwxr-xr-x 1 root root 133384 Feb  5 12:36 /usr/bin/ps

Whenevre an external command is executed, a child process is created. This action is termed as `forking`.

Conveniently,the external command ps display its current parent as well as its own forked child processes.

    [dwm@edwin ~]$ ps -f
    UID          PID    PPID  C STIME TTY          TIME CMD
    dwm        14077    4942  0 11:37 pts/6    00:00:03 -zsh
    dwm        40318       1  0 13:37 pts/6    00:00:00 sleep 3000
    dwm        47491   14077  0 14:12 pts/6    00:00:00 ps -f

When the ps command is executed , a child process is created. In this case the Ps command's Ps command is 47491 the parent id of 14077.Whenever a process must fork it takes time and effort to set up the new child process's environment.

#### Looking at built-in commands
Built-in commands are different in that they do not need a child process to execute. They were compiled into the shell into the shell and thus are part of the shell's toolkit.No external program.

Both the `cd` command and `exit` command are built into bash shell. You can tell a command is built-in by uisng the type command.

      [dwm@edwin ~]$ type cd
      cd is a shell builtin
      [dwm@edwin ~]$ type exit
      exit is a shell builtin
      [dwm@edwin ~]$ type type
      type is a shell builtin
Because they do not need to fork a child process to execute or open a program file, built-in commands are faster and more efficient. A list of GNU bash shell built-in command is provided.

Be aware that some commands have multiple flavors. Both echo and pwd have a build-in command flavor as well asn an external command flavor. These flavors are slightly different.

To see multiple flavors you can pass a flag a to the type command.

    [dwm@edwin ~]$ type -a echo
    echo is a shell builtin
    echo is /usr/bin/echo
    echo is /bin/echo
    [dwm@edwin ~]$ which echo
    echo: shell built-in command
    [dwm@edwin ~]$ type -a pwd
    pwd is a shell builtin
    pwd is /usr/bin/pwd
    pwd is /bin/pwd

#### Using the history command

A useful built-in command is the `history` command. The bash shell keeps track of the commands you have used. You can recall these command and even reuse them.

To see a recently used commands list just type the history command with no options:

      [dwm@edwin ~]$ history
	 38  type -a ps
	 39  ls -l /bin/ps
	 40  ls -la /usr/bin/ps
	 41  clear
	 42  ps -f
	 43  clear
To recall and reuse the last command in your history list. This can save time and typing. To recall and reuse your last command type !! and press the Enter key.

      [dwm@edwin ~]$ ps --forest
	  PID TTY          TIME CMD
	14077 pts/6    00:00:03 zsh
	51497 pts/6    00:00:00  \_ ps
      [dwm@edwin ~]$ !!
      ps --forest
	  PID TTY          TIME CMD
	14077 pts/6    00:00:03 zsh
	51511 pts/6    00:00:00  \_ ps

Command history is kept in the hidden .bash_history file, which is located in the user's home directory. Be careful here. The bash command history is stored in memory and then written out into the history file when the shell is exited:

    [dwm@edwin ~]$ history
       51  clear
       [...]
To reuse the `clear` command you use an ! followed by the command number.

    [dwm@edwin ~]$ !51

#### Using Command aliases

The `alias` command is another shell built-in command. A commannd alias allows you to create an alias name for common commands (along with their parameters) to help keep your typing to a minimum.

Most likely, your linux distribution has already set some common command aliases for you. To see a list of the active alaises, Use the alias command with -p parameter.

      [dwm@edwin ~]$ alias
      D='cd ~/Downloads && ls -a'
      YT=youtube-viewer
      bd='nvim /home/dwm/.config/directories'
      bf='nvim /home/dwm/.config/files'
      bw='nvim /home/dwm/.config/bookmarks'
      alias ls='ls --color=auto'
Most of the aliases above are my own..You can create your own aliases using the alias command:

    [dwm@edwin ~]$ alias li='ls -li'
    [dwm@edwin ~]$ li
    total 12436
    7213906 -rw-r--r-- 1 dwm  wheel       1 May  1 23:21  d
    7209752 drwxr-xr-x 3 dwm  wheel    4096 May 10 06:29  Documents
    7209748 drwxr-xr-x 2 dwm  wheel    4096 May  8 21:12  Downloads
    7227410 -rw-r--r-- 1 dwm  wheel      26 May 12 00:48  file1.gz
    7211488 -rw-r--r-- 1 dwm  wheel      26 May 12 00:48  file2.gz
Fortunately, you can make value permanent across subsells. The next section covers how to do that, along withe envirronment variables.


### Using Linux Environment Variables

Linux environment variables help define your linux shell experience. Many programs and scripts use environment variables to obtain system information and store temporarary data and configuration information. Envrionment variables are set in lots of places on the linux system, and you should know where these places are.

#### Looking at environment variables
The bash shell uses a feature called `environment` variables to store information about thes shell session and the working environment (thus the name environment variables). This features also allows you to store data in memory that can be easily accessed by any program or script running from the shell. It is handy way to store needed persistent data.

There are two environment variables types in the bash shell:

* Global variables
* Local variables

### Looking at global enviroment variables
Global environment variables are visible from the shell sessions and from any spawned child subshells. Local
variables are available only in the shell that creaates them. This makes global environment variables useful in applications that create child subshells, which require parent shell information.

The linux system set several global environment variables when you start your bash sessions.The system environment variables almost use all capital letters to differentiate them form normal user environment variables.

To view global environment variables, use the `env` or the `printenv` command.

      [dwm@edwin ~]$ printenv
      ALSA_CONFIG_PATH=/home/dwm/.config/alsa/asoundrc
      ANDROID_HOME=/opt/android-sdk
      ANDROID_SDK_HOME=/home/dwm/.config/android
      ANSIBLE_CONFIG=/home/dwm/.config/ansible/ansible.cfg
      [..]
So many global environment variables get set for the bash shell that the display had to be snipped.Not only are many set duiring the login process,but how you log in can affect which ones are set as well.

To display an individual environment variable's value, you can use the `printenv` command, but not the env command.

      [dwm@edwin ~]$ printenv HOME
      /home/dwm
      [dwm@edwin ~]$ env HOME
      env: ‘HOME’: No such file or directory
You can also use the `echo` command to display a variable's value. When referencing an environment variable in this case, you must place a dollar sign ($) before the environment variable name:

      [dwm@edwin ~]$ echo $HOME
      /home/dwm

Using `dollar sign` along with the variable name does more than just display its current definition when used with the echo command. The dollar sign before sign before a variable name allows the variable to be passed as a command parameter.

      [dwm@edwin ~]$ ls $HOME
       d           hd         node_modules                  README.md
       [..]

Global variables are also availabe to any process's subshells.

#### Looking at local environment variables.

Local environment variable , as their name implies can be seen only in the local process in which they are defined. Even though they are local, they are just as important as global enviroment variables. In fact, the Linux system also defines standard local environment variables for you by default.

You can create you own local variables called `user-defined local variables`.
Trying to see the local variable list is a little tricky at the cli. There isn't a command that displays only these variables. The set command displays all variables defined for a specific process, including both local and global envirionment variable and user-defined variable.

      [dwm@edwin ~]$ set
      '!'=0
      '#'=0
      '$'=81710
      '*'=(  )
      -=569JXZilms
      0=-zsh
      '?'=0
      @=(  )
      ALSA_CONFIG_PATH=/home/dwm/.config/alsa/asoundrc
All global environment variable displayed using the `env` and `printenv` command appear in the set command's output. The additional environment variable are the `local environment and user-define variables`.


### Settign User-Defined Variables

You can set your own variable directly from the bash shell. After you start a bash shell , you're allowed to create local user-defined variables that are visible withing your shell process. You can assign either a numeric or a string value to an environment variable by assigning the variable to a value using the equal sign:

    [dwm@edwin ~]$ echo $variable

    [dwm@edwin ~]$ variable=Muraya
    [dwm@edwin ~]$ echo $variable
    Muraya
That was simple! Now any time you need to reference the my_variable user-defined variable value, just reference it by the name `$variable`.

If you need to assign a string value that contains spaces, you need to use a single or double quotation mark to delineate the beginning and the end of the string:

Without the quatation marks, the bash shell assumes that the next word is anothe command to process. Notice that for the local variable you defined,you used lowerscase letters, while the system environment variable you've seen so far have all used uppercase letters.

>##### The standard bash shell convention is for all environment variables to use uppercase letters. If you are creating a local variable for yourself and your own shell scripts, use lowercase letters. Variables are case sensitive. By keeping your user-defined local variable lowercase, you avoid the potential disaster of redefining a system environment variable.

It's extremely important that you not use spaces between the variable name , the equal sign and the value. If you put any spaces in the assignment, the bash shell interprets the value as a separate command.

if you set a local varialbe in a child process, after you leave the child process, the local variable is no longer available.

      [dwm@edwin ~]$ echo $my_child_variable
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ my_child_variable="Hello Little world"
      [dwm@edwin ~]$ echo $my_child_variable
      Hello Little world
      [dwm@edwin ~]$ exit
      exit
      [dwm@edwin ~]$ echo $my_child_variable
The local variable set within the child shell doesn't exist after a return to the parent shell.

### Setting global environment variables
Global environment variable are visible form any child process created by the parent process that sets the varaible.

The method used to create a global environment variable is to first create a local variable and then export it to the global environment.

This is done by using the export command and the variable name minus the dollar sign:

      [dwm@edwin ~]$ my_variable="I am Global now"
      [dwm@edwin ~]$ export my_variable
      [dwm@edwin ~]$ echo $my_variable
      I am Global now
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ echo $my_variable
      I am Global now

The variable `my_variable` is available on all shell and subshells. A child shell cannot even use the export command to change the parent shell's global environment variable value.

      [dwm@edwin ~]$ echo $my_variable
      I am Global now
      [dwm@edwin ~]$ clear
      [dwm@edwin ~]$ name="Edwin Muraya"
      [dwm@edwin ~]$ export name
      [dwm@edwin ~]$ echo $name
      Edwin Muraya
      [dwm@edwin ~]$ bash
      [dwm@edwin ~]$ name="Mr muraya"
      [dwm@edwin ~]$ export name
      [dwm@edwin ~]$ echo $name
      Mr muraya
      [dwm@edwin ~]$ exit
      exit
      [dwm@edwin ~]$ echo $name
      Edwin Muraya

#### Removing Environment variables

If you can create a new environment variable, it make sense that you can also remove an existing environment variable. You can do this withe the  `unset` command. When referencing the environment variable in the `unset`

      [dwm@edwin ~]$ my_variable="Muraya Kamau"
      [dwm@edwin ~]$ export my_variable
      [dwm@edwin ~]$ echo $my_variable
      Muraya Kamau
      [dwm@edwin ~]$ unset my_variable
      [dwm@edwin ~]$ echo $my_variable
>##### It can be confusing to remember when to use and when not to use the dollar sign with environment variables. If you are doind anything with the variable, use the dollar sign. If you are doing anything to the variable , don't use the dollar sig. The excepiton to this rule is using `printenv` do display a variable's value.

When dealing with global environmen variable, things get a little tricky. If you're in a child process and unset a global environment variable, it applies only to the child process. The global environment is still available in the parent process.

    [dwm@edwin ~]$ my_variable="I am Global now"
    [dwm@edwin ~]$ export my_variable
    [dwm@edwin ~]$ echo $my_variable
    I am Global now
    [dwm@edwin ~]$ bash
    [dwm@edwin ~]$ unset my_variable
    [dwm@edwin ~]$ echo $my_variable

    [dwm@edwin ~]$ exit
    exit
    [dwm@edwin ~]$ echo $my_variable
    I am Global now
### Uncovering Defaut Shell Environment Variables

The bash shell uses specifi environment variables by defaunt to define the system environment. You can always count on thes variables being set or available to be set on your linux system.

Becaues the bash sell is a derivative of th original Unix Bourne shell, it also include environment variables originally defined in that shell.

Variables| Description
---------|------------
CDPATH   | A colon-separated list of directoriec used as a search path for the cd command
HOME     | The current user's home directory
IFS      | A list of characters that separate fields used by the shel to spit text strings
MAIL     | The filenames of the current user's mailbox (the bash shell check this file fo mails)
MAILPATH | A colone-separate list of multiple filenames for the current user's mailbox
OPTARG   | The value of the last option argument processed by the getopt command.
PATH     | A colon-separated list of directory where the shell looks for command
PS1      | The primary shell command line interface prompt string
PS2      | The secondary shel command line interface prompt string

####### The bash Shell Envrionment varaible
Variable | Decription
---------|------------
BASH | The full pathname to execute the current instance of the bash shell.
BASH_ALIASES | An associative array of currently set aliases
BASH_ARGC | A variable array that contains the parameter being passed to a subroutine or shell
BASH_CMDS | An associative array of location of commands the shell has executed.
BASH_COMMAND | The shell command currently being or about to be executed.
BASH_ENV | When set, each bash script attempt to execuet a startup file defined by this variable.

There are so many presest environmet variables which i will not include here.

### Setting the PATH Environment Variable

When you enter an enternal command in the shell command line interface (cli), the shell must search the system to find the program. The PATH envrionment variable define the directoriest it searches looking for a commands and programs.

      [dwm@edwin ~]$ echo $PATH
      /home/dwm/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/android-sdk/platform-      tools:/opt/android-sdk/tools:/opt/android-sdk/tools/bin:/usr/lib/jvm/default/bin:/usr/bin/si      te_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/dwm/.local/bin/cron:/home/

If a command's or program location is not included in the `PATH` variable, The shell cannot find it without an absolute directory reference. If the shell cannot find the command or program, it produces an error message.

      [dwm@edwin ~]$ myprog
      zsh: command not found: myprog
The proble is that often application place their executable program in directories that aren't in the PATH environment variable. The trick is ensuring that your PATH enviroment variable includes all the directories where your application reside.

You can add new search directories to the existing  `PATH` envrionment variable without having to rebuild it from scratch. The individual directories listed in the PATH are separate by `colons`


       echo $PATH
      /home/dwm/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/android-sdk/platform:
      /home/dwm/script
      [dwm@edwin ~]$ PATH=$PATH:/home/dwm/script
      [dwm@edwin ~]$ echo $PATH
      /home/dwm/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/android-sdk/platform:
      /home/dwm/script

By adding the directory to the $PATH environment varaile, you can now execute you proram form anywere in the virtual directory structure.

### Locating System Enviroonment Variables

The linux system uses envrionment variale for many purposes. You know now how to modify system environment variable and create your own variables.The trick is how to make these environment varialbe persistent.

    * As a defaut login shell at login time
    * As an interactive shell that is started by spawning a subshell.
    * As a non-interactive shell to run a script

##### Understanding the login shell process

When you log in to the Linux system, the bash shell start a login shell. The login shell typically looks for five different files to process commands from:

    * /etc/profile
    * $HOME/.bash_profile
    * $HOME/.bashrc
    * $HOME/.bash_login
    * $HOME/.profile
The `/etc/profile` file is the main default startup file for the bash shell on the system. All Users on the system execute this startup file when they log in.

The other four startup file are specifi for each user and can be customized for an individual users requirements. Lets look closer at thes files.

### Viewing the /etc/profile file

The /etc/profile file is the main default startup file the bash shell. Whenever you log in to the linux system, bash execute the commands in the /etc/profile startup file first. Different linux distribution place different command in thi file.


    # /etc/profile

    # Set our umask
    umask 022

    # Append our default paths
    appendpath () {
	case ":$PATH:" in
	    *:"$1":*)
		;;
	    *)
		PATH="${PATH:+$PATH:}$1"
	esac
    }

    appendpath '/usr/local/sbin'
    appendpath '/usr/local/bin'
    appendpath '/usr/bin'
    unset appendpath

    export PATH

    # Load profiles from /etc/profile.d
    if test -d /etc/profile.d/; then
	    for profile in /etc/profile.d/*.sh; do
		    test -r "$profile" && . "$profile"
	    done
	    unset profile
    fi

    # Source global bash config
    if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	    . /etc/bash.bashrc
    fi

    # Termcap is outdated, old, and crusty, kill it.
    unset TERMCAP

    # Man is much better than us at figuring this out
    unset MANPATH

Each distribution /etc/profile file has different setting and commands. Not that it sets some system environment variable within itself. This provides a place for the linux system to place application-specific startup file that is executed by the shell when you log in.

      [dwm@edwin ~]$ ls /etc/profile.d
      android-sdk.csh                 android-sdk.sh  gawk.sh            jre.csh    perlbin.csh
      vte.sh
      android-sdk-platform-tools.csh  freetype2.sh    gpm.sh             jre.sh     perlbin.sh
      android-sdk-platform-tools.sh   gawk.csh        home-local-bin.sh  locale.sh  vte.csh

Notice that most application create two startup files -one for the bash (using the .sh extension) and one for the c shell (using the .csh extension).

The `lang.csh` and `lang.sh` files attempt to determinte the defaut language character set used on the system and set the `LANG` environment variable appropriately.

### Viewing the $HOME startup files

The remaining startup file are all used for the same function --to provide a user-specific startup file for defining user-specific environment varaible. Most linux distribution use only one or two of these four startup files.

        * $HOME/.bash_profile
	* $HOME/.bashrc
	* $HOME/.bash_login
	* SHOME/.profile
Notice that all four files start with a dot, making them hidden files (they don't appear in a normal ls command listing).The first file found in the following ordered list is run, and the rest are ingnored.

        * $HOME/.bash_profile
	* $HOME/.bash_login
	* SHOME/.profile
Notice that $HOME/.bashrc in not in this list. This is because it is typically run from of the other files.
Remember that `$HOME` represent a user's home directory. Also the tilde (~) is used to represent a users home directory.


      # ~/.bash_profile
      #

      [[ -f ~/.bashrc ]] && . ~/.bashrc

The .bash_profile startup file first checks to see if the startup file , `.bashrc` if present in the HOME directory. If it's there, the startup file executes the commands in it.

### Understandin the interactive shell process

If you start a bash shell withou logging into a system (if you just type bash at the CLI) prompt you started whats is challed an  `interactive shell`


The interactive shell does not act like a login shell, but it still provide a cli prompt for you to enter commands.
