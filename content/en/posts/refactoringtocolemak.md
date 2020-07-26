---
title: "Refactoring Dotfiles For Colemak"
description: "Refactoring default qwerty configuration to colemak keyboard layout for common unix programs."
date: 2020-07-09T15:46:26Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
tags:
- colemak
- cli
categories:
- Productivity
- linux

weight: 1
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: "/images/whoami/smile.png" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

#### Background

I will write how a made a switch to colemak. However, until recently, I was still trying to mimic the vim keybindings from qwerty to a colemak equivalent. This is a post where i discuss the changes I made to ensure that I never have to strech my fingers in odd ways again. The main idea is expressed well by [vim-colemak](https://github.com/jooize/vim-colemak).

Most of my configuration is based on [bunnyfly](https://github.com/bunnyfly/dotfiles). A colemak user, who have inspired my Journey.

{{<boxmd>}}

```layouts
Colemak layout:                  |                 QWERTY layout:
`12345 67890-=     Move around:  |  (instead of)   `12345 67890-=
 qwfpg jluy;[]\         e        |       k          qwert yuiop[]\
 arstd HNEIo'         h   i      |     h   l        asdfg HJKL;'
 zxcvb km,./            n        |       j          zxcvb nm,./
```

{{</boxmd>}}

##### 1. Vimium , A Chrome/Brave extension

I use the excellent vimium to make brave be a little less annoying. Luckily [the wiki](https://github.com/philc/vimium/wiki/colemak) seem to have a reasonable suggestion for colemak. The basic idea is to migrate the underlying keys directly to ensure very few manual changes are require.

This **configuration is added on vimium options page on the Custom remapping section.**

{{<boxmd>}}
**mapkey n j
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
mapkey J E**
{{</boxmd>}}

##### 2. Zsh

To ensure uniform bindings in zsh shell.

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

##### 3. Zathura

There is no better way to read pdf than [zathura]() and it also works for djvu and friends, as a plus point, it normally has very reasonable **vim** bindings , and an excellent configuration system, so we will leverage that. The best part is that we can just add to it using include **Zathuracolemk** or whatever so as to be minimally invasive.

{{<boxmd>}}
**map n scroll down
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
map [index] I navigate_index expand-all**
{{</boxmd>}}

##### 4. i3

I have some bindings set ut in terms of focing the window. This does all the work.

{{<boxmd>}}
**bindsym $mod+h			focus left
bindsym $mod+n focus down
bindsym $mod+e			focus up
bindsym $mod+i focus right**
{{</boxmd>}}

##### 5. nvim

I have some the following remaps in my init.vim file.

{{<boxmd>}}
**"Colemak Remaps {{{
noremap n j
noremap i l
noremap e k
noremap k n
noremap K N
" _r_ inner Text object
noremap l i
noremap L I
" set j (same as h , cursor left) to 'end of word'
noremap j e
noremap J E**
{{</boxmd>}}

##### 6. Tmux (Copy mode)

This is the keybindings that i use when using copy mode in tmux.

{{<boxmd>}}
**\# colemak keys
bind-key -T copy-mode-vi n send -X cursor-down
bind-key -T copy-mode-vi e send -X cursor-up
bind-key -T copy-mode-vi i send -X cursor-right
bind-key -T copy-mode-vi k send -X search-again
bind-key -T copy-mode-vi K send -X search-reverse
bind-key -T copy-mode-vi l send -X start-of-line
bind-key -T copy-mode-vi L send -X end-of-line
bind-key -T copy-mode-vi j send -X next-word-end
bind-key -T copy-mode-vi J send -X next-space-end
bind-key -T copy-mode-vi c-n send -X bottom-line
bind-key -T copy-mode-vi c-m send -X middle-line
bind-key -T copy-mode-vi c-e send -X top-line**
{{</boxmd>}}

#### Conclusions

That seems to be it for now. If I think of more programs I use reqularly which allow vim bindings. Or keybindings in general. i'll probably just update this post. My full dotfiles are [present here](https://github.com/eduuh/dotfiles)
