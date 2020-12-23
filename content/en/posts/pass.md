---
title: "Password Management on Linux"
description: "Using Pass"
date: 2020-07-09T15:46:26Z
draft: false
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖

tags:
- cli
categories:
- config

image: images/pass/password.png
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: "/images/whoami/smile.png" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: CommandLine enthusiastic , Javascript and dotnet developer # author description
---

### Guide to password-Store

Recently I decided to start using a password manager as I've found myself caring more and more about security lately. Like many other **I had the bad habit of using the same few passwords across many sites and with the multitude of security breaches and password.**

**So, I've taken it upon myself to "up my game".**

#### A quick side note about this guide.

I assume in this guide that you're running in a **linux, Mac, BSD or some other Unix-like system running bash or comparable shell.**

{{<boxmd>}}

- **On windows**
  - You could use **a password manager available for windows. or you could install WSL for linux.**

{{</boxmd>}}

### What is a Password manager?

##### Wondering what a password manager is?

A **password manager is a piece of software that will store your passwords in an encrypted form** and tie those to specific websites so you don't ave to remember them. The benefit of this is you can then **store very complex passwords which are unique to each site** making any one security breach mean nothing because they cannot use that info to get access to your other accounts. You could also need to **store passwords for your VMs on azure.** Or even **generate and store complex password** without the need to even think about it.

There are alot of password managers out there to try, some which cost money and some that don't and unfortunately none of the hosted options seem resonable to use for me. This led me to look for a self hosted solution that was simple to understand and flexible so at least if it got breached it was my own fault and hadn't cost me any money. This is when I stumbled upon **pass**.

### What is a Pass?

**Password management should be simple and follow Unix philosophy**. With pass, each **password Lives inside of a `gpg` encrypted file whose filename is the title of the website or resource that require the password**. These encrypted files may be organized into meaningful folder hierarhies, **copied from computer to computer**, and in general, manipulated using standard command line file management utilities.

**pass** makes managing these individuals password files extremely easy. All passwords live in **~/.password-store** and **pass** provide some nice commands for **adding, editing , generating and retrieving passwords.** It is a very short and simple shell script.

{{<boxmd>}}
**It's capable of temporarily putting password on your clipboard and tracking password changes using git.**
{{</boxmd>}}

You edit the password store using ordinary unix shell commands alongside the pass command. There are no funky file formats or new paradigms to learn. There is **bash completion** so that you can simply hit tab to fill in names and commands, as well as completion for zsh and fish available in the **completion** folder. The very active community has produced many impresive clients and Gus for other platforms as well as extensions for pass itself.

Pass itself is little more that a set of scripts **wrapping gpg and git** but to me that is its strength because those are tools which I'm already familiar with.

### Step 1. Setting up gpg

<hr>

GPG can seem extremely complicated at first an that's because it is, but once it's set up you rarely have to mess with it again. **GPG works in much the same way an SSH key or an SSL cert works**, you have a **public key which encrpts things and a matching private key which decrypts those things**. This means it's safe to give out your public key but not your private key. Here is a simplified explanation:

- So first things first we need to generate a gpg key:

{{<boxmd>}}
**gpg2 --full-gen-key**
{{</boxmd>}}

![gpg full gen](/images/pass/pass.png)

When prompted for a password pick something that you will for sure remember , as this is your **master password** and will be used to unlock your other passwords once you set them up. If you forget the master password after you've set all this up **you're going to have a bad time**

On the image 👆look out for the line.
{{<boxmd>}}
**gpg: key 24F21F94DB8F11E2 marked as ultimately trusted**
{{</boxmd>}}

### Step 2 . Set up Pass

Now that we have a **public and private key** to encrypt and decrypt with we can set up our password store. First run **Pass init and use the gpg key**. I was using pass but when writing this post I needed to change my **ssl** key.

![password reinitilization](/images/pass/changekey.png)

#### Now let's set up git:

![Reinitialized](/images/pass/initialized.png)

This has turned our password store into a git repositroy, if you're unsure about what that means fear not because pass takes care of the hard parts of git for us and we'll leave the bits we need to know until later. Now we can add our first password, let's create a test password.

![Adding password to store](/images/pass/addpassword.png)

The way generate works is that pass takes first the name of the password (often te domain name such as google.com) and then the lenght of password you want it to generate. There are multiple flags you can give generate to make it conform to whatever password rules you would like, you can view possible options with **pass generate --help**.

You'll now be able to do a listing of your password store by just running `pass` with no arguments:

![Check password](/images/pass/checkpassstore.png)

If you don't see output like the above try running throught the steps above again to make sure you didn't miss anything. If that still doesn't work drop a comment below and I'll try to help.

### Retrieving a password

If you want to see the password simply tell pass which one you want and enter your master password when prompted.

You will need to **input the pass phrase** for you private key in order to see your password. (ensure to use gpg key with a passphrase.)

```bash
\$ pass test
2>{qj,SnrJ
```

if you would like it copied to your clipboard automatically you can use the -c flag. The password is copied to your clipboard for only 45 seconds. After that its cleared.

```bash
pass -c test
```

All pass is doing her is storing the generated file in an encrypted plain text file in a folder located at `#HOME/.password-store` and in case you were wondering, yes since it's just an encryted plain text file you can store whatever you want in there! Such as notes etc. I am planing to keep encypted IP addresses of servers and what ports they are using.

Since we no longer need our test . **Lets get rid of it**:

    [dwm@edwin ~]$  pass rm test
    Are you sure you would like to delete test? [y/N] y
    removed '/home/dwm/.local/share/password-store/test.gpg'
    [master bc7826e] Remove test from store.
     1 file changed, 0 insertions(+), 0 deletions(-)
     delete mode 100644 test.gpg

There you go ! That's all you need to know to effectively use `pass` for basice use cases. I recommend checking out the main site since they link to the android, desktop, ios apps and browser plugins.

If you want to sync to another device you need to copy the `$HOME/.password-store` and `$HOME/.gnupg` to the target machine, however there is a much better method that allows you to sync continuously without using dropbox or a flash drive but requires a little more setup work up front which I will go over below.

### Step 3 . Using git for your Password Store.

Pass can use git to **synchronize passwords securely**. If you want to use your password store as the git repository. As you nomarly use git to it all the same.

##### 1. Lets first enable git signing.

```bash
$ pass git config --bool --add pass.signcommits true
```

##### 2. Initialize password store.

You could use the same email you use with **github** or other **remote service** you are using. I store my passowords in **azure devops** private repository. But for this i will demonstrate using github account.

```bash
$ pass init edwinsemail@outlook.com

```

list what is your pass Store.

```bash
$ pass

```

##### 3. Initialize your PassStore git repository.

```bash
pass git init

```

##### 4. Connect to a remote repository.

```bash
$ pass git remote add origin https://github.com/eduuh/password.git
```

##### 5. Push your password to the Remote repository.

The first push to github. Use the command to push all your passwords to github.

```bash
pass git push -u --all

```

I think this is a safe way to sync your passwords. The password is not pushed to github. What is pushed is your encrypted password. Your password are safe if you don't disclose your private key which is used to decrypt your passwords.

![githubimages](/images/pass/github.png)

{{<boxmd>}}

##### Future updates

1. **Write about storing private keys to Azurekeyvault. Automated way**
2. **Setting up a computer with from a passstore repository with private gpg key**
3. **How is use pass with DWM**

{{</boxmd>}}
