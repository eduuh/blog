---
title: "Tmux Workshop"

description: "Tmux is a terminal multiplexer, which means it will allow you to easily swith betwween several programs in one terminal, and it especially handy when dealing with complex project that require multiple terminal"

date: 2020-06-26T20:51:14Z
draft: false
hideToc: true
enableToc: true
author: eduuh
authorEmoji: 😎
authorImage: "/images/edd.jpg" # image path in the static folder

tags: ["cli"]

image: /images/tmux/tmuxlogo.png
---

### Intro.

It's **tmux** a so-called terminal multiplexer. Simply speaking , tmux acts as a **window manager** within your terminal and allows you to create multiple windows and panes within a single terminal window.

The great thing about tmux is it allows you to have multiple panes open at the same time, each with their own shell running, but using the same single ssh connection. Not only that , you can also have multiple "windows" open at the same time.

A huge benefit of using tmux on a remote server is that if your internet connection should die for any reason, that tmux session keeps on the session live on the server. This means your long-running job that you just kicked off and forgot. All you need to do is **tmux attach** once your internet is back and you've ssh'd into the server again, you'll have all the same panes and windows there waiting for you.

### Why Use tmux Locally?

To instantly get my command line "workspace" set up as soon as I fire up my terminal emulator.

![](/images/tmux/tmux.png)
**Your mouse is slowing you down.**

As we build softwares, we work with multiple programs throughout the course of our day. A web developer, for example, mght have a **database console** , **a web server** and **a text editor** running at the same time. Switching between these windows with the mouse can slow you down.

Using tmux, you can create an environment like this right in your terminal managed entirely without a mouse.

#### What's to learn in the post.

{{<boxmd>}}

1. **Learning the Basics**
2. **Configuring tmux**
3. **Scripting Customized tmux Environments.**
4. **Working with Text and Buffers.**
5. **Pair programming with tmux.**
6. **Workflows with tmux**

{{</boxmd>}}

#### Why you should Read this post.

Whether you're are a system administrator or a software developer who spends a good part of your time using the **terminal** and **command line tools** and you aim to help you work faster.

If you're a **software developer**, you'll see how to use tmux to build a development environment that cam make workng with multiple terminal sessions a breeze. And if you're comfortable using **VIM** or **Emacs**, you'll see how tmux can accelarate your workflow even more

If you're a system administrator or a developer who spends some time working with remote servers, you'll be interested in how you can levarage tmux to create a persitent dashboards and sessions for managing or monitoring servers.

#### Requirements

Tmux 2.1 and 2.2 introduced several backwords-incompatible changes than introduced some new options. And tmux is now more popular that it was before bringing a few options to improve your worklow.

- All example require **tmux 2.3 +**
- Tmux is supported under **Microsoft's Windows subsystem for Linux.**
- A computer that runs Mac OS X , Windows 10 with Bash support, or a flavor of Unix or Linux.
- You should also have a good grasp of using command-line tools on a linux or unix system
- While not required , experience with text editors such as **Vim** and **Emacs** might be helpful.
  - Tmux works much the same way, and it has some predefined keyboard shortcuts that you may find familiar of you use one of these text editors.

{{<boxmd>}}
**Unfortunately tmux does not run under the reqular windows command prompt or Powershell, but it will run great on a WSL , virtual machine, VPS, or Shared hosting envionment running Linux or FreeBsd.**
{{</boxmd>}}

<h4 align="center"> Why Use tmux?</h4>

> #### Background Operations on Servers

As we saw above, you can detach a tmux <span style="color:#FF6188">session</span> from a client (the terminal) and you can attach it back. It means that you can run whatever you want in the background, even if you have no terminal open.

Let's imagine that you need to run a very long script on your remote server. Some step you might follow:

{{<boxmd>}}

1. **Connect to your remote server via SSH.**
2. **Launch tmux on the remote server.**
3. **Run a Script which takes hours.**
4. **Close the SSH connection. The script will still run on the remote server, thanks to **tmux sessions!**.**
5. **Switch off your own computer and go home.**
6. **Later ssh back to your remote server and attach to tmux sesion.**
   {{</boxmd>}}

> #### More Termimals! Everywhere!

Tmux allows you to create multiple terminal on a single screen. This is the functionality I use most.You might think: "Well, great, many terminal emulator can do the same, like terminator." That's true, but tmux is more powerful and consume less resources. You can configure it easily and precisely, according to your specific needs.

It works very well with vim too, which makes it mandatory if you want to create a **Keyboard Centric** development environment.

> #### Protection Against Terminal Crashes.

Since your tmux session is independent of your terminal, you don't need to worry anymore if you close it or even if it crashes. You can always reattach your session afterword, in a new and shiny terminal!.

> #### Saving tmux sessions

It's possible to save tmux **sessions** in a file and reopen them later, even after switching off your computer.

> #### Remote Pair Programming.

A tmux session can be attached to many clients (terminals), even via SSH. Which means that you can do pair programming with another developer using **Tmux** and **command line base text editor** by sharing the same **session!**.

<h4 align="center">Let Understand Tmux</h4>

#### General Organization

Let's see in more details how to use tmux. This part should answer many potential questions you might have, at that point.

Here's an example what kind of hierarchy you can with tmux:

![](/images/tmux/tmux-working-diagram.webp)

When you launch tmux, it will create a **tmux-server**, a **session**, a **window** and a **pane**.

### Tmux Theoritical Background

#### Tmux server

The tmux server manage every single tmux **session**. If you kill it, you kill every **session** as well. You can try it by yourself with the command **tmux kill-server**.

#### Session

We spoke about **sessions** before. You can detach them from a client (and let them run in the background) and attach them back.

#### Window

In tmux, a **window** represent an entire screen. You can have multiple **windows** open in one **session**. You can access each **window** via a tab in the tmux status bar, at the bottom.

#### Pane

You can split your **windows** in **panes** to have multiple terminals on one screen. Thes panes are independent by default , but you can syncronze them too.

> #### Conventions

Tmux is a tool that is driven by the keyboard. You'll encounter many keyboard shortcuts throughut this post. Since **tmux support both lowercase and uppercase keyboard shortcuts**, it may can become be unclear which key is being referenced.

Remember that tmux is **case Sensitive.**

{{<boxmd>}}

1. **Ctrl-b** means that **press the ctrl and b keys simultaneously.**
2. **Ctrl-b d** means **press the Ctrl and b keys simulteneously, then release and the press d**
3. **\$ tmux new-session** .The dollar sigh represent the prompt from the bash shell sessions. You won't need to type it when you type the command. It just denotes that this is a command you should type.
   {{</boxmd>}}

**Configuring tmux**, you can configur tmux with a configuration file called **tmux.conf**. filenames starting with a period don't show up in directory listing on most system or text editors by default.

I will be explaning sections of my **tmux.conf** file and then I will attach the link to the **github dotfiles** page.

<h4 align="center">Learning the Basics</h4>
<hr>

> #### Getting started.

This is a hand-on guide will get you up and running with tmux pretty quickly. It will only cover the basic and some advanced feature which should be more than enough to get started and be productive with tmux, simply open your terminal and follow the along.

tmux , by default doesn't have the most friendly commands. Many of the most important and useful features are assigned to hard to reach keystrokes or consist of long, verbose command strings.

> #### Introducing the .tmux.conf file.

By default , tmux looks for configuration settings in two places. It first looks in **/etc/tmux.conf** for system-wide configuration. It then looks for a file called **.tmux.conf or ~/.config/tmux/tmux.conf** .If the files don't exist , tmux simply uses its default settings.

The first option is having the configuration in your home directory, and to create
the file you can run the command.

{{<boxmd>}}
**touch ~/.tmux.conf**
{{</boxmd>}}

{{<boxmd>}}
**Note:** .tmux.conf file is a hidden file and doesn't show up in file explorers or directory listing by default.

{{</boxmd>}}

In this file we can do everthing from:

1. **Defining new key shortcuts**
2. **Setting up a default environment with multiple windows, panes and running programs.**

> #### Installation

Fortunately!, Installing tmux is pretty straightforward on most distribution. If you use a Unix/Linux based system, you can find it via your usual packaeg manager.

{{<boxmd>}}

- Arch Linux : <span style="color:#FF6188;font-weight: bold">sudo pacman -S tmux</span>
- Ubuntu / Debian: <span style="color:#FF6188;font-weight: bold">sudo apt-get install tmux</span>
- Fedora / CentOs: <span style="color:#FF6188;font-weight: bold">sudo dnf install tmux</span>
- Mac OS: <span style="color:#FF6188;font-weight: bold">brew install tmux.</span>
  {{</boxmd>}}

> ##### Starting Your First Session.

For your first session simply start tmux with a new session.

{{<boxmd>}}
**tmux**
{{</boxmd>}}

> ##### The command Prefix.

Since our command-line programs run inside tmux, we need a way to tell tmux that the command we're typing is for tmux and not for the underlying application. The **Ctrl-b** is combination for that. This combination is called _command prefix._

For my current setup it was hard to type **CtrL-b** so i remap the prefix to **Ctrl-space** using the command below.

{{<boxmd>}}
**set -g prefix C-space**
{{</boxmd>}}

**You will need to press the prefix first each time you want to do something with tmux**. Since the prefix involves the **Ctrl** key we need to ensure this key is easily accessible.

{{<boxmd>}}

> ##### Remapping the caps lock key.

On many keyboards, the **Caps lock** key sits right next to the a key on the home row of the keyboard. By remapping this key to **Ctrl**, you can make triggering commands more comforbable.

<div align="center"><h6><a href="/posts/remaps">Checkout my CapsLock remaps here</a></h6></div>
{{</boxmd>}}

> #### Tmux Visual appearance

This will create a new tmux session with a nice all-green status bar at the bottom. Tmux provides quite a few ways to customize your environment's appearance. In this section, we'll walk throught configuraing some to these options , as we customize the status line and other components.

##### Configuring color

To get the best visual experience out of tmux , make sure that both your terminal and tmux are configured for **256 colors.** You can perform a quick check using the **tput** command.

```bash
$ tput colors
256
```

If you don't see 256 as a result, you'll need to do a little configuration. You may need to configure your terminal to use xterm's 256 mode.

Ensure that your terminal emulator supports displaying UTF-8 characters so that visual elements such as the pane divider do not appear as dashed lines.

To make tmux display things in 256 colors, add this line to our **.tmux.conf** file:

```bash
# Set the default terminal mode to 256color mode
set -g default-terminal "screen-256color"
```

Once the right color mode is set, you'll find it much easier to use programs such as Vim, Emacs, and other full-color programs from with tmux, especially when you are using more complex color schemes for syntax highlighting.

##### Changing Colors

You can change the colors of several parts of the tmux interface, including the status line, window list, message area, and even the pane borders.

tmux provides variables you can use to specify colors.

##### Changing the status Line Colors and content

The default status line has black text on a bright green background. It's pretty bland, and depending on your terminal configuration, it can be hard to read.

This configuration will give you a status line just like mine below.

```bash
set-option -g status-justify right
set-option -g status-bg black # colour213 # pink
set-option -g status-left '#[fg=magenta]» #[fg=blue,bold]#T#[default]'
set-option -g status-right '#[fg=red,bold][[#(git branch) ]] #[fg=cyan]»» #[fg=blue,bold]###S #[fg=magenta]%R %m-%d#(acpi | cut -d ',' -f 2)#[default]'
```

My current status bar looks like the following.

![](/images/tmux/tmuxbar.png)

> #### Keeping Status Line Info Up to Date

We can specify exactly how quickly tmux refreshes its status line with . By default tmux refresh interval in every 15 seconds.

```bash
# update the status line every sixty seconds
set -g status-interval 15
```

> #### Managing tmux sessions

Here are the most useful tmux commands to manage your **sessions**.

{{<boxmd>}}

- **tmux list-sessions** - List tmux sessions.
- **tmux new-session -s dev** - Create a new sessions named "hello"
- **tmux kill-session -t dev** - Kill the **session** named "hello"
- **tmux kill-server** - Kill the tmux server and, as a result, every **session**.
  {{</boxmd>}}

If you use a tool to automate the creation of your **sessions** like **tmuxp**, you will barely need to use these commands.

> #### Reloading tmux config Files

Each time you change your config file, you need to reload it in tmux to apply the changes.

Let's set a keystroke to reload the config files easily:

```bash
# Reload the file with Prefix r
bind r source-file ~/.config/tmux/tmux.conf	\; display "Conf Reloaded!"
```

Here , we have two commands combined into one, on the second line:

1. We bind the key r to reload the config file.
2. We display a message when we hit **prefix -> r.**

Let's stop tmux by typing **exit.** Then, run tmux again and, if you hit **prefix key -> r** you'll normally see the message **Reloaded ~/.tmux.conf** displayed at the bottom of your tmux **session**.

From now on, each time you want to see the effect of your configuration changes, you need to reload the config file.

#### Mouse Mode.

What? A mouse in a **keyboard centric** environment?

Well, using the mouse is sometimes practical, escpecially since you might use it in other software, like your browser.

Enabling the mouse allows you to use it for:

{{<boxmd>}}

1. Selection Panes.
2. Selection windows (via the status line)
3. Resizing panes.
4. Scrolling windows.
5. Copying text
   {{</boxmd>}}

Let's add it in the configuration:

```bash
set -g mouse on
```

You can do everything with your keyboard too, and I encourage you to do so.

> #### Splitting Panes

One of the most common operation you'll do in tmux is splitting a **window** into multiples **panes**. Lets add some useful keystrokes in our config:

```bash
# Splitting windows
bind v split-window -h -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"
```

You might think that something is reversed her, between my keystroke v (for vertical) and tmux flag -h (for horizontal).

The flag **-c** execute a shell command, and #{pane_current_path} simply bring you back where you were in the filesystem.

![](/images/tmux/tmuxpane.png)

> #### Navigating Panes

To navigate from **panes** to **pane**, you can use prefix -> arrow key by default. However, this action is so common i like to use the following.

```bash
bind -n C-h select-pane -L
bind -n C-j select-pane -D
bind -n C-k select-pane -U
bind -n C-l select-pane -R
```

The flag **-n** means that thes bindings don't use the prefix key.

Why using ctrl+hnei? it's alwayse better to keep your fingers on the **home row keys.** Using the arrow keys force you to move your hands. If you stop doing it, you'll understand how comfortable it is.

#### Window Management

We know how to split the current **pane**, but we don't know yet how to create new windows and how to navigate between them.

Let's add some more keystrokes to our config file:

```bash
unbind n  #DEFAULT KEY: Move to next window
unbind w  #DEFAULT KEY: change current window interactively

bind n command-prompt "rename-window '%%'"
bind w new-window -c "#{pane_current_path}"
bind-key , command-prompt -p 'Rename Window:' 'rename-window "%%"'
```

The keystroke **prefix key -> w** will create a new **window**, and **prefix key -> n** will allow you to rename the current **window.**

You can see some tabs in the status line, at the bottom left of your tmux **session**. Each tab represents one **window.**

When you have more than one **window**, you can then select them with **prefix key -> <number>.<number>** is the **window** number you want to display.

You can see that a little star in the **windows** tab indicate what **window** is currently displayed in your terminal. If you think that it's not really readable, no worries: we will improve the status bar later.

To stay consitent, let's do the same with the panes by adding n the config:

```bash
set -g base-index 1
set-window-option -g pane-base-index 1
```

You might think it's annoyong do do **prefix key -> <number>** since you'll navigate between **windows** often. I like to use **prefix c-h** to go to the next window, and **prefix c-j** to go to the previous one, without using the prefix key.

### Copy Mode

Let's speak briefly about tmux modes. There are two of them. We actually use the default mode of tmux. You can think of it as the equivalent of the Insert mode in Vim. It allows you to type whatever you want in the different **panes**.

{{<boxmd>}}

1. **The default mode**
2. **The copy mode**
   {{</boxmd>}}

When you are in copy mode, you have the possibility to navigate in your terminal, using Emacs or VI key bindings. Since I'm in love with Vi/Vim, let's add in the config.

Now, let try the copy Mode! Hit **prefix key -> space.** You can come back to the default mode by hitting q.

```bash
set -g mode-keys vi
```

You can see that you're in copy mode thanks to the two number on the top right corner of your **panes**. They represent the total number of line which are below the visible output (on the left) and the one which are above (on the right).

From there, you can use the vanilla vim keystrokes to navigate your current terminal output. Again, I wrote about the basic Vim keystrokes in this article.

You can use, for example:

{{<boxmd>}}

1. **ctrl-u** - Scroll up.
2. **ctrl-d** - Scroll down.
3. **/ - search**
   {{</boxmd>}}

Exactly like in Vim !.

<!--Unsuprisingly , you will use copy mode mainly to copy content. I you tried to copy terminal outputs already from tmux with your mouse, you might be confused: it doesn't reall work.-->

Indeed, tmux by default doesn't copy anything in your sytem clipboard, but it one of its paste buffer. However, for convinience, I prefer using the sytem clipboard each time I copy something.

Let's configure that now:

```bash
# KEY BINDINGS -VI COPY MODE

bind-key Space copy-mode
bind -T copy-mode-vi Space send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"
bind-key -T copy-mode-vi c-v send -X rectangle-toggle
# colemak keys
```

To stay consistent with Vim's default keybindings, we did the following.

1. Changing the keystroke to select text from **space** to **v**.
2. Changing the keystroke to copy text from **enter** to **y**.

Then, we pipe the action to **xsel**, to copy the selection to the system clipboard. If you don't have **xsel** installed or if you prefer using **xclip**, you can replace the last line in your configuration with this one:

```bash
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"`
```

**xsel** or **xclip** will work well on Linux systems. Be awaer as well that you can paste what's n the tmux **paste-buffer** by using **prefix key -> p** if you don't want to use the system clipboard.

Now copy pasting in tmux will normally work like a charm. You can as well copy using the mouse: selcet what you want and enter y without releasing the mouse button. If you release it, the selection will disappear before you had the chance to copy it.

#### Integrate Your tmux with Vim.

There are some more configuration you need in order for tmux to work seemingly with vim . If you don't use vim, you can pass this section.

First, if you use Neovim in tmux. you might experience a cursor problem. It doesn't change from rectangle to pipe when you go from Normal Mode to Insert Mode.

Adding this line in your configuration might help:

```bash
set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'
```

Another improvement you might want: navigating between tmux **panes** and vim **window** using the same keystrokes, **ctrl+hnei.**

This config will do exactly that:

```bash
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-n run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-e run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-i run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"
```

That's all!

Now you have a personalized tmux configuration you can modify to fit your precise needs. There are alot of tmux configuration available out there, if you need some inspiration.

You might think that it will take you forever to remember these keystrokes, but I believe they are overall pretty logical. Moreover, if you have written your own cheatsheet, I bet you know most of them already.

##### Enhancing tmux with plugins

Event if we have now a very powerful tool, we can improve tmux evem more by addng some useful plugins.

###### Tmux Plugin Manager

To manage our tmux plugins, we need the **tmux plugin manager**

To install it, follow these steps:

{{<boxmd>}}

1. Clone the project into your home directory: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
2. Add this line in the configuration: set -g @plugin 'tmux-plugins/tpm'
3. Add this at the end of tmux’s configuration: run -b '~/.tmux/plugins/tpm/tpm
   {{</boxmd>}}

You can add any plugins you want in your config and install them with **prefix I**, after reloading the config.

I way to automate the installation of tmux plugin manager if it does not exist in your installation
would be.

```bash
# Install the plugins for tmux right at first start
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
## Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

<!--#### A Better search with copycat.-->

<!--As we saw, tmux copy mode allow you to search in the output of the current pane. Howeevr, if you want advanced search capabilities , you can try **tmux copycat**.-->

<!--What are the cool benefilts , you might ask?-->

<!--{{<boxmd>}}-->

<!--1. You don't neet to be in copy mode to search something.-->
<!--2. You can search using regex or plain strings.-->
<!--3. You have access to keystrokes to select filepathis, git status output, urls, and IP addresses to copy them easily.-->
<!--4. Your search is automatically selected. YOu can copy it using yank (the y key we configured earlier) directly.-->

<!--{{</boxmd>}}-->

<!--Like in Vim, you an use n and N to jump to the next or previous result, repectively.-->

##### Fuzzy Search with fzf And Extrakto.

You'll need **fzf** to use this plugn. If you don't have it already, I advice you to install it. it's a powerful tool which will enhance your terminal experiencee even more!.

In order to install extrackto, add the following to your config file:

```bash
set -g @plugin 'laktak/extrakto'
```

Then, reload it and hit **prefix key -> I** to install the new plugin.

##### Automating the creating of tmux sessions.

The power of tmux doen't stop here. There are many tools out there which allow you to automate tmux **sessions** creation via YAML (or JSON) config files.

You can automate everything, from the number of windows and panes you want to , to the command lines to execute in which pane.

The two most know tools to create **sessions** from config files are **tmuxinator** and **tmuxp.**

To see all my tmux configuration. Checkout my [github tmux configuration](https://github.com/eduuh/dotfiles/blob/master/.config/tmux/tmux.conf). This is always up to date.

##### I want to work with Tmux in all my sessions

I use zsh as my default shell. Adding the following in the **.zshrc** to start tmux at terminal startup.

```bash
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t hack || tmux new -s hack; exit
  fi
fi
```

Always work in a tmux session if tmux is installed.

##### Start tmux Automatically on Boot

The script only works with **systemd**. Add this line to **tmux.conf**. This is nice because it avaid
tmux from being annoying when start in the terminal and it start restoring session. It can do that
in the background.

```bash
set -g @continuum-boot 'on'
```

Reload the tmux configuration.

You'l will find a new service file under **~/.config/systemd/user/tmux.service**

```bash
[Unit]
Description=tmux default session (detached)
Documentation=man:tmux(1)

[Service]
Type=forking
Environment=DISPLAY=:0
ExecStart=/usr/bin/tmux new-session -d

ExecStop=/home/eduuh/.tmux/plugins/tmux-resurrect/scripts/save.sh
ExecStop=/usr/bin/tmux kill-server
KillMode=none

RestartSec=2

[Install]
WantedBy=default.target
```

Copy the file to **etc/systemd/system**. You"ll need **sudo** for that.

```bash
sudo cp ~/.config/systemd/user/tmux.service /etc/systemd/system/
```

Enable the service:

```bash
√ sudo systemctl enable tmux --now
#Created symlink /etc/systemd/system/default.target.wants/tmux.service → /etc/systemd/system/tmux.service.
```
