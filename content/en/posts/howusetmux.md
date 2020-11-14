---
title: 'How Am Using Tmux'
date: 2020-04-19T07:41:06-07:00
draft: true
description: 'How I Use tmux for Local Development'

categories: ['config']
tags: ['cli']

weight: 3
image: images/fzf.png
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

In this post, I want to share how to manage tmux plugins with **Tmux plugin manager**(tpm)
and also mention a few useful plugins.

### Install the plugin manager.

Like Vim, to add new tmux plugin, we can either manually install themes or employ a plugin manager. **Tpm** is designed for this purpose, which helps to manage your plugins automatically.

### Install tpm.

First we need to install tmp itself.

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Add the following to your tmux configuration file **.tmux.conf**

```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

```

Reload **TMUX** environment so TPM is sourced.

```
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
```

That's it.

### Plugin Management with tpm.

The following operations assumes that you are in a tmux session.

### plugin install

1. Add new plugins to **~/.tmux.conf** with **set -g @plugin "..."**
2. Press **<prefix> + I** (capital) to fetch the plugin.

### plugin update.

Press **<prefix>+ U** to update existing plugins.

### Plugin uninstall.

1. Delete or comment out the plugin in **.tmux.conf**
2. Press **<Prefix>+ alt + u** to remove the plugin.

### Automatic install of tpm on new machines.

You can add the following setting to your **.tmux.conf**.

```
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
```

### Plugin Install

#### Themes

Themes are great. Here are a few themes you can try.

#### Tmux theme pack

Tmux theme pack is a collection of themes.

Install it with tpm (add the following setting to .tmux.conf):

```
set -g @plugin 'jimeh/tmux-themepack'
```

Pick a theme:

```
set -g @themepack 'powerline/block/cyan'
```

#### tmux-colors-solarized

tmux-colors-solarized is a solarized color theme for tmux.

Install it with tpm:

```
set -g @plugin 'seebi/tmux-colors-solarized'
```

Four themes are provided: **256, dark, light and base16**. You can choose one via .tmux.conf option:

```
set -g @colors-solarized '256'
# set -g @colors-solarized 'dark'
# set -g @colors-solarized 'light'
# set -g @colors-solarized 'base16'
```

### Whats Happen When you Reboot?

Let me introduce you to my very favorite tmux plugins, **tmux-resurrect** and **tmux-continuum**

### Tmux resurrect

Restore **tmux** environment after system restart.

Tmux is great, except when you have to restart the computer. You lose all the running programs, working directories, pane layouts. There are helpful management tools out there, but they require initial confiquration and continuous updates as your workflow evolves or you start new project.

**tmux-resurrect** saves all the little details from your tmux environment so it can be completely restored after a system restart (or when you fell like it.) No configuration is required. You should feel like you never quit tmux.

It even (optinally) restores **vim and neovim sessions**

### Key bindings

1. **prefix + ctrl-s** - save
2. **prefix + ctrl-r - restore.**

```

```

```

```

```

```

```

```

```

```
