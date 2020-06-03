
---
title: "FZF installations and Usages"
date: 2020-03-19T07:41:06-07:00
draft: false
description: " Fzf is an interactive fuzzy file search tool on the command-line. It is fast and powerful. In this post , I will introduce its installation and usage."

categories: ["Fuzzyfinder"]
tags: ["productivity","comandline"]
weight: 30

image : images/fzf.png

author: eduuh # author name
authorEmoji:  🤖# emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description

---

### Installations.
#### Two step install.

We can use git to install fzf:

        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
The above command will install fzf under `~/.fzf/bin`.
If you want to enable fzf inside Neovim, add the following setting to Neovim configuration (suppose your plugins manager is **vim-plug**).

    Plug '~/.fzf'

#### One step install

We  can install fzf and enable it inside **Neovim** in one step. Use the following configuration for Neovim:

We can install Fzf and enable it inside Neovim in one step. Use the following configurations for neovim:

      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

You can change the directory where you want to install fzf.

### How to use

#### As Nvim plugin

Inside Nvim, we can search and open files quickly using the command provided by fzf.

:FZF " find file under current directory
:FZF ~ " find file under HOME directory

For convenience, we can add shortcut mappings for the above commands.

      nnoremap <silent> <leader>f :FZF<cr>
      nnoremap <silent> <leader>F :FZF ~<cr>

You can use **ctrl + N** and **ctrl + P** or the arrow key to navigate through the list of files found by fzf. To open the file in Neovim, Fzf provides several shortcut key.

**<Enter>:** open file in current window
**Ctrl + T:** open file in new tab page
**Ctrl + X**: open file in new horizontal window
**Ctrl + V:** open file in new vertical window

To close the file search window, use *Esc* or *Ctrl + c*.

### Use fzf with other command.

You can also use fzf in conjuction witho other command. Fox exmple, you can use **fzf** and nvim together. Fzf is used to find and the oepn the file in nvim;

     nvim $(fzf)

The command is useful in using in bash prompt. To find files wth fzf and open them with nvim. Placed the line in my aliaserc file.

    alias fs="nvim $(fzf)"

### Use fzf alone.

Fzf provides several command-line shortcut after installation.

* Ctrl + T: paste the path of file or directory found on the command line
* Ctrl + R: find history command and paste command on the command line
* Alt + C: cd to specific directory

Note that **ctrl + T** n **Alt + c** will only find file or folder under current directory. If you can not find a file, please make sure that it exists under current directory.

By default, fzf use **find** to search files. You can use the variable `FZF_DEFAULT_COMMAND` to change the default search command. For example, f you have installed the **silver searcher, AKA, ag** you may want to use the following setting in your **.bash_profile**

      export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
## Autocompletion on command Line

When you are using *vim* and *cd* you can activate file and directory fuzzy completion with ** as a trigger (press tab to trigger autocompletion.).

    vim **<TAB>
    vim **<TAB>

The auto-completion function only supports a few commands. If you want to add your own command, say **pylint**, it is easy to set up. Following the [guide here](https://github.com/junegunn/fzf/issues/536) you need to add the below command to your .bash_profile.

Do not forget to soure your **.bash_profile**. Then you can trigger auto-complet for pylint just like what you do with **vim** and **cd**.

Autocompletion for environment variable.

fzf can also auto-complete environment variable.

    export **<TAB>
    unalias **<TAB>
    unset **<TAB>

## search hidden file by default.

By default, fzf does not search hidden files. In order to search hidden files by default, use the following setting (suppose that you use ag):

      export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'





