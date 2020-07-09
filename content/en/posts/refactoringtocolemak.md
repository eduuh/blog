---
title: "Refactoring Dotfiles For Colemak"
description: "Refactoring defautl qwerty configuration to colemak keyboard layout"
date: 2020-07-09T15:46:26Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
tags:
- linux
categories:
- Productivity
- touch typing
series:
- colemak
image: images/keyboard.png

weight: 1
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: "/images/whoami/smile.png" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

### Background

I will write how a made a switch to colemak. However, until recently, I was still trying to mimic the vim keybindings
from qwerty. This is a post where i dicucss the changes I made to ensure that I never have to strech my fingers in odd ways again. The main idea is expressed well by [vim-colemak](https://github.com/jooize/vim-colemak)

Most of my configuration is based on [bunnyfly](https://github.com/bunnyfly/dotfiles). A colemak user
{{<boxmd>}}
```layouts
Colemak layout:                  |                 QWERTY layout:
`12345 67890-=     Move around:  |  (instead of)   `12345 67890-=
 qwfpg jluy;[]\         e        |       k          qwert yuiop[]\
 arstd HNEIo'         h   i      |     h   l        asdfg HJKL;'
 zxcvb km,./            n        |       j          zxcvb nm,./
```
{{</boxmd>}}

### Vimium

I use the excellend vimium to make chrome be a little less annoying. Luckily [the wiki](https://github.com/philc/vimium/wiki/colemak) seem to have a reasonable suggestion for colemak. The basic idea is to migrate the underlying keys directly to ensure very few manual changes are require.

This configuration is added on vimium options page.

{{<boxmd>}}
mapkey n j
mapkey N J
mapkey e k
mapkey E K
mapkey i l
mapkey I L
mapkey k n
mapkey K N
mapkey l i
mapkey L I
mapkey j e
mapkey J E
{{</boxmd>}}

### Zsh

To ensure uniform bindings. 

{{<boxmd>}}
  bindkey -M vicmd "h" backward-char
  bindkey -M vicmd "n" down-line-or-history
  bindkey -M vicmd "e" up-line-or-history
  bindkey -M vicmd "i" forward-char
  bindkey -M vicmd "s" vi-insert
  bindkey -M vicmd "S" vi-insert-bol
  bindkey -M vicmd "k" vi-repeat-search
  bindkey -M vicmd "K" vi-rev-repeat-search
  bindkey -M vicmd "l" beginning-of-line
  bindkey -M vicmd "L" end-of-line
  bindkey -M vicmd "j" vi-forward-word-end
  bindkey -M vicmd "J" vi-forward-blank-word-end

  bindkey -M vicmd "u" undo
  bindkey -M vicmd "U" redo
  bindkey -M vicmd "^?" backward-delete-char
  bindkey -M vicmd "^[[3~" delete-char

  bindkey -M viins '^R' history-incremental-pattern-search-forward
  bindkey -M viins '^r' history-incremental-pattern-search-backward      
{{</boxmd>}}

### Zathura

There is no better way to read pdf than [zathura]() and it also works for djvu and friends. as a plus point, it normally has very reasonable **vim** bindings , and an excellent configuration system, so we will leverage that. The best part is that we can just add to it using include **Zathuracolemk** or whatever so as to be minimally invasive.

{{<boxmd>}}
map n scroll down
map e scroll up
map h scroll left
map i scroll right

map N scroll half-down
map E scroll half-up

map k search forward
map K search backward


map [index] n navigate_index down
map [index] e navigate_index up
map [index] h navigate_index collapse
map [index] i navigate_index expand

map [index] H navigate_index collapse-all
map [index] I navigate_index expand-all

{{</boxmd>}}

### i3

I have some bindings set ut in terms of focing the window. This does all the work.

{{<boxmd>}}
bindsym $mod+h			focus left
bindsym $mod+n			focus down
bindsym $mod+e			focus up
bindsym $mod+i			focus right
{{</boxmd>}}

### Conclusions

That seems to be it for now. If I think of more programs I use reqularly which allow vim bindings. Or keybindings in general. i'll probably just update this post. My full dotfiles are [present here](https://github.com/eduuh/dotfiles)

