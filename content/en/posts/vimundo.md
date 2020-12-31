---
title: 'Never Lose a change again: Undo branches in Vim'
description: 'How undo branches work in Vim 7.0 and Nvim'
date: 2020-12-26T12:41:06-07:00
draft: false
hideToc: true
enableToc: true
author: eduuh
authorEmoji: 🤖
tags:
  - linux
categories:
  - nvim
---

I often find myself in a Situation where I hit undo a couple of times to peek back in time, but losing the ability to redo my way back due to inserting some text by accident or intentional. This caused some unpleasan moments until I've learned about Vim's powerful **undo/redo system**.

#### Working with Undo branches in nvim

Undo tree was introduced in **vim 7.0**, fro that verson the history is stored in a tree rather than **a stack**. The root of the tree refers to the original version of the file (no changes), and every time you change something a new node is added to the graph. The latest leaf node represent the last change you have made.

For example, the history looks like the following if you add lie after line without using undo:

![vim history](/images/nvim/linear-history.png)

The path from the latest leaf node to the root contains all the changes you've made to reach the current state of the file.

With undo(**U**) and redo(**<c-r>**) you can walk upward and downwards this path.

![vim undo redo](/images/nvim/undo-redo.png)

Using these commands alone nvim behave like most editors that have the usual undo stack. However, if you change something after an undo action, the tree grows a new branch rather than simply discarding the previous future elements.

![vim undo redo](/images/nvim/undobranches.png)

Nvim keeps all your changes, but with **u** and **<C-R>** you can't reach the nodes that are outside the path to the root.

However, nvim has the **ability** to navigate the changes in the order they were made. With **g-** you can move to the previous item in time, while **g+** moves to the next one.

![vim undo redo](/images/nvim/comparinggwithundoredo.png)

This can be a solution to the proble of the accidentally lost changes while undoing around: hitting **g-** in this case can take you back to the latest version you need.

### Gundo

**g-** and **g+** is neat, however discovering the whole history graph with them might be inconvinient. [Guondo.vim]() provides an easy to use way to navigate in the **undo branches**. It requires Python and a **Vim build with python support.**

The plugin provides a nice graphical layout of the undo branches making the navigation in the changes trivial:

![vim undo redo](/images/nvim/guodo.png)

Remap the **<leader>u** to toggle the view, and I also had to set the **g:gundo_prefer_python3 to 1** because I am using python3.

```bash
nnoremap <leader>u :GundoToggle<Esc>
let g:gundo_prefer_python3 = 1
```

### Summary

Nvim has a powerful Undo/redo system that make sure that you don't lose any changes. Use the **g-/g+** if you get stuck with **u/<c-r>**. If you need total control over your history don't forget to install **Guondo.vim**.

I use vim plug.

```bash
Plug 'sjl/gundo.vim'
```
