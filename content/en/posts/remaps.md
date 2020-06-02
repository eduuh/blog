---
title: "My Keyboard Remaps"
date: 2020-03-19T07:41:06-07:00
draft: false
description: "
 Remaping caps lock to function as
           - **super key (Mod4)** when pressed with other keys.
           - **Escape** -> Short presses.
[Remaping tab lock] to function as.
           - **control key** when pressed with other key "

categories: ["KeyboardCentric"]
tags: ["productivity","touchtyping","comandline","colemak","keyboard"]
weight: 30

image : images/configurations.png

author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description

---
#### My Remaps.

My mindset is changing towards what works for me but not the defaults. Over the last few years I have shifted from Qwerty keyboard to `colemak keyboard layout`. I also made shift from Windows machine to a Linux box a decision which I have not regretted ever.

I had written this post before my **Major Os** shift and my requirement have changed considerably. Let me explain more on that. I am in the process of streamlining my workflow to 100% **keyboard centric**. This was greatly influeced by the possiblities in a linux box. Something that windows dont offer. `The power of choice.` Don't get me wrong `I still use windows machine`. But Linux works for be best.

Am currently using a **window manager (i3)** to manage my window setups in my linux computer. Fox conputer configuration and tweaking i have no problem using the command line.A keyboard centric approach calls for some remaps in order to be more efficient. What i wanted to achieve are the following.

1. ###### [Remaping caps lock]() to function as
   - **super key (Mod4)** when pressed with other keys.
   - **Escape** -> Short presses.
2. ###### [Remaping tab lock]() to function as.
   - **control key** when pressed with other keys.
   - **Tab** -> Short presses.
3. ###### [Changing the repeat KeyPresses]() to be a little more faster.

#### Explaination

#### Why CapsLock Function as *super key(Mod4)*

As i mentioned earlier , am using i3 (improved tiling window manager) to do alot of stuff using keyboard shortcuts. The activation key is usually the (super) key often known as **Windows key**.I will be writing on how i use `I3 window manager` but let me mention a few.

1. ###### Basic
   - Opening a new terminal
   - changing window focus
2. ###### Moving windows
    - Move window across the screen
    - Moving windows to different workspaces
3. ###### Using worspaces
    - Swith to another workspace
    - Move window to another workspace
4. ###### Opening application / closing windows
    - Open application lancher (dmenu)
    - kill a window.
5. ###### Modifying windows
   - going fullscreen
   - resizing

Considering the above functinality. I need the (Mod4) to be at `close proximity to the home row`. I don't want to move my hands each time i want to either of the task.

##### CapsLock Function as **Escape**.

Short presses on the **capsLock** are Escape. This is also my favorite remap i have. I have to admit that am i am learning **Vimcraft** as i making this big shifts. Vim is a Modular editor and to change between the modes (normal, command_line mode, visual mode) we use **Escape key**.

##### Tools Used

1. XCAPE : used to remap (CapsLock to a Smartkey)
2. setxkbmap : Used to change the keymaps using Keycodes and keysm.
3. xmodmap to remaps the capslock.
4. Xset : to reset the repeat rate of keys.

> ##### xcape

`XCAPE` allows you to use a `modifier key as another key when pressed and released on its own`. Note that is is slightly slower than pressing the original key, because press event does not occur until the key is released. The default behaviour is to generate the Escape key when Left Control is Pressed and released on its own.

Remaps Super_L to produce **Escape** on short keypress.

killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

> ###### xset

`xset` user preferences utility for x. I use this tool to reduce the keypress delay on my linux box by 50%.

`xset r rate 300 50`

> ###### xmodmap

Utility for modifying keymaps and pointer button mappings in X.

`xmodmap -e 'keycode 135 = Super_R`

> ###### Changing my keyboard Layout.

I found the default keyboard layout is `qwerty`. My default is `colemak`. The solution that i found to work for me is to use 'setxkbmap' to change the layout to colemak layout.

`setxkbmap us -variant colemak &   # set up the default keyboard layout to colemak`

This is how my remaps script looks like. This script is called on startup to remaps keys and set my default keyboard layout.

##### remaps. (Scripts)

remaps is  a script that contains a series of **statements which remaps** my keyboard.

```
#!/bin/sh
xset r rate 300 50
setxkbmap -option caps:super
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
xmodmap -e 'keycode 135 = Super_R'
setxkbmap us -variant colemak &   # set up the default keyboard layout to colemak
```


### Archive Notes.
I used to use this method but i currently using the above remaps.
Run the commands below to remap **capslock** to **control** and **escape**.

```bash
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
```
The effect should apply immediately.

### Step 3. Autostart

Append code from Step 2 to file `~/.xprofile` to run the command when X starts.


### Windows

#### Option 1:

1. Download and install [AutoHotKey](https://autohotkey.com/).
2. Use the script [CapsLockCtrlEscape.ahk](https://github.com/eduuh/ahk-caps-ctrl-esc).

This was made possible with a third party software called *AutoHotkey* described as `the Altimate automation script for
windows systems`.

I choose to use these program since i plan to do some automations with it in the future.

I admit i did not write the script for this program myself by i sourced out from [github](https://github.com/eduuh/ahk-caps-ctrl-esc).

This script came with something additional that i loved. I did not lose the **caps lock** fuctionality as in my linux distro. Pressing the `two
shift keys together` activates thes caps lock.
