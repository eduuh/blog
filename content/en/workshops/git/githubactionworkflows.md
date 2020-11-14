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

**Workflow** are custom automated process that you can set up in your repository to **build , test , package, release, or deploy** any code project on Github.

**Events that can happend on a Github repository**

1. Push.
2. Pull Requests (opened , merged)
3. Issue {created , closed}
4. Sheduled events.
5. External Events.

The **events** are used to trigger a **workflow**. The workflow runs on the **github server** in terms of **jobs**. The **github server** can be either a **linux, windows, MacOS** with tools installed or **Docker Container**.

A set of actions part of a workflow can be refered to as a **job**. A workflow now can have **multiples Jobs**. The job is run on a **Vm** instance which couldeither run **in pallarel or one by one (dependent)**.

You could write a **workflow** that builds **android** and **ios**. Both of this jobs can run in parallel. Or they could wait for another job to finish first . The two **workflows** could be waiting for the testing **workflow to finish** in order to run the two **in parralel** or **separately.**

Draw the image her

### A Runner

- Any machine with the **github Actions runner** application installed.
- A **Runner** is responsible for running you jobs whenver an events happens and
  display back the results.
- A runner can be **hosted on github** or **you could host your own**.

### Github-hosted Runners.

- Linux, Windows or MacOs Virtual environments with commonly-used pre-installed
  software on a **gibhub server**.
- Mainted **by github**.
- You cannot customize the **configurations** of this machines.

### Self-hosted Runners.

- A machine you manage and maintain with runner application installed.
- You have more control of **hardware**, **operating system, and software
  tools** than github-hosted runners provides.
- Ideal if you need to control **hardware. Add more memory for **larger jobs** Or Choosing an operating system not offered by **github-hosted runners.\*\*.

**In most cases you might not need a self hosted runner but is good to know this option is there**

### Pre-installed Software.

The **github-hosted runners** comes with some pre installed runners tools which include the following.

- Tools like **curl, git, npm, yarn and pip**
- Languagese like **python, ruby, nodeJS**
- **Android SDK and XCode**.

**Github actions** are usually written in **yaml format**. Yaml format is a data serilization data format.

**Yaml** stores values in key value pairs.

- Always indent with 2 or 4 spaces. **not tab**.
  - I prefer using 4 since it becomes more readable.

### Lets Create a github Workflow.

Lets create our first **workflow** for our code.

{{<boxmd>}}
**mkdir gitactions
cd gitactions
git init
mkdir .github
cd .github
mkdir workflows
cd workflows
touch simple.yml**
{{</boxmd>}}

Type this in the **simple.yml** file you just created.

```yaml
name: shell commands

on: [push]

jobs:
  run-shell-command:
    runs-on: ubuntu-latest
    steps:
      - name: echo a string
        run: echo "Helo world"
      - name: Multiline script
        run: |
          node -v
          npm -v
```

1. 👆 is a **simple workflow file**. The workflow is named **shell commands**, which is triggered by the **push events**. The **name** keyword is used to define the name of the workflow.
2. A workflow usuall contains **one or more jobs** and for this case we have one job which is an objects named **run-shell-command**.
3. You must specify the **environments** to run your job into with the **runs-on command**. here we are using **ubuntu-latest**.
4. A Job also contains **steps**.
5. The steps could then contains **actions** or **bash commands cmd**. Here we created two steps. **echo a string** and **Multiline script**.

{{< alert theme="warning" dir="ltr" >}}
**Note:** We use the pipe **|** to define multiline commands. The second **step** is use to define two commands **node -v** and **npm -v**.
{{< /alert >}}

6. Lets push our changes to our **repository**.

{{<boxmd>}}
**Note:** ensure you are in your folder
**git init
hub create
hub push**
{{</boxmd>}}

7. Now lets **see** what is in our repository. Using hub is easy.

{{<boxmd>}}
**hub browse**
{{</boxmd>}}

![hub browse](/images/git/github/hubbrowse.png)

8. 👆 above command will take you directly to github page.

![github page](/images/git/github/githubap.png)

9. Open the / click on the **action** tab You should see the following.

![action page on github](/images/git/github/actionpage.png)

10. Lets open **our job and see what happend**. You will need to click ot the
    **run-shell-command** located on your left side of the screen.

![jobs ](/images/git/github/jobs.png)

{{< alert theme="warning" dir="ltr" >}}
👆 **The first and the last job** are set by **github**. The first step is for setting up the environments and the **last step** if for cleaning up.

You could also to choose to receive a notification, once you jobs are run. This setting is available in your setting in **Notification**. You could choose either **Email**, **web** or **Send notification for failed worklows only**

When the **Job** is running you can cancel the Job. Once a job has failed you can also retry the job. from the **ui**.

{{< /alert >}}

![image](/images/git/github/notification.png)

11. Lets make our job fail. **By using the a command that does not exist on linux** Lets mispell **echo** to **eccho** in the above **yml** file.

```yaml
run: eccho "Helo world"
```

12. Lets commit the change and push the code to github and see what happens.

```cmd
git add .
git commit -m "Making the job fail"
hub push
hub browse
```

13. If you followed the command above you will land to to the repo page. Click on **action** and you will get here 👇.

![job failed](/images/git/github/jobfail.png)

{{< alert theme="warning" dir="ltr" >}}
**Note:** You can download log archive from the UI. This is usually helpful when you are debugging a failed **Job**. Take note of this.

By Default we get less information, about our running job. But we could enable some setting to see more information. We need to enable **some secrets**.
This is usually enable at a **project level settings > secrets**. To read more on this read [github documentation](workflow: ACTIONS_RUNNER_DEBUG to true.) We are setting **workflow: ACTIONS_RUNNER_DEBUG to true.** and **workflow: ACTIONS_STEP_DEBUG to true**
{{< /alert >}}

![Output image](/images/git/github/secrets.png)

![Output image](/images/git/github/output.png)

You will notice that the output is a **little bit noise to much** but you could enable the secrets when you are debugging your Job to get more **info**. After you activate the **secrets** the logs will contains **more information**.

### Using Other Shells (Powershell)

Some supported shells.

- bash. **Linux shell**
- powershell: => **windows only**
- Python. **python shell**

14. Lets Modify our **workflow** to run some python script using **the python
    shell**.

```yaml
name: shell commands

on: [push]

jobs:
  run-shell-command:
    runs-on: ubuntu-latest
    steps:
      - name: echo a string
        run: echo "Helo world"
      - name: Multiline script
        run: |
          node -v
          npm -v
      - name: python command
        run: |
          import platform
          print(platform.processor())
        shell: python
```

![Different shell](/images/git/github/shell.png)

👆 At the **step** level where we define a new level You could change the
**shell** you use using the **shell command**. View [available shells](https://docs.github.com/en/free-pro-team@latest/actions/reference/workflow-syntax-for-github-actions#using-a-specific-shell)

15. Lets create **windows jobs**. To create a **shell** that run on windows would require a **windows virtual machine**. To run different virtual machine we require **different jobs** which could be run in parallel or sequentially. All Jobs should be at the same level of indentation.

```yaml
name: shell commands

on: [push]

jobs:
  run-shell-command:
    runs-on: ubuntu-latest
    steps:
      - name: echo a string
        run: echo "Helo world"
      - name: Multiline script
        run: |
          node -v
          npm -v
      - name: python command
        run: |
          import platform
          print(platform.processor())
        shell: python
  run-windows-commands:
    runs-on: windows-latest
    steps:
      - name: Directory Poweshell
        run: Get-Location
      - name: Directory Bash
        run: pwd
        shell: bash
```

![Two jobs](/images/git/github/twojobs.png)

👆 We have **two jobs** running in parallel in **github**. The windows job output are as follows.

{{<boxmd>}}
**git add .
git commit -m "Added windows Job"
git push**
{{</boxmd>}}
![windows jobs](/images/git/github/windowsjob.png)

16. Add **needs** command to make a Jobs run in series. By default github will run the **jobs in parallel**. But we could have a situation we could need to run the jobs in series. The first jobs run and when it succefully completes , the second job is then run using the **output** of the first one. Lets see how we could do this. We use **needs** command which could take an **array** of jobs. On the secondcommand lets add **needs: ["run-shell-command"]**

```yaml
run-windows-commands:
  runs-on: windows-latest
  needs: ['run-shell-command']
  steps:
    - name: Directory Poweshell
      run: Get-Location
    - name: Directory Bash
      run: pwd
      shell: bash
```

{{<boxmd>}}
**git add .
git commit -m "Changed jobs run mode to run in series"
git push**
{{</boxmd>}}

Both applications run as **needed.**

### Actions Deep Dive

Actions are **code** that someone has written , to assist in doing some tasks, you can use them in your workflows as steps. We could have more than one workflow in git repository. Lets create a new workflow in the **.github** folder. Action can be **Public or pre-created**.

17. Lets use [Hello world Javascript action](https://github.com/actions/hello-world-javascript-action). This actions prints "Hello world" or "Hello" + the name of persion to greet to the log.

{{<boxmd>}}

1. **Actions receives: inputs**
1. **Actions also have outputs**
   {{</boxmd>}}

👆 The above action takes an inputs **who-to-greet: <name>** and gives out outputs **time**. Lets create this worlflow and be observent on how we pass in the input and how we get the outputs.

```yaml
name: Actions Workflow

on: [push]

jobs:
  run-github-actions:
    runs-on: ubuntu-latest
    steps:
      - name: Simple Js Action
        id: greet
        uses: actions/hello-world-javascript-action@v1.1
        with:
          who-to-greet: Edwin
      - name: Log Greeting time
        run: echo "${{ steps.greet.outputs.time }}"
```

{{<boxmd>}}
**git add .
git commit -m "Created a new workflow"
git push**
{{</boxmd>}}

The two workflow will **run in parralel**.

![The two worflows](/images/git/github/twoworkflows.png)
![Hello world workflows](/images/git/github/helloaction.png)

Lets focus on the **uses** line for a minute.

{{<boxmd>}}
**uses: actions/hello-world-javascript-action@v1.1**
{{</boxmd>}}

**uses** takes in a references to github or a relative reference. The github
refereference is written in the form **<githubusername>/<reponamae>@[branch|version|commitid]**. But its not advisable to **reference a branch** since this is the latest code. Code updates could have **breaking changes** which could make your workflow to fail.

A safe approach could to be mores specific by referenciing a **verison** or a **commit id**. This way the behaviour of the code does not change unless you change it. You notice that I use a **version reference**.

#### The checkout Action.

After we did the **ls** command from our last workflow, did you notice that no files were actually listed out. This is because By default **github** does not clone you repository in the **runner** environments. If our workflow would require our code, we would need to **checkout** our code in the repository. This is done using a **checkout action**. [Checkout action](https://github.com/actions/checkout) is written and maitained by github.

```yaml
name: Actions Workflow

on: [push]

jobs:
  run-github-actions:
    runs-on: ubuntu-latest
    steps:
      - name: List Files
        run: |
          pwd 
          ls -la

      - name: Checkout Action
        uses: actions/checkout@v1

      - name: List Files
        run: |
          pwd 
          ls -la

      - name: Simple Js Action
        id: greet
        uses: actions/hello-world-javascript-action@v1.1
        with:
          who-to-greet: Edwin
      - name: Log Greeting time
        run: echo "${{ steps.greet.outputs.time }}"
```

Lets look at **some Environment variables** that are set by **default** when using **github actions** we will check on this later on. Lets just list them out.To list the out we could use the echo command.

```bash
echo $GITHUB_SHA
echo $GITHUB_REPOSITORY
echo $GITHUB_WORKSPASE
echo "${{ github.token }}"
```

Let me give you the updated .yml files.

```yaml
name: Actions Workflow

on: [push]

jobs:
  run-github-actions:
    runs-on: ubuntu-latest
    steps:
      - name: List Files
        run: |
          pwd 
          ls -la
          echo $GITHUB_SHA
          echo $GITHUB_REPOSITORY
          echo $GITHUB_WORKSPASE
          echo "${{ github.token }}"

      - name: Checkout Action
        uses: actions/checkout@v1

      - name: List Files
        run: |
          pwd 
          ls -la

      - name: Simple Js Action
        id: greet
        uses: actions/hello-world-javascript-action@v1.1
        with:
          who-to-greet: Edwin
      - name: Log Greeting time
        run: echo "${{ steps.greet.outputs.time }}"
```

![Echo out some variables](/images/git/github/echoout.png)

To do a **git checkout manually we could use** a step like follows. I did not test this though.

```yaml
run: |
  ls -a
  echo $GITHUB_SHA
  echo $GITHUB_REPOSITORY
  echo $GITHUB_WORKSPASE
  echo "${{ github.token }}"
  git clone git@github:$GITHUB_REPOSITORY
  git checkout $GITHUB_SHA
```

[Action market place]()
