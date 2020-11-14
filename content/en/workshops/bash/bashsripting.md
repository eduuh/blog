---
title: "Bashscripting"
date: 2020-05-26T16:02:40+03:00
draft: false
linktitle: "The Advanced Linux Workshop"
title: "Bash Scripting"
description: "Learning bash programing from basic to advanced concepts"

hideToc: true
enableToc: true

categories:
  - cli
series: ['bash']


image : images/gnu-bash.png
author: eduuh # author name
authorEmoji:  🤖 
authorImage: "/images/edd.jpg" # image path in the static folder
authorDesc: Selftaught Web and Mobile Developer # author description
---

### Basic Scripting

Now that we've covered the [basics of linux system and the command line]().IF not check it out.

It's time to start coding.

#### Using Multiple commands.

The **key to shell scripts is the ability to enter multiple commands and process the results from each command** even possibly passing the result of one command to another.

If you want to run two `commands together`,you can enter them on the same prompt line, separated with a semicolon.

{{<boxmd>}}
**\$ date ; who**
Tue 26 May 2020 12:49:21 AM UTC
edd tty1 2020-05-25 11:45
edd pts/4 2020-05-26 00:49 (tmux(103818).%0)
{{</boxmd>}}

This is a simple script uses just two bash shell commands.

The **date** command runs first, displaying the current date and time, followed by the output of the **who** command showing who is currently logged on to the system.

Using this techniques is fine for small scripts, but it has a major drawback. You must enter the entire command at the command prompt every time you want to run it.

To solve this is that you can combine the command into a simple text file, and when you need the commands you simply run the text file.

#### Creating a Script File.

To place shell commands in a text file, first you need to use a text editor to create a file and then enter the commands into the file.

You must specify the shell you are using in the fist line of the file.

#### Creating a Script File.

To place shell commands in a text file, first you need to use a text editor to create a file and then enter the commands into the file.

When creating a shell script file, you must sepcify the shell you are using in the first line of the file. Here's the format for this:

**#!/bin/bash**

The **pound sign (#)** is used as a comment line. A comment line in a shell script isn't processed by the shell. The first line of shell script is a special case, and the pound sign followed by the exclamation point tells the shell what shell to run the script under.

**(yes , you can be using a bash shell and run your script using another shell.)**

Commands are entered onto each line of the file followed by a carriage return.

1. Create a file and input the following. i.e

{{< highlight bash.sh >}}
#!/bin/bash
#This script displays the date and who's logged on
date
who
{{< /highlight >}}

2. To execute a command you need to first change the permission of the file and use the relative path or absolute path or you could add the script to path variable.

If you recall the shell uses an `environment variable called $PATH to find commands. A quick look at the PATH environment variable.`

You can use the `semicolon and put both commands on the same line if you want to`, but in a **shell script**, you `list commands on separate lines`. The shell processes commands in the order in which they appear in the file.

The **PATH** environment variable is set to look for commands only in a handful of directories. To get shell to find `bash.sh` script, we need do do two things:

- Add the directory where our shell script file is located to the path environment varible.
- Use an absolute or relative file path to reference our shell script file in the prompt.

For thi example, we use the second method to tell the shell exactly where the script file is located.

The next problem you will encounder is permission problem. The shell indicates that **you don't have the permissions to execute the file**

When the new bash.sh file was created, the **umask** value determined the default permission for the new file. Because the umask variable is set to **002**.

The next step is t give the file owner permissions to execute the files , using the **chmod** command.

{{<boxmd>}}
**\$ chmod u+x bash.sh**
**\$ ./bash.sh**
Thu 28 May 2020 07:35:07 PM UTC
edd tty1 2020-05-28 16:08
edd pts/2 2020-05-28 18:34 (tmux(30083).%1)
{{</boxmd>}}

Success! Now all the piece are in the right place to execute the new shell script file.

### Displaying Messages.

Most shell commands produce their own output, which is displayed on the console monitor where the script is running.

#### echo Command

Other time you will want to add your own text messages to help the script user know what is happening withing the script. You can do this withe **echo command**. The echo command can display a simple text string if you add the string following the command.

{{<boxmd>}}
**\$ echo This is a test**
This is a test
{{</boxmd>}}

Notice that by default you don't need to quotes to delineate the string you're displaying.

{{<boxmd>}}
**\$ echo Let's see if this'll work.**
Let's see if this'll work.
{{</boxmd>}}

The **echo** command uses either `double or single quotes` to delineate text strings. If you use them within your string, you need to use one type of quote within the text and the other type to delineate the string.

{{<boxmd>}}
$ echo "This is a test to see if you're paying attension"
  This is a test to see if you're paying attension
$ echo 'Rich says "scripting is easy"'
Rich says "scripting is easy"
{{</boxmd>}}

You can add **echo** statements anywhere in your shell scripts where you need to display additional information.

```bash
$ cat cd/mycodes/bash/bash.sh
#!/bin/bash
# This scipt distplays the date and who's logged on
  echo "The time and date are:"
  date
  echo "Let's see who's logged into the system:"
  who
$ cat cd/mycodes/bash/bash.sh
$ cat cd/mycodes/bash/bash.sh
```

**when you run the script, it produces the following output:**

```bash
$ ./bash.sh
  The time and date are:
  Thu 28 May 2020 07:52:32 PM UTC
  Let's see who's logged into the system:
  edd      tty1         2020-05-28 16:08
  edd      pts/2        2020-05-28 18:34 (tmux(30083).%1)
  edd      pts/3        2020-05-28 17:32 (tmux(30083).%0)
  edd      pts/8        2020-05-28 19:25 (tmux(30083).%3)
```

If you want to **echo** a text string on the same line as a command output? You can use the `-n` parameter for the **echo** statement to do that.

{{<boxmd>}}
The time and date are:Thu 28 May 2020 07:57:12 PM UTC
{{</boxmd>}}

Perfect! The **echo** command is a crucial piece of shell scripts that interact with users. You'll find yourself using it in many situations, especially when you want to display the values of script variables.

## Using variables.

Just running individual commands from the shell script is useful, but this has its limitations. Often you'll want to incorporate other data in your shell commands to process informations.

You can do this by using **variables**. Variables allows to temporarily store information within the shell script for use with other commands in the script.

### Environment variables.

You can access these values from your shell scripts as well. The shell maintains environment variables that track specific system information, such as the name of the system, the name of the user logged in to the system.

You can use set command to view a complete list of active environment variables.

{{<boxmd>}}
**\$ set**
[...]
xauthority=/home/edd/.xauthority
XDG_CACHE_HOME=/home/edd/.cache
XDG_CONFIG_HOME=/home/edd/.config
XDG_DATA_HOME=/home/edd/.local/share
XDG_RUNTIME_DIR=/run/user/1000
XDG_SEAT=seat0
[...]

{{</boxmd>}}

You can tap into these environment variable form within your scripts by using the environment variable's name preceded by a dollar sign.

{{<boxmd>}}
**\$ cat test.sh**
#!/bin/bash

# display user information from the sytem

echo "User infor for userid: $USER"
echo UID: $UID

**\$./test.sh**
User infor for userid: edd
UID: 1000
HOME: /home/edd
{{</boxmd>}}

Notice that the environment variables in the echo **command** are replaced by their current values when the script runs. Also notice that we were able to place the \$USER system variable within the double quotation marks in the first string, and the shell script still figured out what we meant.

{{<boxmd>}}
**$  echo "The cost of the item is $15"**
The cost of the item is
{{</boxmd>}}

This is not what was intended. Whenever the script see a dollar sign within quotes, it assumes you're referencing a variable. To display an actual dollar sigh, you must precede it with a **backslash character**.

{{<boxmd>}}
**$ echo "The cost of the item is \$15"**
The cost of the item is \$15
{{</boxmd>}}

That's better. The backslash allowed the shell script to intepret the dollar sigh as an actual dollar sign and not a variable.

### User variables.

A shell script allows you to set and use your own variable within the script. Setting variable allows you to temporarily store data and use it throughout the script making the shell script more like a real computer program.

User variables can be any text string of up to 20 letters, digits or an underscore character. User variables are case sensitive. The little rule often gets novice script programmers in trouble.

Values are assigned to user variables using an equal sign. No space can appear between the variable, the equal sign, and the value (another trouble spot for novices). Herea are a few example of assigning values to user variables.

{{<boxmd>}}
var1=10
var2=-31
var3=testing
var4="still more testing"
{{</boxmd>}}

The shell script automaticall determines the data types used for the variables values. Variables defined within the shell script maintain their values throughout the life to the shell script but are deleted when the shell script completes.

Just like system variables , user varibles can be referenced using the dollar sign.

```bash
$ cat  bash.sh
#!/bin/bash
# testing variables
days=10
guest="katie"
echo "$guest checked in $days days ago"
days=4
guest="Edwin"
echo "$guest checked in $days days ago"
```

{{<boxmd>}}
**\$ ./bash.sh**
katie checked in 10 days ago
Edwin checked in 4 days ago
{{</boxmd>}}

Each time the variable is referenced , it produces the value currently assigned to it.

It's important to rember that when referencing a variable value you use the **dollar sign**.

```bash
$ cd/mycodes/bash/bash.sh
  The resulting value is 10
$ cat !!
  cat cd/mycodes/bash/bash.sh

#!/bin/bash
# assigning a variable value to another variable.
value1=10
value2=$value1
echo The resulting value is $value2
```

If you forget the dollar sign and make the **value2** assignment line look like this

**value2=value1**

you get the following output:

{{<boxmd>}}
**\$ ./bash.sh**
The resulting value is value1
{{</boxmd>}}

Without the dollar sign, the shell interprets the variable name as a normal text string which is mostly likely not what you wanted.

### Command Substitution

One of the most useful feature of shell scripts is the ability to extract information from the output of a command and assign it to a variable.

This comes in handy when processing data in your scripts.

There are two ways to assign the output of a command to a variable:

- The backtick character (
- The \$() format.

Back tick character is not the normal single quotation mark character you are used to using for strings. Because it is not used very often outside of shell scripts.

Command substitution allows you to assign the output of a shell command to a variable . It is a major building block in script programming.

Examples.

1. Using the Back tick

today =`date`

2. Using the \$() format.

{{<boxmd>}}
**today=\$(date)**
**\$ ./bash.sh**
The date and time are Thu 28 May 2020 09:10:45 PM UTC
**\$ cat !!**
cat ./bash.sh
#!/bin/bash
testing=$(date)
echo "the date and time are " $testing
{{</boxmd>}}

Here's a popular example of how command substitution is used to capture the current date and use it to create a unique filename in a script.

```bash
#!/bin/bash
# copy the /usr/bin directory listing to a log file
today=$(date +%y%m%d)
ls /usr/bin  -al >log.$today

$ cd/mycodes/bash/bash.sh
The date and time are  Thu 28 May 2020 09:10:45 PM UTC
$ cat !!
cat cd/mycodes/bash/bash.sh
#!/bin/bash
testing=$(date)
echo "The date and time are " $testing
$ cfb
$ cd/mycodes/bash/bash.sh
$ ls | grep log*
log.200528
```

The **today** variable is assigned the output of a formatted date command. This command technique used to extract date information for log filenames.

The output of command **date +%y%m%d**
200528

### Redirecting Input and Outputs.

Sometimes, you want to save the output from a command instead of just having it displayed on the monitor. The bash shell provides a few different operator that allow you to redirect the output of a command to an alternative location (such as a file). Redirection can be used fo rinput as well as outups, redirecting a file to a command for input.

#### Output redirection.

The most basic type of redirection is sending output from a command to a file. The bash shell uses the greater-that symbol (>) for this.

{{<boxmd>}}
**command > outputfile**
{{</boxmd>}}

Anyting that would appear on the montor from the command istead is store in the output file specified.

Instead of overwritting the file's contents you may need to append outputs from a command to an existing file. If you'r creating a log file to document an action on the system. In this situation, you can use the double greater-than symbol (>>) to append data;

## Input Redirection

Input redirection is the opposite of output redirection. Instead of taking the outups of a command and redirecting it to a file, input redirection takes the contend of a file and redirects it to a command.

The input redirection symbol is the less-than symbols (<):

{{<boxmd>}}
**command < inputfile**
{{</boxmd>}}

The easy way to remmber this is that the command is always listed first in the command line, and the redirectino symbols "points" to the way the data is flowing. The less-than symbol indicates that the data is flowing from the input to the command.

Here's an example of using input redirection with the **wc** command.

```bash
$ wc < test1
 1  7 32
```

The **wc** command provides a count of text in the data. By default , it produces three values.

1. The number of lines in the text.
2. The number of words in the text.
3. The number of bytes in the text.

By redirecting a text file to the **wc** command, you can get a quick count of the lines, words and bytes in the file.

Another method if **input redirection is called \*inline input redirection**. This method allow you to specify the data for input redirection on the command line instead of in a file. This may seam somewhat odd at first, but a few application are available for this process .

The inline input redireciton symbol is the **double less-than symbol**. Besides this symbols, you must specify a text marker that delineates the beginning and end of the data used for input.

```bash
$ wc << EOF
  heredoc> test string 1
  heredoc> test string 2
  heredoc> test stirng 3
  heredoc> EOF
   3  9 42
```

When using linux input redirection on the command line, the shell prompt for data using the secodary prompt, defined in the _PS@_ environment variable . Here's how this looks when you use it.

The secondary prompt containues to prompt for more data until you enter the string value for the text marker.
The wc command performs the line, word, and byte counts of the data supplied by the inline input redirection.

### Pipes

Sometimes , you need to send the outputs of one command to the input of another command. This is possible using redirection, but somwhat clunky.

command1 | command2

Don't think of piping as running two commands back to back. The linux system actually runs both command at the same time, linking them together internally in the system. At the first command produces outputs, it's sent immediately to the second command.

      $ ls -la | sort

The piping feature operates in real time, as soon as the **ls** command output is generated, the **sort** commad gets busy sortig it. By the tim the ls command finished the sort command finishes data sort and start displaying it on the monitor.

Ther's no limit to the number of pipers you can use in a command. You can continue piping the output of commands to other commands to refine your operation.

To get even fancier, you can use redirection along with piping to save your output to a file.

#### Performing Math.

Another feature crucial to any programing language is the ability to manipulate numbers. Unfortunately, for shell scripting this process is a bit awkward.

##### The expr command.

The bourne shell provides a special command that was used for processingi mathematical equations. The **expr** command allowed the processing of equation from the command line, but it is extremely clunky.

{{<boxmd>}}
**\$ expr 1 + 5**
6
**\$ expr 5 \* 3**
expr: syntax error: unexpected argument ‘test1’
{{</boxmd>}}

To solve this problem , you need to use the shell escape character (the backslash) to identify any character that my be misinterpreted by the shell before being passed to the **expr** command.

{{<boxmd>}}
**\$ expr 5 \* 3**
15
{{</boxmd>}}

Now that's really starting to get ugly! Usng the expr command in a shell scripting is equally cumbersome:

### Using Brackets.

The bash shell includse the **expr** command to stay compatible withe the **Bourne shell;how-ever, it also provides a much easier way to performng mathematical equations**

Whe assinging a mathematical value to a variable, you can enclode the mathematical equation using a dollar sign and square brackets (\$ [operator]).

{{<boxmd>}}
num1=100
num2=50
num3=45
result=$[$num1 \* ($num2 - $num3)]
echo the final result is \$result
{{</boxmd>}}

Notice that when using the square brackets method for calculation equatons, you don't need to worry about the multiplicaition symbol, or any other character, being misinterpreted by thes shell

There's ane major limitation to perfoming math in the bash shell script. Look at this exaple:

#### A floating-Point solution

#### The basics of bc.

The bash calculator is actually a programming language that allows you to enter floaging-point expressions at a command lne and then interprets the expressions, calculates them and returns the result. The bash calculator recognizes these:

1. **Numbers** (both interger and floating points)
2. **Variables** (bothe simple variable and arrays)
3. **comment** (lines startng with a pound sign or the C language pair)
4. **Expressions**
5. \*\*Programing statement (sunch as if-the statements)
6. Functions.\*\*

You can access the bash calculator from the shell prompt using the bc command:

{{<boxmd>}}
**\$ bc**
bc 1.07.1
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type warranty.
12\*5.4
64.8
{{</boxmd>}}

The bash calculator return the answe. Each subsequent expression entered into the calculato is evaluate, and the result is displayed. To exit the bash calculato, you must enter quit.

The floating point arithmetic is controlled by a build-in varalble called **scale**. You must set this value to the desired number of decimal places you want in your answers, or you won't get what you wer looking for.

{{<boxmd>}}
**\$ bc -q**
0
scale = 4
2.44 / 5
.4880
quit
{{</boxmd>}}

#### Using bc in scripts

Now you may be wondering how the bash calculator is going to help you with floating point arithmetic in your shell script . Do you remember command substitution.

{{<boxmd>}}
#!/bin/bash
var1=$(echo "scale=4; 3.44 / 5 " | bc)
echo The answer is $var1
**\$ ./bash**
The answer is .6880
{{</boxmd>}}

#### Using brackets.

The bash shell includes the **expr** command to stay compatible with the boune shell; how-ever, it also providse a much easier way to performing mathematical equations. You can enclose the mathematical equation using a dollar sigh and square brackets (\$ []).

{{<boxmd>}}
#!/bin/bash

# performing maths

var1=20
var2=30
echo The result is $[ $var1 \* \$var2]
{{</boxmd>}}

The major limitation of bash computation is that it only support interger calculations.

{{<boxmd>}}
#!/bin/bash

# performing maths

var1=100
var2=45
var3=$[$var1 / $var2]
echo The final result in $var3
{{</boxmd>}}

The above script with **print 2**.

### A floating-point solution.

You can use several solution for overcoming the bash integer limatation. The most popular solution uses the built-in bash calculator, called **bc**.

#### The basics of bc.

The bash calculator is actually a programming language that allows you to enter floating point expression at a command line and then interprets the expressions, calculates them and returns the result. the bash calcualtor recognizes these.

{{<boxmd>}}

1. Numbers (both integer and floating points)
2. Variables (both simple variables and arrays.)
3. Comments (lines starting with a pond sigh or the C language /\*\*/ pair)
4. Expressions.
5. Programming statements (such as if-then statements.)
6. Functions
   {{</boxmd>}}

You can acess the bash calcualato form the shell prompt using the bc command.
