
---
title: "Vim Practise"
date: 2020-05-14T08:37:45Z
draft: true
---

## Neovim / Vim 8

Vim is ubiquitous. it runs on most computers, and many systems have vim installed by default. knowing vim is skill set you can take with you wherever you go, and for many people, thats vim's killer feature.

as an **open source project** vim is good health. bug fixes and new features are being developend continuously.

### switch to neovim
neovim is a fork of vim. its main goal to make the editor more hackable has been achieved by modernizing the codebase.introducing a new plugin archicture and sharing resposibilitiy for the codebase with the community.

the neovim community has done a great deal of work to refactor vim's codebae, making it simpler and more maintainable. it works deligently to merge patches from upstream vim, so that bug fixes and features developed for vim 8 eventually make their way into neovim.

### Use both

you can use **vim and neovim** side by side, so you don't have to use either one exclusively. vim and neovim each have their place, and both projects will thrive for many years to come.

### Installing plugins
plugins add new functionality to vim. you'll use plugins througout this book, so you need to e able to install them. vim's build-in support for installing plugins has been poor. vim's  package feature made it easy to manage plugins. i use **vim plug**.

### Plugins makes it easy to organize and share scripts.

if you write a script that could be useflu to other vim users you might like to turn it into plugin. that simply means creating a directory with the name you want to give your plugin.


### Opening files


opening files is one of the most common tasks you perform when coding . vim's built-in functionality gives you basic commands for opening any readable character of a filepath. **tab-completion** can save you from typing evey character of the filepath.


## vim registers: the basics and beyond.

vim's register are that king of stuff that you don't think you need until you learn about them. after that, they become essential in your workfolw, and it's hard to let them behind. saying that, it's still incredible how many people use vim for years without knowing how to make proper use of them. bear with me and you won't be one of them.

### if you have no idea what i'm talking about.

you can think of registers as a bunch of spaces in memory that vim uses to store some text. each of these spaces have an `identifier`, so it can be accessed later.
it's no different than when you copy some text to your clipboard except that you usually have just one clipboard to copy to , while in `vim/ neovim` allows you to have multiple places to store different texts.

### The basic usage.
every register is accessed using a double quote before its name. for example, we can access the content that is in the register r with `r.`.

you could add the selected text to the register r by doing "ry. by doing y you are copying (yanking) the selected text, and then adding it to the register "r. to past the content of this register, the logic is the same: "rp." you are pasting the data that is in this register.

you can also access the registers in insert/command mode with `ctrl-r + register name` like in `ctrl-r r`. it wil just paste the text in your current buffer.

you can use the :reg command to see all ther registers and their content, or filter just the ones that you are interested with :reg a b c.

### The unnamed register

`vim` has a unnamed (or default) register that can be accessed with "". Any text that you delete (with d, c, s or x) or yank (with y) will be placed thare, and that's what vim uses to paste, when no explicit register is given. A simple p is the same thing as doing ""p.

### Never lose a yanked text again

It already happend to all of us. We yank some text, than delet some other, and whel we try to paste the yanked text , it's not there anymore, `vim` replaced it with the text that you deleted, then you need to go there and yank that text again.

Well, as I said , vim will always replace the unnamed register, but of course we didn't lose the yanked text, vim would not have survived that long if it was that dumb, right?

Vim automaticall populates what is `numbered registers` for us. As expected, these are register from "0 to 9."

`"0` will always have the content of the latest yank,and the other will have last 9 deleted text, being "1 the newest, and "9 the oldest. So if you yanked some text, you can always refer to it using "0p.

### The read only registers.

There are 4 read only registers: ". , "% , ": and "#.

The last inserted text is stored on ". , and it's quite handy if you need to write the same text twice, in different places, not needing to yank and paste.

"% has the current file path, starting from the directory where vim was first opened. What I usually use it for is to copy the current file to the clipboard, so I can use it externally (running a script in another terminal for instance). You could execute : let @+=@% to do that. Let is uesd to write to a register and "+ is the clipboard register, so we are copying the current file path to the clipboard.

": is the most recently executed commmand. If you save the current buffer with :w "w" will be in the register. A good way to use it with @:, to execute this command in one line :s/foo/bar, you can just go another line and execute @: to run this substitution again.

"# is the name of the alternate file, tht you can think of it as the last edited file (it's a bit more complex than that, go to :h alternate-file if you want to understand it better. It's what vim uses to switch between files when you use `ctrl-^`, and you could do the same thing with :e `ctrl-r`. I rarely use this, but hopefully you are more creative that I am.

###  The expression and the Search registers.

The expression register ("=) is used to deal with results of expression. This is easier to understand with an example. If , in insert mode, you type ctrl-r =, you will see a '=' sign in the command line. Then if type 2+2 <enter> 4 will be printed. This can be used to execute all sort of expressions, even calling external commands. To give another example, if you type ctrl-r = and then, in the command line , system('ls') <enter> , the output of ls comand will be pasted in your buffer.

The search register , as you may have imagined , is where the latest text that you searched with /, ?, * or # is. If fo example you just searched /edwin and now you want to replace it with something else, there is no way you are going to type /edwin again, just do `:%s/<ctrl-r/>/mustache/g` and you are good to go.

### Macros

You may already be familiar with vim's macros. It's a way to record a set of action tht can be executed multiple times (:h recording) if you need more information. What you probabli didn't know is that vim uses a register to store these actions, so if you use qw to record a macro, the register "w will have all the things that you id, it's all just plain text.

The cool thing about this is that, as it is just a normal register, you can manipulate it as you want. How many times have you forgetten that step in the middle of a macro recording and had to do it all over again? well,fixing that is as simple as editing a register.

For example , if you forgot to add a semicolon in the end of that w macro, just do something like :let @W='i;'.

Notice that W is Upcased? that's just how we append a value to a register, Using its upcased name, so here we just appending the command i; to the register, to enter insert mode (i) add a semicolon.
if you need to edit something in the middle of the register just do :let @w='<ctrl-r w>, change what you want and close the quote in the end. Done, no more recording a macro 10 times before you get it right.

Another cool thing about this is that, as it's just plain text in a register, you can easily move macros around, applying it in other vim instance, or sharing it with someone else. Think about it,if you have that register in your clipboard, you can just execute it with @+("+ is the clipboard register.)

### Wrapping up

Understading how register works is quite simple, and although you are not goind to ues them every 5 minutes, it certainly will avoid some annoyances, like losing a yanked text, or having to record a macro again.

-     0: Moves to the first character of a line
- ^: Moves to the first non-blank character of a line
- \$: Moves to the end of a line
- g\_: Moves to the non-blank character at the end of a line

All of these are quite hard to type so try remmapping instead.

    			" H to move to the first character in a line
    			noremap H ^
    			" L to move to the last character in a line
    			noremap L g_

## Moving Vertically

- l { jumps entire paragraphs downwards
-     }  similarly but upwards.

These two have a couple of disadvantages:

1. They are hard to type.
2. Moving down a paragraph of code can be unpredictable (it depends on the whitespace)
   A better way to move vertically is to scroll up and down by half a page:

3. C-D let’s you move down half a page
4. C-U let’s you move up half a page

## Hign Precision Motions with Search Pattern

To _move vertically even faster_ when you have a target in mind, you best opiton ist to search withe the _/{pattern}_ and _? {pattern}_

- Use /{pattern } to search forward inside a file.
- Use ?{pattern} to search backwords

When you find what you want, type <Enter> and your cursor will jump to the first match in the search. _You can think of n as repeating a search_.

Vim loves saving you time: At any time, you can type **/<Enter>** or **?<Enter>** to run the last search (forwards or backwards). Use \* to do a search for the word under the cursor.

### Moving Faster with Counts

Counts are numbers which can be prefixed to a command to multiply the effect ot that command. For instance, _2w_ allows us to move the cursor 2 words forward. Use **{count}motion** to multiply a motion **{count}times.**.

A great way to move verticall is to take advantage of counts in combination with h and e. One

    				" Move down file lines
    				noremap J 5j
    				vnoremap J 5j
    				" Move up file lines
    				noremap K 5k
    				vnoremap K 5k

### More tips

- gg to go to the top of the file.
- {line}gg to go to a specific line.
- G do go to the end of the file.
- % jump to matching ([{}])

  ### The Wizard logs -Part 2- The Adventures glory and misfortunes of writing wizards use vim

## Learning To Use Vim’s Help

Vim’s help is truly amazing. Type :h {keyword} and vim will do its best to fulfill your wishes and find the help you need. The {keyword} itself can be a command, a key combination or just an action that you want to learn more about:

1. Want to know how the :global command works? Then try :h :global.
2. Want to know what the daw key combo does? Test :h daw.
3. Want to know about motions in vim? Then try :h motions.
4. Want to learn how to quit vim? Yes. You guessed it. Go :h quit
5. Want to learn what CTRL-W does in insert mode? Try :h i_CTRL-W

Vim’s help is great for precision lightning attacks of curiosity and/or need, like the ones above, but it is also great to peruse and read like a book. Type :h or :help and you’ll be taken to the help’s index which starts with help… about :help:

This help document contains a couple of nice tricks that will help you navigate Vim’s help faster:

- <C-]> to follow a link (they’re highlighted)
- Use /{pattern} to search within a document. (That’s how you normally search for things in Vim by the way.)
- <C-O> to go back
- The help appears in a normal split window so when you’re done with it you can just close it with the :quit command just like any other window

One thing that is really cool is that **Vim’s third party plugins also appear in the help.** Just installed a popular plugin and don’t quite know how it works? Then try **:h {nameOfPlugin}.** If you’re not sure about the name of the plugin’s docs, check at the bottom of :help where third party plugins appear listed:

### Exercise Apprentice of vim!

Let’s do some exercises to coalesce what you’ve learned in this chapter. First, if you haven’t done it yet, I’ll have to insist:

1. **Run the vimtutor.** If you chose Neovim type **:Tutor.** If you ignored my recommendations and opted for Vim type vimtutor in your terminal.

Then, start exploring The Oracle of Vimness:

1. Use Vim’s help. Open Vim and type **:help.** Read the super brief help about Vim’s help. Then try to find the introduction to the user manual and open that page.

2. Use Vim’s help to find more about vim-tutor-mode. (Hint: :h vim-tutor-mode)
3. Use Vim’s help to find more about **:checkhealth. (Hint: :h health)**
4. Use Vim’s help to find the skim over the differences between Vim and Neovim. (Hint: **:h vim_diff**)

## Vim Text Objects: The Definitie Guide

To edit efficiently in vim you have to edit beyond in individual characters. Instead  edit by word, sentence and paragraph. In vim,  these higher level contexts are called **text object**. Vim provides text objects for both plaintext and common programming language constructs.  

You can also define new text object using vim script. Learning these text objects can take your editing to a whole new level of precison and speed.

### Structures of an editing command.

In vim, editing command have the following structure;

                       <number><command><text object or motion>

The number is used to perform the command over multiple text object or motions. e.g backward three words, forward two paragraphs. The number is optional and can appear either before or after the command . The command is an operation, e.g change , delete (cut), or yank  (copy). The command is also optional ; but without it you only have a motion command, not an edit command. The `text object` or `motion` can either be a text construct, e.g a word , a sentence, a paragraph, or a motion, e.g forward a line, bace one page, end of the line. An **editing command** is a command plus a text object or motion. ie

 1. Delete this word.
 2. Change the next sentence.
 3.  Copy this paragraph.

 ### Plaintext Text Objects

Vim provides text objects for the three buildings blocks of plaintext: words, sentences and paragraphs.

## WORDS.

 * aw - a word (includs surrounding white space)
 * iw - inner word (does not include surround

 Lorem consectetur adipisicing elit. Illo dolorem provident deserunt praesentium 

 Text objects beginning with a include the surrounding white space in the text object, those starting with i do not. This convention is followed by all text object aw. The difference is in the allowed cursor position. A delete a word using dw the cursor must be at the start of the word, any other position would delete only part of the word.

####  Sentences

* as - a sentence
* is - inner sentence

Try with this sentense.
Lorem ipsum dolor sit amet consectetur adipisicing elit.     Accusantium aliquid,
 sequi quis temporibus recusandae porro, vel vitae modi dolore ducimus tenetur sint. 
 Reiciendis magni pariatur quibusdam placeat? Exercitationem, error quidem.

 Notice how the "inner" text object does not include the trailing white space. Like aw , as offers the same curso position advantage over its motion cunterparts (    ), forward and backword a sentence.

 To operate on the entire previous sentence (requires the cursor to be at the end of the sentence; to  operate on the entire next sentence) requires your cursor to be at the start of the sentence.
 
 #### Paragraph

 * ap - a paragraph.
 *  ip - inner paragraph.

Use the paragraphs below.

Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium aliquid, sequi quis temporibus recusandae porro, vel vitae modi dolore ducimus tenetur sint. Reiciendis magni pariatur quibusdam placeat? Exercitationem, error quidem.

Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium aliquid, sequi quis temporibus recusandae porro, vel vitae modi dolore ducimus tenetur sint. Reiciendis magni pariatur quibusdam placeat? Exercitationem, error quidem.

Again `ap` and `ip` provides the same cursor positon advantage that vim's sentence and word text objects provides. Your cursor can be anywhere within the paragraph in order to operate on it.

#### Motion Commands VS Text Objects Commands

A command using a motion, e.g cw , operates from the current cursor positon. A command using a text object, e.g ciw operates on the whole object regardless of the cursor position. It saves you the time and effort of moving the cursor into the "right" position.

#### Programming language Text objects.

Vim provides several text object based on common programing language constructs.

## Strings

* a"  - a double quoted string
* i" - inner double quoted string.
* a' - a single quoted string
* i' -inner single quoted string.
* a' - a back quoted string


Lorem (hellow edwin) adipisicing elit. Accusantium aliquid, sequi quis temporibus recusandae porro, vel vitae modi dolore ducimus tenetur sint. Reiciendis magni pariatur quibusdam placeat? Exercitationem, error quidem.

ci'

puts 'Hello "world"'

### Parentheses 

* a) - a parenthesized block
* i) -  inner parentesized block

 Project.all(:conditions => {:published => true})

