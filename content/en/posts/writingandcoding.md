---
title: 'Creating a workspace for Programming and Writing'
description: 'A workspace for programming and Writing'
date: 2020-06-28T16:03:42Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 😎
tags:
  - linux
categories:
  - Productivity
series:
  - workspace
---

Writing and programming are two different fundamentally different activities.

Vim is my favorite text editor. It has a steep learning curve, but once you learn the basics, editing becomes
joyfully efficient.

There's a reason why **Vim** is more popular among programmers than it is with writers: it's a command line tool that's not intuitive, and using it without frustration requires both techinical and grit.

{{<boxmd>}}
**set linebreak**
{{</boxmd>}}

This works by softwrapping, which insert a visual line break but doen't add an actual carriage return character.
If you have this setting turned on, you've probably discovered that vim ignores the visual linebreaks when you use _n_ and _e_ to move down or up a line respectively.

This make some sense when you're programming, but in prose it completely breaks things. If a prose writer keeps typing sentense after sentence without hitting return, that writer is probably writing a paragraph. If the writing is good, each word should matter. When we edit a paragraph, we want to be able to get to any part of the paragraph as quickly as possible.

Vim's default behaviour makes it hard to get to the middle of the paragraph, and while we could use **gn** and **ge** to jump by visual lines, this effectively doubles the number of keystrokes we need and that's no fun.

To fix it, we just need to remap _n_ to **gn** and **e** to **ge**.

{{<boxmd>}}
**noremap n gj|noremap e gk**
{{</boxmd>}}

The above allow you to move by visual line, so I've got this as permanet setting in my **.vimrc.**

#### Goyo

Goyo plugin provides distraction free writing. What's great about Goyo is that it gives your words room to breathe by increasing the padding in you window. It also eliminates the line numbers, which is nice for prose (It doesn't matter to me waht paragraph number I'm working on when I'm writing, I just want to write.)

[Goyo]() is available on Github, and setting it up is straight forward: just grab the **Vim-plug plugin manager**
from github and read the instruction. Then add goyo to your **.vimrc**.

{{<boxmd>}}
call plug#begin() Plug
'junegunn/goyo.vim'
call plug#end()
{{</boxmd>}}


