---
title: "Mastering the Power of Bash"
date: 2020-01-21T05:16:56+03:00
draft: true
linktitle: "Bash Scripting"
title: "Quickstart to Installing React and React ES6 Review"
categories: ["Javascript","Frontend"]
tags: ["React"]
weight: 30
author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description
---
#### Introduction to Bash Scripting

Welcome to the what and why of bash scripting. My name is `eduuh`. Am tending to become more intrested with the bash scripting as time passes. I want to sort of become able to automate any manual proccess in my workflows.


Topics to cover in the book.

1. Bash vulnebilities
2. The bash command hierachy
3. Preparing the text editor for scripting.
4. Creating and executing scripting.
5. Debugging your scripts.

#### To get to know the system you are on
```bash
$ lsb_realease -a
$ # check the bash version
$ echo $BASH_VERSION

```

#### The command hierachy

Linux type of cammands are as follows
    
    Aliases
    Functions
    shell built in
    Keywords
    Files

The list above represent the order in which they are searched in the linux system.

```bash
$ # using type of to determine the type of command
$ type ls
ls is aliased to `ls --color=auto'
```
```bash
$ # using the -a option 
$ type -a ls
ls is aliased to `ls --color=auto'
ls is /usr/bin/ls
ls is /bin/ls
```
If we just need to determine the type of the command we use the `-t` option. This is useful when we want
to know the type of command in our system.

```bash

    $ type -t ls
    alias
```
`Type` command can also be used to identify the bash keywords and it could receive multiple arguements.

```bash
    $type ls pwd cd function if do
    ls is aliased to `ls --color=auto'
    pwd is a shell builtin
    cd is a shell builtin
    function is a shell keyword
    if is a shell keyword
    do is a shell keyword
```
#### Command PATH
Linux shell will check for executable in the loctions in the `enviroment variable` when the full of the
relative path of the command is supplied.It is possible to include our current directory to the path varible using the export command. 

```bash
export PATH=$PATH:.
```
This will append the value of the current directory in the path variable separated by a `comma ,`
You could create a folder in your home directory and add it to your path. using the export command.

```bash
 $ mkdir $HOME/bin
 $ export $PATH=$PATH:$HOME/bin
```
#### Preparing the Text Editor for Scripting
##### Configuring vim for this!! 

You could use the graphical text editor for this if you prefer. Setting up common options makes our life easier in the editor and it will improve our everyday productivity and the consistency we need.

# Creating and Executing scripts
With your editor primed and ready, we can now move quickly to creating and executing our scripts. If you are reading. Thank you, the book i was reading started with the basics.

## creating a basic script.
I created the script in my current directory and named it **hello.sh**

```bash
#! /bin/bash
echo "Heloo Edwin"
exit 0
```
#### Make the script executable
```bash
chmod +x hello.sh
```
### Checking the exit status
The script is simple but we still have to know how to make use of the exit codes from the scripts and other programs. The command-line list that we generate earlier while creating the **$HOME/bin** directory.

```bash
command1 || command 2
```
**Command 2** will run is **Command 1** exits with the status code other than 0.

Similarly , in the following extract:
```bash
command 1 && command 2

```
We will only execute command2 if command1 succeeds and issues an exit code of 0.

To read the exit code from our script explicitly, we can view the $?variable, as shown in the following example.

```bash
./hello.sh
echo $?
```
The expected output of the **echo $?** command is 0, as this is what we have added to the last line of the file and there is percious little else that can go wrong causing us to fail in reaching that line.

#### Running the script with arguments.
We can run the script with arguments, after all it's free world and linux promotes your freedom to do what you want to do with the code. However, if the script does not make use of arguments then they will be silently ignored.

```bash
./hello.sh muraya
hello edwin
```
The script will still **run and will not produce an error**. The output will not change either and will print hello world.

Argument Identifier            | Description  
 $0         | The name of the script itself and is often used in the usage statements
 $1	| Positional argument, the first argument passed to the script
 ${10} | Where two or more digits are needed to represent the argument position. Brace brackets are used to delimit the variable name from any other content. Single value digits are expected.
 $#	| Argument count is especially useful when we need to set the amount of arguments needed for correct script execution.
 $\*    | Refers to all arguments 


Let create a copy of the above script and start adding some arguments.Using double quotes concatenate the input arguement with the variable defined `$1`.

The idea of quotes in script is to protect special characters such as a space between the two words; both quotes protect the space from being interpreted.The space is normally readas a default field, separated by the shell. In other words, all characters are read by the shell as literals with no special meaning. 

The double quotes will protect the characters except the $, allowing bash to expand the stored value. If we ever need to use a literal $ within the quoted string along with variable that need to be expanded; we can use double quotes but escapet the desired $ with the backslash.

#### Printing the script name.
The `$0` variable represents the script name and is often used in usage statements. As we are not yet looking at conditional statements, we will have the script name printed above the displayed name.

#### Debugging Your scripts
With the script as simple as we have seen so far, there is little that can go wrong or debug. As the script grows and decision paths are included with conditional statements, we may need to use some level of debugging to analyze the scriptsprogress better.

Bash provides two options for us, -v and -x.

If we want to look at the verbase ouput from ther script and the detailed inforamation about the way the script is evaluated line by line, we can use the -v option. this can be within the shebang but if often easier to run the script directly with bash.

```bash
bash -v hello.sh
```

The basice use of echo that we have seen so far is **to produce a text output and a newline**. This is often the desired response so we don't have to be concerned that the new prompt will append to the end ot the echoed text. 


#### Comments
We use the **#** symbols to write comments on the scripts.

```bash
#! /bin/bash
# Welcome script for edwin
# Author: @edwin muraya
# Date: 1,1,2020
```
It is a good practise to comment and add comments that explain what the code is doing and why. This will help you and your colleagues, who nee to edit the scripts at a later date.

#### Enhancing scripts with read prompts.

We have see how we can use built in read to populate a variable. So far, we have used echo to produce the prompt but this can be passed to read itself using the -p option. 

The read command will surpass the additional linefeed, so we reduce both the line count and the complexity to some degree.

We can test this at the command line itself. Try typing the followint command to se **read** in action.

```bash
read -p "Enter your name:" name
```

#### Controlling the visility of entered text
Even though we have limited the input to a single character, we do get to see the text on the screen. In the same way, if we type the name we get to see the entered text before we hit the **Enter** . It is just untidy but if we were entering sensitive data, such as a pin or a password. we should hide the text. 

We can use the silent option or -s to achieve this. now, when we use a key to continue, it will not be displayed on the screen. we can see the behavior of the script in the following.
















































































