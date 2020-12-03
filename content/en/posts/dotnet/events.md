---
title: 'Raising and handling events'
description: 'Events are often described as actions that happens to an object...'
date: 2020-11-10T08:11:28Z
draft: true
hideToc: false
enableToc: true
author: eduuh
authorEmoji: 🤖
series:
  - c#
---

**Methods** are often describled as **action that an object can perform, either on itself or to related objects**. For example, a List can add an item to itself or clear itself , and file can creae or delete a file in the filesystem.

Events are often decribed as **action that happens to an object.** For example , in a user interface, **Buttons** has a click event, click being somethong that happens to a button. Another way of thinking of events is that they provide a way to exchainging messages between two objects.

Events are build on **delegates**.

### Calling Methods using delegates.
