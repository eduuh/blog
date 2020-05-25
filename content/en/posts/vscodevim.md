---
title: "Vscodevim"
date: 2020-04-03T20:36:34+03:00
draft: false
---

# Introduction

**Visual Studio code** is superb. If offers unparalleled user experience with great support for many languages and development ecosystems. It comes with great defaults and is super easy to use and to get started with.

---

**Vim is awesome**. Its modal nature and text editing features makes it unique amongst other editors. Vim offers a complete different level of text editing proficiency, speed and accuracy from anything else out there.

The combination of both couldn't be anything less than **amazingly superbsome** (yep, I just did that)

You will boost your visual studio editing skills incredibly. By combining the strengths of vim and visual studio code, you will be able to make the interface between your brain and the computer ever so thin, making your thoughts seamlessly materialize into code.

Here si what we're going to cover in this post.

1. What is vim ? And why use Vim in VSCode?
2. Basic Surviving vim in Vscode?
3. Moving Blazingly Fast with Core vim Motions.
4. Editing at the Speed of thought with vim operators and motions.
5. Vim's secret language.
6. Inserting text In vim.
7. Selecting Text in visual mode.
8. Copy and Pasting Taking **advantage** of Registers.
9. Surrounding things with vim surround.
10. Moving Even faster with the Sneak and EasyMotion Plugins.
11. Creating custom shortcuts to make you more effective.
12. Creating Reusable Editing Units with Macros.
13. Integrating Vscode with Neovim for Maximu Awesomeness.

At the end of this book you'll be capable of fine grained text manipulation and powerful text transformations that were previously unreachable to you. And over time , and as you **practice and get comfortable with different vim commands**, you will become faster and more proficient at editing than you were ever before.

**I will not assume any prior vim knowledge** so don't worry
if you aren't familiar with vim.

## What is ViM?

**Vi** is an ancient text editor. Old even befor the first age of the world. It was designed to work on contraptions called terminals with the very uncommon yet inspired characteristic of funtioning in a modal fashion. That is, it has a mode for **inserting text** another **for editing text** a different one for selecting text, and you get the gist.

Vi's latest and most celebrated incarnation is **Vim**(VI improved and formarly VI Imitation) which works both with text and graphical interfaces, comes with a plethora of improvements over vi and is supported on every platform known to humankind.

But the impact of vim doesn't stop wit vim, **VIM's ideas are so very remarkable that they have transcended the vim editor itself and propagated into other editors**. Today you can find **vim like modes** in almost any editor and ide that you can imagine. Like, appropriately, in **Visual Studio Code**.

### WHY VIM? IsN't Visual Studio Enough?

**Why should you care about learning about an ancient editor in this day and age?** Does it really make such a big difference to my visual studio code setup?

The truth is that vim Provides a different way of interating with text. A way that gives you **a completely different level of control and fluncy when editing code**

At the hands of an experienced user, editing text with vim **seems like magic**

- vim makes you faster.
- vim makes you more precise.
- vim unlocks a completely different level of control in text editing.
- vim thins the interface between your brain and the computer.
- It is awe-striking to behold when doing presentations.

Awesome! That sounds very good and all that .. but how can vim achieve all this? **The answer is modes.**

Vim's modal nature empowers your keyboard to control every aspect of your editor. Every modes is a clean slate that gives your keyboard new powers, to edit text at lightning speed, navigate at the speed of thought, select and move text to your heart's content, and more.

With vim , you're no longer limited to inserting text nor subject to the tyranny of the mouse to click, navigate or select text. No after using vim for a while, **you'll be like a code surgeon** that makes expert incisions with surgical presion whenever and wherever it is required, navigating through your code and codebase with the lightning speed and accuracy of a **entirely keyboard driven workflow.**

So **Why would you want to learn vim in this day and age?**

Vim is **For programmers who want to raise their game**. in the hands of an expert, **Vim shreds text at the speed of thought.**

## Why vim in Vscode and not Just ViM?

You may be wondering .. ok. If vim is so good then.. Why not just use Vim instead of vim inside Visual Studio code?

Great Question! The truth is that setting vim to work with a feature set similary to modern text editors is not a trivial task. Features like **code completion**, **code navigation**, **in-editor error messages** , etc, althoudh supported by vim don't work perfectly out of the box.

Visual Studio code and vim together offer a very sweet spot that balance the ease of setup and super rich development user experience of visual studio code with lots of amazing features present in vim.

The translation is not yet perfect thoudh. And if you're an expericed vim user you may find some features missing.But all in all, **Vscodevim** offers a very pleasant vim experience outside of vim.

### A brief not about the conventions Used here.

Since alot of what happens in vim depends on the location of your cursor, I've used a series of diagrams that shows the position of the cursor changing over time as you type commands. And since it is quite unconventional from other programming material. I think yo'll find it helpful to have it explained so you're prepared before you encounter it for the first time.

![ilustration png](/images/vscodevim/illustations.png)

That means the following:

![illustration explaination](/images/vscodevim/illustrationexplain.png)

so:

- The text **word. is two words** is the text that is inside your editor which is subject to change or navigation.
- You type thec command **W** succesively (in this case 4 times)
- Every time you type the command, you move the cursor (represented by **V**) to a new location.

At times, it will be helpful to compare how two commands perform when applied to the same bit of text. In those cases I've used the following diagrams:

![illustrations](/images/vscodevim/explainations.png)

Where the bottom part is similar in meaning to the top part we discussed earlier but for the fact that the cursor is represented by a **^** instead of **V**

when explaining commands we'll pay heed to the following conventions. For operations and motions

![moreillustartions](/images/vscodevim/moreillustrations.png)

Whe constructing and applly text objects:

![textobjects](/images/vscodevim/textobject.png)

An ex-commands

![excommand](/images/vscodevim/excommand.png)

## Installing Vim Inside Visual Studio Code.

In order to bring the awesomeness of vim inside visual studio code you'll need to install the **VscodeVim plugin**:

1. Open Visual Studio code
2. Go to _Extensions_
3. Type _Vim_ in the search box.
4. The first plugin named _VIM_ is the one you want (VSCodeVim).
5. click on the install button.
6. Epic victory!

![vscode vim](/images/vscodevim/vimscreenshot.png)

After **Visual Studio Code** finishes installing the extension,you need to restart it for the changes to take effect. **latest-vscode**

Have you restarted it?

Excellent! Open a code file from your latest project and look at the cursor. Does it look like a rectangle? Yes?

Then, **Welcome to Vim!!**

## Are you using the VSCODE command Palette?

If you aren't you definitely should. Type **CMD-SHIFT-P** on windows and linux and you'll be brought to the command palette. From here you can access almost any functionality within Visual Studio code by just typing.

For instance, type **extensions** and select **Show Extensions** to go the extensions tab. Awesome right? Type around and see if you can find things you typically use in your daily workflow.

Mastering shortcuts like **ctrl-shift-p** to open the command palette, or like **ctrl-p** to go to a file are essential is developing a keyboard centric workflow and enhancing your productivity in visual studio code. So learn them, and use them.

### Baby Step in Vim

**Rectangle Shaped cursor**.. Curious! If you try to type right now you will be surprised to see that notheng happens. Or to be more precise, nothing that you would have expected to happen, happens.

As you type on the keyboard, there are no characters being reflexted on the screen. In fact , it is likey that in your typing, you'll stumble upon some special meaning command that will either send your cursor flying around the screen or even delete or edit some code.

All of this weird and unexpected behaviour is the result of **Nornal mode**, the default mode in which you intercat with code in vim. And in, _normal mode_ one does not insert text.

so what is _Normal Mode?_ and , moreover, \*\*What does mode even mean?

## Modes in Vim

Modes are on of the most important and impactful design decisions in vim, so it pays off to spend a little bit of time to really understand what modes mean and how they affect the vim developer experiece.

Vim modes follow the same principle of **wearing the right hat** for the right situation. Depending on the tast at hand, you may (figuratively) wear the right hat best adapt your way of thinking, behavior and mindset to that situation. For instance, if you wear an explorer cap that bring forth you exploratory mindset.

Vim editor has different modes that best adapt to fulfilling different tasks. For example, these are three of the most common modes in vim:

Modal Editing.
| modes | Action |
|-----------------|---------------------------------------|
| Insert Mode | Type text and Stuff |
| Normal Mode | Edit text and Navigate |
| Visual Mode | Select Text and Edit it |

Just like wearing the right hat, when using vim you'll use the **insert mode** when your goal is to insert text. you'll use _Normal mode_ when your goal is to edit text or navigate through your codebase, and you'll use **visual mode** when you want to select some text.

![modal editing](/image/vscodevim/modalediting.png)

- In _Insert mode_ you will **type** the letter w, just like in any other editor.
- In _Normal mode_ you'll **move** the cursor to the beginning of the next word.
- In _Visual mode_ you will **Select** text up until and including the beginning of the next word.

So what do we gain from Vim being a modal editor?

Thanks to the existence of modes, the keyboard becomes a blank slate in every different one of them. Which means that vim is free to entirely adapt the keyboard to be the most effective to perform the task at hand, having your desired functionality right at your fingertips.

yes. You are in **Normal Mode**. In this mode you don't insert text. Instead you move around and edit it. This design decision stem from the realiztion that **we spend far more time reading, navigating and changing code that we do inserting it in the first place**

### Normal Mode

So **Normal mode** can feel like a hostile place at first, as typing any key can and will result in unexpected behaviour. So it helps to come into **Normal mode** with a little preparation. These are the very basics you need to survive and start buiding your vim skills:

- **Move around** with the hjkl keys.
- **Go into Insert mode** with i where you can type stuff as usual.
- **Go back to Normal mode** with <ESC>, <CTRL-C> or <CTRL-[>

## The Most Basic of Vim MOTIONS

**hnei are the core and most basic motions in vim**. They allow you to move the cursor by one space in every direction:

They are not the most effective, nor the most efficient way to move around in vim.But they do **give you agility and confidence** to move around a file in _normal mode._ Leaning to walk, or learning to ride a bike.

After you get comfortable with more vim motions you won't use **hjkl** as much, but they'll come **very handy for short-distance movements and small corrections**.

### From Normal Mode to Insert mode and Back

The **l** lets you go into **insert mode** after the cursor. **Af the beginnign of your journey into vim, you can see l as a escape hatch into sanity**.

## Mapping your Caps Lock key to control

One thing that comefs super handy when using vim (and any other editor for that matter) is to remap your caps lock key ot control.

Doing this means that you can easily reach a very commonly used key in programming such as **Control** form the confort of the home row. You just need to stretch that pinky finger out to the left half a centimeter and you're there.

Checkout my [remaping for control to a smartkey](mappingcapstoctrlandescape.md) to function as control key when pressed together with a second key and as escape when pressed alone.

### An Important note for Windows and Linux users.

Wait **<CTRL-C>** to get back to **Normal mode**? isn't that what i've been using all my life to copy stuff???

Installing VScodeVim has a couple of side-effects. One is that
you get that weird squarish thingie cursor we have just discussed, and the other is that some commonly used keys are remapped to their natural funciton in the land of vim.

- <CTRl-C> no longer copies, and instead it sends you back to **normal mode**. The command that we use in vim for copying is far less verbose : y(for yank).
- <CTRL-V> no longer pastes and insteads sends you into **visual block mode.** Again the command we ues in vim for pasting in less verbose: just a single **P** (for paste).
- <CTRL-F> no longer lets you search, and instead it allows you to scroll your screen one page forward. Once more, the command we use in Vim for searching is closer to your fingertips:/{term-i-am-searching-for}.

depending on how adventurous you are and your tolerance for discomfort, you may want to keep your keys as they are right now rather than continuing with the changes done by vim. If you feel like you want to disable these remappings for the time being, you can use these two VSCodeVim configurations:

- **vim.useCtrlKeys** enables and disables the remapping of CTRL keys . Sef it to **false** and the keys for copy, pasting find, etc will revert back to vscode default. Set it **true** and vim will take over.
- vim.handlekeys gitev you a more granular control as to which mappings you can enable or disable. It is a dictionary or key/value pairs, where the keys is the key combination you want to enable/disable and the value is a boolearn flag that represent whether vim is enabled for htat key comination or not .

## Summary

When you install VSCodeVim your VSCode editor will become a slightly stranger place. Vim relies on modes to make you more effective and the default mode in vim in ** Normal mode** a mode where you don't type text on the screen.

**Normal Mode** is optimized for text editing and navigating your codebase. We often spend more time editing and exploring code that we do inserting it from scratch, so that's an ingenious desigh decision. Still, it can feel quite daunting at first, so it's helpful to know some of the keys you can use to get a basic level of autonomy.

. Use hnei to move around.
. Use l to go back to _insert mode_ where you can act as-if you're in vanila VScode and type away.
. Use <ESC>, <CTRL-c> or <CTRL-[> to go back to Normal mode.

## Moving Blazingly Fast With Thec Core Vim Motions.

\*\*Motions (as in movements) are how you move around in vim. they are commands that when typed move the cursor around with high speend and precision. there are many of them, and each one is best suited for different types and lengths of movements.

### Move Horizontally Word by Word

**Word motions** let you jump from word to word in either directions from left to right or right to left). As such, they allow you to move faster than the basic horizontal motions **h** and **l**.

You can use the **w**(word) command to jump to the beginning of the next word like so:

Likewise , you can:

- Use _b_ (back) to jump to the beginining of word backwords.
- use _e_ (end) to jump to the end of a word.
- Use _ge_ to jump to the end of word backwords.

#### Learn Commands with the help of mnemonics.

Vim has a humongous amount of commands. In time, when you become an experienced vim user, the command will become second natuer, reflexive and automatic. At the beginning though, youll need to learn them one by one.

A great way to learn vim commands is by usind mnemonics like associating a letter to a word that is easier to remember. For instance, you can remember that **w** lets you move from word to word by associating it with **Word**, or that _b_ lets you move word to word backwords by associating it with **back**.

## Words and Words

So **w**, **b**, **e** and ge let you move word by word in vim. But what is a word exactly? A word in vim is either.

1. A sequence of letters, digits and numbers.
2. A sequence of other non-blank characters.

![words](/images/vscodevim/words.png)

But **Vim** also has the concept of special kinds of words (with letters, digits and numbers) that also include special characters like **. , () {}**. They are called **WORDs** in vim jargon:

![words motions](/images/vscodevim/wordsmotion.jpg)

**WORDs** are particularly helpful to us programmers because code often has a lot of them.

![word examples](/images/vscodevim/wordmovements.png)

If you want to move **WORD by WORD** you can use the capitalized equivalents of the motions described earlier **B,E,gE).**

In general, **Word motions allow for more precise changes while **WORD** motions allow for faster movements**

     wwww ==> v   v v   v   v
              word. are two words
              word. is one WORD
     WWW  ==> ^     ^  ^   ^

### Move to A specific Character

**Find character motions** let you move horizontally quickly and with **high precision**.

1. Use **f{character}**(find) to move to the next occurrence of a character in a line. For instance, **f"** sends you to the next occurrence of a double quote.
2. If your target is behing the cursor you can use \*F{chacter} to fing the previous occurrence of a character.

### Moving Horizontally

![moving horizontally](/images/vscodevim/vim-motions-find.jpg)

We can clearly see how **f** is faster and more precise than usind word motions by pitching one against the other in an example:

    f(   ==> v                        v
             const fireball = function(target){
    			wwww ==> ^     ^        ^ ^

in addition to **f** vim also offers the t(until) command:
. Use t{character} to move the cursor just before the next occurence of a character (think of \*t{character}**) of moving your cursor until that character.
. Again, you can use **T{character}\*\* to do the same as t{character} but backwords.

If the different between the **f** and **t** command isn't quite clear yet, here's an example that compares both of them.

    					t(   ==> v                       v
    														const fireball = function(target){
    					f(   ==> ^

**t** is really useful when you combint motions with operators to perform text changes as you'll soon discover(for instance, you could delete evelything until ( and change it for something else.)

After using **f{character}** you can type **;** to go to the next occurrence of the character of **,** to go to the previous one.

**You can see that ; and , as commands for repeating the last character search**. This is nice because it saves you from typing the same search over and over again.

    			fdfdfd ==> v   v               v        v
    														let damage = weapon.damage * d20();
    														let damage = weapon.damage * d20();
    			fd;;   ==> v   v

### On Notes , Melodies and Chords.

Vim is quite special. If you have used other editors you're probably accustomed to typing chords of keys that is, typing a combinataion of keys at the same time.

For instance, **Ctrl-c** to copy and **ctrl-v** to paste. Although vim is no stranger to chords, it relies even more on melodies of keys.

**A melody** is a series of notes played one after the other. If you think of keys as notes, then melodies of keys are keys that are pressed one after the other in rapid successsion. So, when you read that you need to type **f{character}** to find a character in a line, it means that first you type **f**, and then you type the character {character}. These two keys are , thus played as a melody

Using melodies of keys is the most common way in which you interact with vim. And, althoudh unfamiliar and kind of stande, it is vey conveniet because controlling the editor suddenly feels like you're just typing text. It is also marvellous for your wrists health because you no longer need to rely of complex and unnatural key combintations that strain ou poor joints[^joint].

### Move horizontally extremely

To **Move extremely horizontally** use:

1. **0**: Moves to the **first character of a line**
2. **^**: Moves to the **first non-blank character of line**
3. **\$** Moves to the **end of a line**
4. **g\_**: Moves to the **non-blank character at the end of a line**

### Moving Vertically

Starting from **k** and **j** we move on to a **faster way of maneuvering vertically with:**

- **}** jumps entire paragraphs downwards.
- **{** similaryl but upwards.
- **CTRL-d** lets you move down half a page by scrolling the page.
- **ctrl-u** lets you **move up half a page** also by scrolling .

None of tese are my favorites but they'll do for the time being. In the custom mappings chapter, you'll learn how to create a custom key binding for the ultimate mid-range vertical motion.

### HIGH Precision Vertical Motions with Search Pattern.

To move verticall even faster when you have a target in ming, your best option is to search fro that target with the \*\*/{pattern} and ?{pattern} commands:

- Use **/{pattern}** to **search forward** inside a file.
- Us **?{pattern}** to **search backwords**.

Where the **{pattern}** fragment will often be a string literal (the name of a method, class or variable) but can also be regular expression.

When you start typing the search pattern, **text within a file that matches your pattern is highlighted** As you continue typing te pattern, the highlighted areas will be updated and reflect the new matches. When you find what you are looking for, type <Enter> and your cursor will jump to the first match in the document. There you can perform some editing if you watn and later use **n** to jump to the next match (or **N** for the previous one). **you can thike of n as repeating a search**.

> ### Enabling highlighted search

For some reason unbeknownst to me, highlighted search isn't enabled by default in **vscodevim**. To remedy that, go to **preferences** and enable the vim:hlsearch option (or, alternatively, use vim.hlsearch) in the json version of the configuration).

Vim loves saving you time: Type **/<Enter> or ?<Enter>** anytime to run the last search (forwards or backwords.). Or use \* to do a search for the word under the cursor **(#** to do the same backwords.

### Moving faster with Counts

**Counts are numbers which let you multiply the effect of a command**. You can use them by prefixing any command with a count like so:

     {count}{command}

for instance

- 2w allows us to move the cursor 3 words forward.
- 5j changes your curso position to 5 lines below.
- 3; lets you go to the next third occurrence of a character.
- 2/baby sends you flying to the second occurrence of **baby** in a document.

In general, use \*\*{count}{motion} to multiply a motion {count} times.

### Relative line numbers

A great way to move vertically within **vim** is by using counts in combinations with the **j** and **k** motions. But sometimes it can be hard to know how many lines you need to jump to get to the desired position. That's where **relative line numbers** can come in quite handy.

\*\*Relative line numbers show line numbers in relation to your current line: if the current line is where your cursor is resting, the line below would have line number 1, the next one lne number 3, and so on. Using relative line numbers, it is very straightforward to see how many lines you need to jump to get to where you want to go.

You can enable relative line numbers in your **vscode** configuration by going to **preferences** (Remember! Use the command pallette with Ctrl-shift-p or ctrl+shift-p), searching for the \_line number configuration and setting it to **relative**.

### Moving Sematically

In addition to the previous motions which don't really take into account the meaning of your code, Vim offers additional binding that take your code sematics into considerations:

- Use **gd** to jump to definition of whatever is under your curson.
- Use **gf** to jump to a file in an import.

## And Some More Nifty core motions

These are yet more motions that can come in hangy from time to time:

- Type **gg** to go to the top of the file.
- Use **{line}gg** to go to a specific line.
- Use **G** to go to the end of the file.
- Type **%** jump to matching ({[]})

### Summary

Motions are commands that lets you move around in vim with high speed and precision. They are composed of one of more keys typed as **Melodies**. They let you perform different types of movements with various lengths and degree of .

Find character and search motions have repeaters (n,;) that let us repeat the last search by typing just one character. We can use them to jump from match to match in eithe direction very quickly.**Train yourself to rely on repaters,and you'll become the more effective for it.**

**You can combine counts with motions for greater effect**.Our brains are slow at countiong so you should **limit the use of counts only to short jumps.** When using counts with vertical motions it is nice to enable **relative numbers** becaues they give you a clear reference to your target. **Consider enabling relative number if you haven't already**.

Now let's move onto another foundational block in vim that will allow you to edit text like if by art of magic. **Operators**.

1. This is great if you've experienced carpal tunnel syndrome or other wrist joint problems. Also do yourself a favor and get a nice ergonomic keyboard. You're in this for the long haul.

### Editing Like magic With vim Operators.

Motions aren't just for moving. They can be used in comination with a series of commands called operators to edit your code at the speed of lightning.

You can use operators and motions together by following any of these patterns:

{operator}{count}{motion}
{count}{operator}{motion}

![vim operator](/images/vscodevim/vim-operators.jpg)

- The **operator** determines which action you want to perform: _deleting, changing, yanking, formatting, etc_.
- The **count** allows you to multiply the effect of an operator by performing on action a count number of times.
- The **motion** represent the piece of text to which to apply the action defined by the operator.

For instance the **d2w** combinations allows you to **delete two words**.

![vim-operators-d2w.jpg](/images/vscodevim/vim-operators-d2w.jpg)

**d** corresponds to the **delete** operator. Since **d** is an operator, you can follw the **{operator}{count}{motion}** formula and combine it with all the motions you've learned thus far:

- Use **d5j** to delete 5 lines downwords.
- Type **df'** to delete everything in the current line from the cursor until the first occurrences of the **'** character.
- Or type **dt'** to do like the above example but excluding the character (so up until or just before the **'** character)
- Or type **dt'** to do like the above example but excluding the character (so up until or just before the _'_ character).
- Use **d/hello** to delete everything until the first occurrences of **hello**
- Type **ggdG** to delete a complete document.

** Useful Operators**

![vim-operators-commands.jpg](/images/vscodevim/vim-operators-commands.jpg)

In addition to **d**, there's a handful more of handy operators:

- **c**(change): Change deletes a piece of text and then sends you into **Insert mode** so that you can continue typing, changing the original text into something else. The change operator is like the d and i commands commabined into one. this duality makes it the most useful operator.

- **y**(yank): copy in vim jargon.
- **p**(put): Paste in Vim jargon.
- **g~** (swithc case): changes letters from lowercase to upppercas and back. Alternatively, use **gu** to make something lowercase and **gU** to make something uppercase.

- \*_>_(shift right): Adds indentations
- **<** (shift left): Removes indentation
- **=** (format code): formats code.

you can use these operators much like you used **delete** so that:

- **c/hello** change everything until the first occurences of hello.
- **ggyG** copies a whole document
- \*_gUw_ capitalizes a word.

### Operator shorthand Syntax

All these operators provide additional shorthand syntax aimed at saving you typing and inceasing your speed with common editing tasks:

- double an operator to make it operate on a whole line:\* dd delets a whole line, **c** changes a whole line, etc.
- Capitalize an operator to have it perform a stronger(or altenate) version of the behaviour.
  - _D_ delets form the cursor to the end of line,
  - _C_ changes to the end of a line.
  - _Y_ line **yy** copies a complete line,
  - _P_ pastes something before the cursor.

### Noticed How command KEYS make a lot of sense?

Operators, motions and other commands in vim are generally easy to learn becaues they make sense and are easy to guess. Want to change something? You probably want to use the c(change) operator. Want to move word by word? Try **w(word)**. Want to delete something? Try the _d(delete)_ operator and so on.

Operators really shine when we combine them with a special class of motions called **text-object**.

### TAking Editing up a Notch With Text Objects.

Text object are structured piece of text or, if you will, the entities of a doucment domain model. What is a document composed of? Words, sentences, quoted text ,paragraphs, blocks, (HTML) tags,**These are text objects**

The way that you specify a text object within a command is by combining the letter **a** (a text object plus whitespace) or **i**(inner object without whitespace) with a character that represents a text object itself:

### Text Objects

![vim-text-objects.jpg](/images/vscodevim/vim-text-objects.jpg)

    {operator}{a|i}{text-object}

The built-in text-objects are:

![vim-text-objects-commands.jpg](/images/vscodevim/vim-text-objects-commands.jpg).

**Combining text object with operators is extremely powerful** and you'll find yourself relying on them very frequenty. Stuff like **cit**, **ci"** and **cib** is just brilliant.

Let's say that we want to change the contents of this string elow for something else:

     const salute = 'Hi!'

you type ci'I salute you oh Mighty Warrior!<esc> and it becomes

     const salute = 'I salute you oh Mighty Warrior'

just like that. You don't need to go grab the mouse, select thex text and then write something else. You type three letters and Boom! you're done.

## Noticed How Most vim Keys are Placed Near Youw Fingers?

The fact that vim has modes allows keys near the home row to be reused in each separade mode. This design decision minimizes the need for slow and contorted key combinations, and heightens your speed and the longevity of your fingers and wrist. **This is awesome!**

### Repeating the last change with the dot Operator.

Vim has yef another trick in store for you aimed at saving more keystrokes: The magic . (dot) command.

![vim-dot-command.jpg](/images/vscodevim/vim-dot-command.jpg)

The **.** command allows you to repeat the last change you mage. Imagin that you run dd to delete a line of code. And now let's say that you've warmed ut to removing code. Remoding code is good, the less code you have the less code you need to maintain. So let's remove another line of code.

How would you go about that? You could type **dd** again but even better, you could use the **.** command which is just a single keystorke.

Ok. you save one keystroke, so what (Tough crowd here I see). Well, you can use the **.** command to repeat **any type of change**, not just a single shorthang command like dd. For instance, you could change a word for Awesome like so 'cawAwesome<Enter>', and then repeat that whole command with all those keystokes by just typing a single dot. Thike of the possibilities.

The **.** command becames even more useful if you get in the habit of using **Text-Object**. Text-object are more reliable that other motions because you don't need to care as much when te cursor is positioned.Thus, commands with text objects are far more repeatable and therefore work beautifully in tandem with the . command.

### More Shorthand Text editing commands

In addition to the operators you've learned in this chapter, vim offers a series of shortcuts to operate on single character that can be useful on occassion. They are:

- x is equivalent to **dl** and deletes the character under the cursor.
- X is equivalend to **dh** and delets the character before the cursor.
- s is equivalent to **ch**, deletes the character under the curso and puts you into **insert mode**
- ~ to switch case for a single character.

As usual, all of the above support counts to operate on multiple characters at once.

### Undoing and Redoing

Sooner or later it will come a time when you will make a mistake. Admit it! You ain't perfect. Nobody is. And that is alright. You needn't worry though, because Vim has your back.

- Type **u** and you'll undo your last change.
- Type **ctrl-r** and you'll redo it.

### Summary

**Motions aren't just for moving. Used in combination with operator they let you perform operations on text with ease and amazing speed.** You apply an operator on a motion by using the kuy melody **{operator}{motion}**.

Some of the most useful and common operators are :d(delete), c (change), y yank (copy) and p for put (paste).

**When you double an operator you make it operate on a line**. You can use **dd** to delete a complete line. In a similar fashion **when you capitalize a command it performs a stronger(or alternate) version of the original command**. For example, D deletes from the cursor to the end of a line.

**Counts also work with operators**. You can multiply the effecs of an operator motion combo by using a count like this :

     {operator}{count}{motion}

**Text object are special motions that describe the parts of a documents: words, sentences, paragraphs and such.** They are incediblu useful n combination with vim operators.\*\*Using operators with text-object you can be very precise and command vim to delete a word, or change the inside of a string or code block.

Text object offers two variants: the **a**(thinke a or all) and i (think innner) that allow you to operate on a text object plus surrounding whitespace or only on the inner parts of a text object respectiverly. For example, using da\" deletes a complete quote including trailing whitespace, using di" only deletes whatever is surrounded by quotes.

**The dot command . lets you repeat the last change** and as such, it is one of the most useful repeater commands. **Operations on text-object are greate candidates for the dot operator becausee they are more repeatable.**

**A great way to take advantage of the dot command is by using it is combination with searches.** When you do that you can apply changes of successive searches with just two keystrokes: n or ; to find the next match and . to repeat the last change.

Sometimes you'll make a mistake. When that happens, **you can udo the last change with u command**. If you change your mind or undo too fas type ctrl-r to redo.

### Vim's Secret Language

As you may have noticed, all the vim operators, count and notions that you've learned make up a (programming) languate of sorts. You can think of operators as functins and count and motions as arguments, or usng an even simpler analogy.. **You can thike of operators as verbs, counts as adjectives and motions as objects.**

**The true magic of vim is composition** As you go building up this vocabulary of operators and motions you will find that you can combine them to your heart's content. Just like you would with the word of a spoken language.

so that, once you know all about the **cq**, **caw**, **ciw** , **ct.** of the world, and you go and learn how **dl** works, you'll not only be able to use dl. No. You'll instantly know that you can also combine the d operator with all the vocabulary of motions you already have at your disposal and **daw, diw,dt** untill the end of times.

![vim-secret-language-reuse.jpg](/images/vscodevim/vim-secret-language-reuse.jpg)

## This is very cool

When using vim you'll feel you are **navigating a metauniverse of text editing**, it's like programming or controlling the very mechanism of editing and writing text, If you're familiar with git and how it feels to use the git command line to work with source control, you can thinke of vim as the git of text editing.

With vim, you'll look at a piece of text and you'll no longer see just words or text, you'll see the possibliities of an infinite number of operators and motion being.

### Inserting Text Ala Vim

Before you edit a program someone needs to write it and that someone may be you. In vim, you write code in **insert mode**. You've seen little bit of insert mode when using the c command but let's dive into this mode some more.

There's two core commands that put you into insert mode:

- i for insert and
- a for append

The **i** insert command puts you in insert mode before the cursor.While the _a_ append command puts you in insert mode **after** the cursor (as if to append stuff wherever the curson
r is placed). From then on you\re in **insert mode** and vim pretty much behaves like any other editor.

Lie with many other vim commands **i** and **a** have uppercase counterpart that do _stronger_ version of inserting and appending.

- _I_ puts you in **insert mode** at the beginning of the current line whilst,
- _A_ puts you in **insert mode** at the end.

![insertmode.png](/images/vscodevim/insertmode.png)

In addition to _i_ and _a_, there are another three super useful commands that I love to use to drop into Insert mode.

1. _o_ inserts a new line below the current one and drops you Insert mode(mnemonic open a line mode).
2. _O_ insert a new line above the current one and also drops you into insert mode.
3. _gi_ puts you into insert mode at te last place you left Insert mode. This is great if you drop from insert mode by mistake and want go go back where you were and continue typing.

Ok. So let's say that you are now in Insert mode, typing away and you make a mistake (ouch!). Something like a typo. Do you go back to normal mode, fix the typo and go back into insert mode? Please no!

sometimes. Oftentimes , it is faster to just delete the incorrect letter or words and type again. There's a couple of key bingings that let you do that right from within **insert mode**

- ctrl-h lets you delete the _last character_ you typed.
- ctrl-w let you delete the _last word_ you typed.
- ctrl-u lets you delete the _last line_ you typed.

Eventually you'll want to exit insert mode and do other stuff. There are three ways to do this: <esc> , ctrly -[ , ctrl-c. Of all these, the easiest one type is _ctrl-c_ so start by using that one.

### Selecting text In Visual Mode.

_Visual Mode is the vim equivalent to selecting text with a mouse._ But instead of a using a slow mouse, you'll select your text by relying on the speedy vim motions. As you select text in _visual mode_. This visual feadback makes visual mode specially useful whenever you feel the need to be extra precise before performing an action.

![visualmode.png](/images/vscodevim/visualmode.png)

- **v** for visual mode _character-wise_. this mode lets you select text character by character.
- _V_ for visual mode _line-wise_. This other one lets you select text line by line.
- <C-V> for visual mode _block-wise_. This last mode lets you select text using rectangular blocks.

_Visual mode_ can be very helpful for copying and pasting stuff and when operating on blocks of text or code where you feel you need that extra visual feedback.

In _Normal Mode_ you first define the operator and then a motion that represents some text to which to apply that operator.

      {operator}{count}{motion}

In _Visual mode_, however , you select the text first and then you type the operator.

     {trigger visual mode}{motion}{operator}

![visualmodenormal.png](/images/vscodevim/visualmodenormal.png)

So, in order to delete the following two lines:

     lines filled with mambo jambo.
     that totally deserved to be deleted from existence.

You could either type **d2s** in Normal mode or:

1. Go to line-wise visual mode with _V_ which selects the current line.
2. Press _j_ to go down one line and thus selecting it.
3. Now you've selected both line you type _d_ and they're gone. Forever. Bye lines of text. You lived a good life.

_Visual mode is often slower that using commands directly in Noraml mode but you'll have that extra visual aid that gives you assurance that you're applying a command exactly where you want it applied_

### Switfly Operating on search Matches.

Type _n_ to repeat a search. Type _._ to repeat the last change. Use a combination of both repeat the last change. use a combination of both repeat the last change. Use a combination of both _n_ and _._ and you can apply the same change on every single search match with just two keystrokes. Two keystrokes. That's fast.

**But what if i told you there's a faster way?**

Let's say we are in the market for destroying cucumbers. We are deadly.

     cucumber carrot lettuce
     cabbage carrot lettuce cucumber
     cucumber cucumber carrot
     kale cucumber kale

A way to go about this would be to:

1. Locate the cucumber with /cucumber
2. Destroy the cucumber with daw
3. Type n to go to the next target.
4. Terminate it by repeating the last change with the . command.
5. Repeate from step 3 until all cucumbers have been terminated.
6. collect reward.

It turn out that there's an even more effective way to perform operations on search matches. _gn_ and _gN_. You can see these two motions as supercharged version of _n_ and _N_.

_gn_ works as follows:

1. If you are on top of a search match, it selects the match in **visual mode**
2. If you are in **visual mode**, it extends your current selectinon until the end of the next match.
3. (and the best part) if you are in Operator-pending mode, **it operates on the next match**.

What does this all mean? **it meant that by taking advantage of **gn** we can operate on the next match using just one keystroke.** With **gn** the . command encapsulates the meaning of **apply this change to the next match**.

### Pushing The boundaries of copying and Pasting

\*Copy and Paste\*\*. You are probably accustomed to using your mouse to select some text ,copying or cutting it, and then pasting it somewhere eles. That's it.Not so much to get excited about.

Vim makes copying cutting a tad bit more exciting by:

- giving you shiny operatory and commands you can use in combinations with all the motions you've learn thus far and by,
- Providing a handful of registers where you can save stuff for later which can enable interesting workflows and help you recover text when you delete it by mistake.

The two main commands for copying and pasting are **y** and **p**. Why use y to copy instead of _c_ , you may wonder?

### Yanking

**y** is an operator. You can combine it with any of the motions and text-objects you've learned to yank stuff to your hearts desire.

- yl yanks letter,
- yaw yanks a word
- yas yanks a sentence
- ya( yanks everyting within ( and so on..

If you double y as in yy and get a **linewise operator** like with **dd** and **cc** and yank a whole line. The _Y_ command also yanks a complete line. I prefer to use **yy** but feel free to choose whichever you want.

### Pasting

In order to paste things you use the **p** command and its variants.

- p pastes somethings after the cursor.
- gp same as p bug puts the cursor after the pasted selection.
- gP same as P and puts te cursor after the pasted selection.

Pasting in vim is kind of special and the behavior of **p** and **P** depends on whether you've yanked characters or lines. If you've yanked **characters** then pasting will put those characters after or before the cursor(no surprises there).

![yankinglines.png](/images/vscodevim/yankinglines.png)

## Multi-copying and Cutting with Registers

Registers are like a special clipboard where you can save multiple things at once. The following registers are super userful:

- The \*_unnamed register "_ is where you copy and cut stuff to. When you don't explicitly specify a register. The default register if you will.
- The **named registers a-z** are registers you can use explicitly to copy and cut text at will.
- The **yank register 0** stores the last thing you have yanked (copied).
- The **cut registers 1-9** store the last 9 things you cut by using either the delete or the change command.

The **named registers** let you save bits of text for later pasting. you can explicitly save on a register by using the followind command.

     "{name of register}y{motion}
     "{name of register}d{motion}
     "{name of register}c{motion}

For instance, **"ayas** yanks a sentence and stores it in register a . Now if you want to paste it somewhere else, you can type **"ap.**. Alternatively,using the capitalized version of register i.e A instead of a appends whatever you copy or cut into that register.

The **yank registers** lets you have access to what you copied last via the **y** command. This is helpful because delets and changes don't overwrite tis register like they do the unnamed register.

The **cut registers** give you access to the last 9 things you deleted or changed. This is great if there's some text that you deleted earlier and which you want to recover.

At any point in time, you can use the **:reg** command to see what is in your registers. Or you can type **:reg {register}** to inspect the contents of a specific register.

### Pasting in Insert Mode.

All the commands we've seen thus far operate in Normal mode, what if you want to paste something when you're in **insert mode?** Well you cat do tat as well. Using **Ctrl-r{register}** you can paste the contents of a register after the cursor:

- **ctrl-r "** pastes the contents of the unnamed register.
- **ctrl-r a** pastes the contents of register a
- **ctrl-r 0** pastes te contents of the yank register.

This being **vscode** means that you can also rely on your system copy and pastng keys to paste text in **insert mode**. That will probably be the most convenient for you in the majority of cases.

A final tip. Using insert mode to paste from a register removes the limitation of line-wise yanking and pasting. So using this method you can yank a like and then paste it just after the cursor. Now go and enjoy some real copying and pasting.

## Control vscode with Command Line Mode

Command-line mode is yep anoter mode in vim. Its defining feature is the ability to run **EX commands** (commands that start with :) and **search patterns** (which start with / and ?).

_Ex commands_ are very useful and diverse: some let you configure vim (**:colorscheme**), others allow you perform system-wide operations (like creating a new file with :edit), some others access external shell commands (:!), yet others lets you quickely edit multiple lines within a document with the wave of a hand (like **:delete**).

## Why are they called Ex commands?

Ex!? Such a strange name isn't it? they are called Ex commands because part of Vim's command line mode is based on an even more ancient line editor called Ex.

**VScodeVim** has support for only a very limited number of Ex commands but they can be greatly enhanced by integrating VScodevim with neovim.

## Typing an Ex command

A common Ex command is **:edit**. It lets you open or creating a file by typing:

     :edit {relative-path-to-files}

**Notice the : before this command?** Unlike Normal mode commands, Ex commands all start with a colon. It is typing this colon what triggers **command-line mode** and sets you up to enter a command.

**To type an Ex command you literally type : followed by te name of the command** (eg. :edit). When you type a colon and a command, the command will be displayed in the **lower-left part of the screen on the vscode status bar**

Let's try it!

createg a new file by typing:

     :edit hellow.js

You should see how, as you type a colon (:) and the name of the command, a cursor and letter materialize at the bottom of te screen inside the status bar.

when you finish typing the command and press **<Enter>**, a new fill will be created and VSCode will open it so that you can start coding. If the filename that you specify belongs to an existing file, then you'll just open that file.

### Note: :EDIT and Relative paths

When using the **:edit** command, VSCodeVim is configured to use relative paths in relation to the currently opene file. If doesn't support TAb completion so it'sm mostly useful to create new files that co-located or live near the current file you're working on.

As usual, vim always tries to save you worke and this is not different in Command-line mode: Every Ex command has a shorthand version that allows you to trigger a command with just a few letters. For instance, the shorthand version of **:edit is :e** .

## Saving and Closing Files

A couple of nifty Ex commands let you to save and close files quite rapidly:

     * Use :write (shorthand :w) to save a file
     * Use :quite (shorthand :q) to close a file

These two commands are what I like to call \*soft commands\*\*. They'll attempt to perform the action they describe but, under some conditions, they'll fail and prompt you to take further. Likewise :quit will close a file but will fail if the file have unsaved changes.

To ignore any complains and perform an action at all costs, you can combine the previous command with a !.

- Use :write! (shorthand :w!) to save a file even if it's been saved already or if it is readonly
- Use :quit! (shorthand :q!) to close a file without saving.

You can combine these commands to perform multiple actions:

- Use :wq to save and close a file.

Or apply them to all the opened files at once:

- Use **:wall** (shorthand :wq) to save all files.
- Use **qall** (shorthand :qa) to close all files.
- Use **:wqall** (shorthand :wqa) to save and close all files.
- Use **:qall!** (shorthand :qa!) to close all files without saving.

### Deleting Multiple Lines at Once

In earlier chapter you learned that vim has a bunch of operators that allow you to perform changes in text: d to delete, c to change , y to yank etc.

Vim also provides a series of Ex command that perform equivalent actions to the **normal mode** operators but with a different use case in mind: Operating on multiple line at once. These text-editing Ex commads takes the following shape:

     :[range]command[options]

Where **range** defines a range of lines to which to apply the command and options vary depending on the cmmand itself. For instance, in the case of :delete we have:

     :[range]d [register]

Where **register** represents a register in which to cut whatever it is we delete. for instance.

     :10,12d a

Delets the lines 10,11 and 12 and puts them inside the **a** register. As you can appreciate above, ranges are generally defined by their extremes: An intial line and an ending line.
Thoese extremes can, in turn , be expressed in different ways.

- Using Numbeers (e.g :10,12d) to delete line 10,11 and 12
- Using offsets (e.g :10,+2d) to delete lines 10,11 and 12
- Using the current line represented by .(e.g :.,+2d) to delet te current lne and te next two ones.
- Using % to represent the whole file (eg. **:%d**) to delete the whole file
- Using 0 to represent the beginning of the file ie \*\*:0,+10d to delete the first 10 lines
- Using $ to represent the end of te file (e.g **:.,$d\*\*) to delete the from the current line to the end of the file
- If you use **visual mode** to make a text selection and type : your command line area will be pre-populated with the following :'<,'> which is a special range that represents the current visual text selection.
  - :'<,'>d meant delete the current text selection.

Why use Ex command instead of the normal mode commands we learned in the previous sections.? Ex commands are useful because they allow you to apply a command over range of line without needing to move the cursor to that locatio first. **Whenever you need to apply a change over multiple lines, consider using ex commands**. It may be the farter approach than Normal mode.

Other Useful EX command alternatives to Normal mode commands are :yank, :put , :copy and :Move but they're not supported in Vscodevim unless we enable the integration wit neowvim.

### Repeating Ex Commands

Just like you can repeat **Normal Mode** commands with the dot operator, Ex command also have a repeater command. Type `@:` and you will repeat the last ex command, from then on you can repeat it again with `@@`.

### Substituting Text.

Another useful Ex command is `:substitute`. it allows you to substitute arbitrary bits of text for others of your choosing. The shape of this command is:

     :[range]s/{pattern}/{substitute}/{flags}

where:

- **range** defines the range in which we'll apply the substitution.
- **pattern** is a search pattern that describes the text we want to change. Like **/pattern** it supports reqular expressions.
- **substitute** is the text we want to substitute.
- **flags** let us set options that configure the substitution.

For example, the following command:

     :s/led/gold

Changes the first occurence of **led** to **gold**.
If we want to change **all occurences in the current line** then we need to add the g flag or global flag like so:

     :s/let/gold/g

And if we want to change 'all occurrences for a whole fil we just need to specify the entire file as a range with % like this:

     :%s/let/gold/g

In additions to the g flag we can use:

- **i** for case insensitive searches.
- **c** to confirm each and every substitution.

The fact that we can use regular expressions with the :s command opens the door to a lot of creative use cases. For instance, we could change the indentation level o all titles in a markdown file by using the following _ :s_ command:

     :%s/^#//

which can be translated to :

- % for the whole file
- s substitute
- ^# any # at the beginning of a line (i.e a header in markdown)
  \*// for an empty character.

### Global by default

You may want to enable the "vim substitute Globla flag" option in your VSCodeVim preferences. This will enable the **g** flag for all substitutions and save some typing.
When this option is activated the g flag changes its meanding to the opposite of what it used to be. From then on, adding it to a :s command will meand that only the first occurrence in a line will be subsituted.

## Splits , Tabs and Switching Between Them

A great feature in vim is its great support for splits and tabs. Creating, resizing, rearranging and movign between splits and tabs is incredibly easy and fast in vim. VSCodeVim offers an Ok support for this vim feauter that, although not as good as vim's, is still useful.

#### Splits

Splits are awesome, They allow you to divide your workspace into vertical and horizontal split windows:

- Use the :sp {relative-path-to-file} command to open a file in a horizontal split
- Use the :vsp {relative-path-to-file} command to open a file in a verticial split.

Alternatively, instead of these EX commands you can use:

- <ctrl-w> S to open horizontal split (window and split)
- <ctrl-w> V to open a vertical split (vertical)

Using either of these commands will open a split to the same file that you're currently editing. So after creating the split you'll need to type **ctrl-p** on windows to opn a new file in that split.

You can move btwn splits usind the **ctrl-w**+hjkl
\*Are you currently on a verticl split and want to move to the one on the right? Type **ctrl-w** then **l**(the motion you typically use to move the cursor to the right. This key combinations works even when jumping from a code window to the file explorer or and integrated terminal. **Sweet!**

### Tabs

In visual studio code you can open several tabs within a split. In order to do so:

- use :tabnew {file} to open a file in a new tab.
- Use :tabn (:tabnext) to go to the next tab.
- Use :tabp (:tabprevious) to go to the previous tab.
- Use :tabo (:tabonly) to close all other tabs.

### Still Lots of Typing? I Know!

The default command for operating and moving around split and tabs are slightly verbos and uncomfortable.

### Note

1. Vim works with tabs of splits, whereas VSCode works with split of tabs. I find the former much better to work with than the latter. Within vim a tab can denote a feature or workspace, whereas splits within a tab correspond to a related piece of functionality.

### Surrounding Things with vim Surround

VScodevim comes with a bunch of useful vim plugins built-i. One of them is **vim-surround** which enabled by default and extends vim's secret language with a new operator: surround or s.

Using the surround operator we can operate on the surroundings (quotes, parenthesis,braces, tags,etc) of swaths of text much in the same way to how we use other operators within vim.

The surround operator itself can be seen as three separate operators.

     * ds to delete the surroundings
     * cs to change the surroundings
     * ys to add surroundings

And so, like any operator in Vim you would use like this:

     ds{count}{motion}
     cs{count}{motion}
     ys{count}{motion}

For example:

- ds' to delete the surrounding ' (ds{char})
- cs'" to change surrounding ' to " (cs{old}{new})
- ysaptli> to surround a paragraph with an <li> tag (ys{motion}{char})

You can also use **vim-surround** by selecting a bit of text in visual mode and then using **S{desired character}**. This will surround your text selection with the desired character.

### Elevationg Your WorkFlow with Custom Mappings

One of the greates features in vim is its customizability. A simiple way to get started customizing vim and one that will have the greatest effect in your daily coding is **creating custom mappings**. A mapping in vim is the equivalent to a shortcut in other editor but with a strong focus on melodies of key that are so natural to vim.

### why Custom Mappings?

Cutom mapping are useful for two reasons:

1. They let you customize vim and adapt it to the way you work by creating custom mappings for things that you use often.
2. They let you priotize vim functionality by bringing it nearer to your fingertips. Using custom mappngs you can create a hierarchy of commands where the most useful one can be reached from the commodity of your home row and the less useful ones can be reached throudh comfortable, yet more length key combinations.

### Creating custom Mappings

You can create custom mappings using Visual Studio code Preferences:

1. Open the command palette with **ctrl-shift-p**.
2. Type preferences.
3. Select the preferences : Open User settings Options
4. Type **vim**

And you'l filter your visual studio code preferences to display only VSCodeVim related ones. Now you can use the following settings to add your custom mappngs in different modes:

- Normal mode key bindings Non recursive for normal mode
- Visual mode key bindinds non recursive for visual mode
- Inserat Mode key bindings Non recrusive for Insert Mode

Having different mappings for different modes makes sense because each mode is a clean slate where you can redefine mapping to perform tasks specific to tat mode. That allow you to reuse key keyboard real state in each mode and have powerful functionality near your fingertips.

Note that these settings can only e changed via a **json** version of the settings.

A custom mapping normally takes the following shape.

        {
          "vim.insertModeKeyBindingsNonRecursive": [
           {
               "before": ["j", "k"],
               "after": ["<ESC>"]
           }
          ],
        }

Where:

- **before** is the sequence of commands that you type.
- **after** is what the previous commands map to and what gets executed when you type them.

### Guidelines For Creating Custom mappings

The ability to create custom mapping gives you a lot of freedom and flexibility to define how you intercat with visual studio code. But because there's noting stopping you for doing whatever you like, you may end up shooting yourself in the foot. Here are some rules to guide you when creating you very own custom mappings and save those precious toes of yours:

- Use the leader key do define your custom mapping. the leader is a special key in vim whose purpose is to act as a namespace or gateway to user defined mappings. The leader key is assigned to the backslash key \

- If there's someting in your workflow that you use all the time, then it is OK(encouraged in fact) to overwrite a less useful default vim bindings.

- Create mapping that are easy to remember. Follw vim's tradition and rely on mnemonics.

### Customizing the Leader KeY

You can change the leader key to something easier to type than the backslash \ (I don't know you, but i hate having important keys associated to my pinky fingers).

Go to your VSCode Preferences and update the following setting:

          {
               "vim.leader":"<Space>"
          }

From now on, whenever you see a custome mapping that refers to <leader> you can translate that in you head to <space>.

## Some Good Custom Mappings

Here are some other greate example of useful mappings.

Moving up and Down Faster In Normal Mode.

Thes mappings allow ou to move up and down faster in Normal mode (althoudh they are just as useful in visual mode):

       {
          "vim.normalModeKeyBindingsNonRecursive": [
          {
               "before": ["J"],
               "after": ["5", "j"]
          },
          {
               "before": ["K"],
               "after": ["5", "k"]
          },
          ]
     }

From now on You'll be able to use:

- J to move down faster.
- K to move up faster.

This matches perfectly with vim's idea of commands in capital letter being STRONGE version of the commands in lowercase. That is, _J_ allows you to move faster than _j_ and _k_ faster than k.

Here we've overwritten two vim default bindings because browsing the code up and down is something that you'll do all the time. Whereas J (join lines), although useful, is something that you do only from time to time. **k** is used for keyword searc but isn't yet implemented in VSCodeVim.

### Keep Joining Lines

Joining lines is still useful so we're going to keep it. Although we will downgrade its importance in hieracyh by making it slightly harder to type.

Update you VSCodeVim configuration to include this new mappings:

        {
          "vim.normalModeKeyBindingsNonRecursive": [
          {
               "before": ["<Leader>", "j"],
               "after": ["J"]
          },
          ]
     }

So now on you'll be able to use.

- J to move down faster.
- k to move u faster.

## Easier Switching Between Splits

Switching split window is someting that you'll do all the time so try out these bindings:

     {
     "vim.normalModeKeyBindingsNonRecursive": [
     {
          "before": ["<C-h>"],
          "after": ["<C-w>", "h"]
     },
     {
          "before": ["<C-j>"],
          "after": ["<C-w>", "j"]
     },
     {
          "before": ["<C-k>"],
          "after": ["<C-w>", "k"]
     },
     {
          "before": ["<C-l>"],
          "after": ["<C-w>", "l"]
     }]
     }

## Easier Tab Handling

The only wat to interact with tabs in vscodevim is through commands which require you to type a colon followed by a bunch of letter.

We can do better:

{
"vim.normalModeKeyBindingsNonRecursive": [
{
"before": ["<Leader>", "t", "t"],
"commands": [":tabnew"]
},
{
"before": ["<Leader>", "t", "n"],
"commands": [":tabnext"]
},
{
"before": ["<Leader>", "t", "p"],
"commands": [":tabprev"]
},
{
"before": ["<Leader>", "t", "o"],
"commands": [":tabo"]
}]
}

Taking advangage of the <Leader> key we can now open new tabs, move round and close all tabs but the current one.

Did you notice something different about these custom mappings?

Exactly! you use a slightly different syntax when mapping keys to commands, Instead of using **before** and **after**. We use before and commands represents either the Ex commands or **visual studio native** commands that should be run whenever we type the key mapping defined by _before_.

### Cleaning Highlighted text

when you search for patterns in vim using the /{pattern} and ?{pattern} commands, the matching patterns will be highlighted. In order to remove the highlights you can use the :noh (no highlighting) command.

This is such a common task that I prefer the following mappings:

        {
          "vim.normalModeKeyBindingsNonRecursive": [
          {
               "before": ["<Leader>", "/"],
               "commands": [":noh"]
          }]
        }

Now you can type the <Space>/ and get ride of the hightlights until your next search. The mnemonic is the /which is normally used to search for pattern. So you can thike of /{pattern} as something that you do to start a search, and \*<Leader>/ as something you when you're done with a search.

    {
      "before": ["<Leader>", "/"],
      "commands": [":noh"]
    }

## Creating Custom Mappings to Vscode Actions

Yet another cool ting that you can do with VSCode is to use Vim mappings that trigger Visual Studio code native commands. For instance, the following binding:

        {
        "vim.normalModeKeyBindingsNonRecursive": [
            {
            "before": ["leader", "w"],
            "commands": [
                "workbench.action.files.save",
            ]
            }
        }

Let's you save a file using _<leader>w_ by triggering VSCode "Workbench.action.files.save" action.

The command palette and go to symbol in fier are particularly hard to type so let's create a custom mapping to keep our wrist healthy.

     {
        "vim.normalModeKeyBindingsNonRecursive": [
            {
            "before": ["<Leader>", "p"],
            "commands": [
                "workbench.action.showCommands",
            ]
            },
            {
            "before": ["<Leader>", "t"],
            "commands": [
                "workbench.action.gotoSymbol",
            ]
            }
        ]
    }

Now you no longer need to contort your fingers to open the command palette or go to symbol. Just type _<Leader>P_ and _<Leader>t_ respectively and you'll quickly access either of these panels. Yihoo!

There are a lot more interesting and useful mapping in the **VSCodeVim documentation** But remember to be critical. Before you add a custom mapping in your VSCodevim configuration consider whether it offers a better workflow than whatever you use today.

**A significant part of becoming more effective wit vim is to be mindful of your development workflow. Revisiting your vim configuration now and then, and adding new mappings that enhance the way you work so be mindful form now on, and keep your vim configuration razorsharp.**

### Moving Even Faster With Vim Surround and EasyMotion.

**Vim-sneak** and **vim-EasyMotion** are a couple of vim plugin that supercharge how fast you can move in vim.

Both of these plugin need to be enabled via your VSCodeVim settings. To enable them, just go to preferences, setting search for **vim sneak** or \*vim easymotion and you'll find the switch.

### Vim-Sneak

**Vim-sneak is a middle ground between character search (inside a line) and pattern search (inside a file).**

- Type _s{char}{char}_ and the cursor fliex to the first occurrence of that two character sequence.
- From then on type : for the next occurence, or _._ for the previous one.
- _S{char}{char}_ works in a simlar fashion but backwards.

Where **vim-surround** extendet vim's secred language with an operator, _vim-sneak_ does the same but with a motion: _the sneak motion_.

- Type **{operator}z{char}{char}** and the operator will be applied over the text traversed by the sneak motions.

### Why Z instead of S?

When used in conjuction with other operators, **vim-sneak** used the Z because the **s** is already taken by _vim-surround_. And _vim-surround_ is an extremely popular vim plugin.

### Vim-EASYMOTION

Vim-EasyMotion tries to simplify the use of motions in Vim by removing the need for counts. Instead of looking at a piece of code, counting in your head and using either of these combinations to perform some action.

    {operator}{count}{motion}

or move around:

    {count}{motion}

when you trigger an motion with EasyMotion, it Labels the possible targets in the whole documents with a key combination that is shown in an overlay(over the text in question). Type that key combination, and you're teleported to the location at once.

For instance, type **<leader><leader>w** and EasyMotion will label the beginning of all words ahead of you like so.

In the example of the image, typing the letter _l_ would make your cursor jump to the **FactionShipModifiers** interface, while typing **p** would send you to the **Energy** property of that interface.

Or you could type **<leader><leader>f'** and EasyMotion will label all occurrences of the ' character in the current and subsequent line. All the motions provided by **vim-EasyMotion** are namespaced by <leader><leader>, and they use key bindings whose meaning is related to the core Vim motionsO

| Command                 | Move to...                                                  |
| ----------------------- | ----------------------------------------------------------- |
| <leader><leader>w       | start of words                                              |
| <leader><leader>b       | start of words backwards                                    |
| <leader><leader>bdw     | start of words eveywhere. the bd stands for birectional     |
| <leader><leader>bdw     | start of words eveywhere. The _bd_ stands for bidirectional |
| <leader><leader>ge      | end of words backwords                                      |
| <leader><leader>bdw     | end of words eveywhere                                      |
| <leader><leader>j       | beginning of lines                                          |
| <leader><leader>k       | beginning of lines backwords                                |
| <leader><leader>f{char} | find character                                              |
| <leader><leader>F{char} | find character backwards                                    |
| <leader><leader>t{char} | until character                                             |
| <leader><leader>T{char} | until character backwords                                   |
| <leader><leader>s{char} | search character everywhere                                 |

### EasyMotion Only Works For Moving Around

In the VSCodeVim version, the motions in EasyMotion only support moving around and can't be combined with operators. This is a feature that is supported in traditional Vim so it may be something that will come to VsCodeVim down the line.

### Multiple Cursors

If You're a hardcore Visual studio Code user, Chances are you use multiple cursors. VSCodeVim offfers an experimental support for multiple cursors in **visual** and **Normal** modes. Using this experimental features (that is enabled by default), you can spawn multiple cursors and then use Operators to unleash the power of vim In Multiple locations at once.

### Add Multiple Cursors Based Of Word Search

If you want to **add multiple cursors based on word search** you need to:

1. Move the cursor on top of a word in your code.
2. Type **ctrl-d** or **gb** to add another cursor. This puts vim into _visual mode_ and ready to operate on the word you have selected.
3. Type **ctrl-d** to continue adding cursors until you're done.
4. Now you can perform an action in \*\*Visual mode(delete, change,etc).
5. Go back to Normal mode with **<esc>** and type any **normal mode** command keeping the multiple cursors.

A possible use case for multiple cursor would be to rename something. Imagine that you have a function that renames things, like properties within object in JaveScritp. Let's say that you have this beautiful object that represest me:

    const jaime = {
    name: 'Jaime',
    attributes: ['handsome', 'smart', 'witty']
    };

And some day you get tired of all this sel-adoration and narcissim and want vengeance. So you decide to rename my property **attributes** to **lackingattributes**

such a function (that you must now promise never to write in any program ever) could look like this.

    function rename(obj,n ame, newname){
      object.defineproperty(obj, newname, {
                  value: objn[ame],
                  enumerable: true,
                  writable: true,
                  configurable: true
     });
     delete objn[ame];

}
n
The *n*ame\*\* property isn't descritive enough so we want to rename it to oldName because this example couldn't be more meta that this. We can achieve this renaming using multiple cursors:
n

1. Move your cursor on top n
2.
