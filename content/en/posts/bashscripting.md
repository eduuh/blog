---
title: "Bashscripting"
date: 2020-04-11T16:02:40+03:00
draft: true
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

Besides having a kernel to control hardware devices, a computer operating sytem needs utilities to perform standart functions , such as controlling files and programs. While linux creadet the linux system kernel, he had no system utilities to run on it. Fortunately for him, at the same time he woas working, a group of people were working together on the Internet trying to develop a standard set of computer system utilities that mimicked the popular Unix operating system.

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








