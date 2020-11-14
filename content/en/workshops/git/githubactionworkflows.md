---
description: Github Action Automation.
date: 2020-11-13T11:37:37+03:00
draft: true
linktitle: ''
title: 'Github Actions and Workflows Guide'

tags:
  - cli
series:
  - git
  - devops

weight: 10
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

### Some Terms you Need to Understand.

1. **Events.** Trigger the workflow.
2. **Workflows.** A workflow is a group of jobs. Workflow runs in a reqular or
   triggerd by events
3. **Jobs.** Jobs are a group of actions which are run in steps.
4. **Step**. Performs one actions. **deployment**
5. **Action.** Run a single shell command.
6. **Virtual Environment** A worklow runs on a virtual environments.
7. **Runners**
   - **Github-hosted Runners**
   - **self-hosted Runners**

A tool that lets you automate your software development workflows.

- You can write individual tasks called **actions** and **combine** them to
  create a custom workflows.

**Workflow** are custom automated process that you can set up in your repository
to **build , test , package, release, or deploy** any code project on Github.

**Events that can happend on a Github repository**

1. Push.
2. Pull Requests (opened , merged)
3. Issue {created , closed}
4. Sheduled events.
5. External Events.

The **events** are used to trigger a **workflow**. The workflow runs on the
**github server** in terms of **jobs**. The **github server** can be either a
**linux, windows, MacOS** with tools installed or **Docker Container**.

A set of actions part of a workflow can be refered to as a **job**. A workflow
now can have **multiples Jobs**. The job is run on a **Vm** instance which could
either run **in pallarel or one by one (dependent)**.

You could write a **workflow** that builds **android** and **ios**. Both of this
jobs can run in parallel. Or they could wait for another job to finish first .
The two **workflows** could be waiting for the testing **workflow to finish** in
order to run the two **in parralel** or **separately.**

Draw the image her

## A Runner

- Any machine with the **github Actions runner** application installed.
- A **Runner** is responsible for running you jobs whenver an events happens and
  display back the results.
- A runner can be **hosted on github** or **you could host your own**.

### Github-hosted Runners.

- Linux, Windows or MacOs Virtual environments with commonly-used pre-installed
  software on a **gibhub server**.
- Mainted **by github**.
- You cannot customize the **configurations** of this machines.

### self-hosted Runners.

- A machine you manage and maintain with runner application installed.
- You have more control of **hardware**, **operating system, and software
  tools** than github-hosted runners provides.
- Ideal if you need to control **hardware. Add more memory for **larger jobs** Or Choosing an operating system not offered by **github-hosted runners.\*\*.

**In most cases you might not need a self hosted runner but is good to know this
option is there**

### Pre-installed Software.

The **github-hosted runners** comes with some pre installed runners tools which
include the following.

- Tools like **curl, git, npm, yarn and pip**
- Languagese like **python, ruby, nodeJS**
- **Android SDK and XCode**.

**Github actions** are usually written in **yaml format**. Yaml format is a data serilization data format.

**Yaml** stores values in key value pairs.

- always indent with 2 or 4 spaces. **not tab**.
  - I prefer using 4 since it becomes more readable.

### Lets Create a github Workflow.
