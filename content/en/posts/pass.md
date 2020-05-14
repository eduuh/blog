---
title: "Pass"
date: 2020-05-14T08:37:45Z
draft: true
---
## Guide to password-Store

Recently I decided to start using a password manager as I've found myself caring more and more about security lately. Like many other `I had the bad habit of using the same few passwords across many sites and with the multitude of security breaches and password.` So, I've taken it upon myself to "up my game" and practice what my good friend Jason Crosy preaches.
## A quick side note about this guide.
I assume in this guide that you're running in a linux, Mac, BSD or some other Unix-like system running bash or comparable shell. On windows I have no idea ow to set all this up, there is a windows client for password-store that I can attest to working quite well.
## What is a Password manager?
Some of you may be wondering what a password manager is and I don't blame you. A password manager is a piece of software that will store your passwords in an encrypted form and tie those to specific websites so you don't ave to remember them. The benefit of this is you can then store very complex passwords which are unique to each site making any one security breach mean nothing because they cannot use tat info to get access to your other accounts, whie the complexity of the passwords with thwrt most if not all attempts to even get the password for the breached site.

You also get the convenience of only needing to rememder one password as you will use a "master password" to unlcock all of the other randomized passwords.

There are alot of password managers out there to try, some which cost money and some that don't and unfortunately none of the hosted options. This led me to look for a self hosted solution that was simple to understand and flexible so at least if it got breached it was my own fault and hadn't cost me any money. This is when I stumbled upon pass.

## What is a Pass?

Password management should be simple and follow Unix philosophy. With pass, each password Lives inside of a `gpg` encrypted file whose filename is the title of the website or resource that require the passoword. These encrypted files may be organized into meaningful folder hierarhies, copied from computer to computer, and in genreal, manipulated using standard command line file management utilities.


`pass` makes managing these individuals password files extremely easy. All passwords live in `~/.password-store ` and `pass` provide some nice commands for adding, editing , generating and retrieving passwords. It is a very short and simple shell script. It's capable of temporarily putting passworts on your clipboard and tracking passoword changes using git.

You can edit the password store using ordinary unix shell commands alongside the pass command.  Therea are no funky file formats or new paradigms to learn. There is `bash completion` so that you can simply hit tab to fill in names and commands, as well as completion for zsh and fish available in the `completion` folder. The very active communty has produced many impresive clients and Gus for other platforms as well as extensions for pass itself.

Pass itself is little more that a set of scripts wrapping gpg an git but to me that is its strenght because those are tools which I'm already familiar with. Enough rambling however, lets get to the guide.

## Step 1. Setting up gpg

GPG can seem extremely complicated at first an that's because it is, but once it's set up you rarely have to mess with it again. Yay!

GDG works in much the same way an SSH key or an SSL cert works, you have a public key which encrpts things and a matching private kiy which decrypts those things. This means it's safe to give out your public key but not your private key. Here is a simplified explanation:

So first things first we need to generate a gpg key:

     gpg2 --full-gen-key

Fill out the prompts with your own information, for the first question (kind of key) the default is best but for key lenght go ahead and pick `4096`, this will future proof you a bit and is plenty practical given the speed of modern computers. Make sure you use your full name and email when prompted . We will use the email to reference this key in later steps.

When prompted for a password pick something that you will for sure remember , as this is your "master password" and will be used to unlock your other passwords once you set them up. If you forget the master password after you've set all this up `**you're going to have a bad time**`


disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: key F722AAAB8A2E60B1 marked as ultimately trusted
### Using the  password Store

    [dwm@edwin ~]$ gpg2 --full-gen-key
    [...]
    disks) during the prime generation; this gives the random number
    generator a better chance to gain enough entropy.
    gpg: key F722DDDFFFFRRR1 marked as ultimately trusted

## Step 2 . Set up Pass

Now that we have a public and private key to encrytp and decrypt with we can set up our password store. First run: Pass init and use the gpg key

    [dwm@edwin ~]$ pass init F722DDDFFFFRRR1
    Password store initialized for F722DDDFFFFRRR1
    [master 726cf99] Set GPG id to F722AAAB8A2E60B1.
     1 file changed, 1 insertion(+), 1 deletion(-)

Now let's set up git:

    [dwm@edwin ~]$ pass git init
    Reinitialized existing Git repository in /home/dwm/.local/share/password-store/.git/

This has turned our password store into a git repositroy, if you're unsure about what that meands fear not because pass taks care of the hard parts of git for us and we'll leave the bits we need to know until later. If you really want to know aout using `i recently prepared a git workshop` which would be a good starting point.Toot goes my horn.Now we can add our first password, let's create a test password.

    [dwm@edwin ~]$ pass generate test 10
    [master 3c358cc] Add generated password for test.
     1 file changed, 0 insertions(+), 0 deletions(-)
     create mode 100644 test.gpg
    The generated password for test is:
    2>{qj,SnrJ

The way generate works is that pass takes first the name of the password (often te domain name such as google.com) and then the lenght of password you want it to generate. There are multiple flags you can give generate to make it conform to whatever password rules you would like, you can view possible options with `pass generate --help`.

You'll now be able to do a listing of your password store by just running `pass` with no arguments:

    [dwm@edwin ~]$ pass
    Password Store
    ├── genymotion
    ├── github
    └── test
If you don't see output like the above try running throught the steps above again to make sure you didn't miss anything. If that still doesn't work drop a comment below and I'll try to help.

## Retrieving a password
If you want to see the password simply tell pass which one you want and enter your master password when prompted.

    [dwm@edwin ~]$ pass test
    2>{qj,SnrJ
if you would like it copied to your clipboard automatically you can use the -c flag .

    [dwm@edwin ~]$ pass -c test
    Copied test to clipboard. Will clear in 45 seconds.

All pass is doing her is storing the generated file in an encrypted plain text file in a folder located at `#HOME/.password-store` and in case you were wondering, yes since it's just an encryted plain text file you can store whatever you want in there! Such as notes etc. I am planing to keep encypted IP addresses of servers and what ports they are using.

Since we no longer need our test . Lets get rid of it:

    [dwm@edwin ~]$  pass rm test
    Are you sure you would like to delete test? [y/N] y
    removed '/home/dwm/.local/share/password-store/test.gpg'
    [master bc7826e] Remove test from store.
     1 file changed, 0 insertions(+), 0 deletions(-)
     delete mode 100644 test.gpg
There you go ! That's all you need to know to effectively use `pass` for basice use cases. I recommend checking out the main site since they link to the android, desktop, ios apps and browser plugins.

If you want to sync to another device you need to copy the `$HOME/.password-store` and `$HOME/.gnupg` to the target machine, however there is a much better method that allows you to sync continuously without using dropbox or a flash drive but requires a little more setup work up front which I will go over below.

### Step 3 . Git
First things first, you'll need a server that has a publically accessilble ip address and that you have ssh
