---
title: 'My Keyboard Remaps(Smart CapsLock)'
date: 2020-03-19T07:41:06-07:00
draft: false
description: 'Reload the colemak Keyboard layout on my arch distributions and Remaping caps lock to function primary as Escape on short presses and Control when pressed with other keys'
categories: ['Productivity']
tags: ['cli']
categories: ['config']

weight: 4
image: images/configurations.png
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
---

#### My Remaps (General Remaping).

My mindset is changing towards what works for me which bring the need to remap the defaults. Over the last few month I have shifted from ~~Qwerty keyboard~~ to `colemak keyboard layout`. I also made a shift from Windows machine to a Linux box a decision which I have not regretted ever.

I had written this post before my **Major Os** shift and my requirement have changed considerably. Let me explain more on that. I am in the process of streamlining my workflow to 100% **keyboard centric**. This was greatly influeced by the possiblities in a linux box. Something that windows don't offer. **The power of choice.** Don't get me wrong **I still use windows machine**. _But Linux works for be best._

Currently am using a **window manager (i3)** for window layout management on my linux computer. For computer configuration and tweaking i have no problem using the command line.**_A keyboard centric approach calls for some remaps at one point_** in order to be more efficient. What i wanted to achieve are the following.

{{<boxmd>}}

1. ###### [Load Colemak Keyboard Layout]().
2. ###### [Remaping caps lock]() to function as
   - **control key** when pressed with other keys.
   - **Escape** -> Short presses.
3. ###### [Remaping tab lock]() to function as. ~~Not successful on this one.~~
   - **super key (Mod4)** when pressed with other keys.
   - **Tab** -> Short presses.
4. ###### [Changing the repeat KeyPresses]() to be a little more faster.
   {{</boxmd>}}

##### Explaination

##### Why Window Function as _super key(Mod4)_

Initially i was using **caps Lock** as my **Super key and escape** but later i realized it was easier to use it a the **window key** easy to type with my left 👍. Currently my **caps lock** function as **control and escape**. This remap improves my productivity a great deal when working with **brave browser and tmux**.

As i mentioned earlier , am using **i3 (improved tiling window manager)**. _Okey edd! what do it do?_.**Good question**👏

With i3 am able to do alot of stuff using keyboard shortcuts. **The activation key is usually the (super) key often known as **Windows key\*\*\*\*. I will write on how i use **I3 window manager but let me mention a few.**

{{<boxmd>}}

1. ###### Basic
   - Opening a new terminal. (**using st terminal**)
   - changing window focus.(using _activation key_ and **h,n,e,i**)
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
     {{</boxmd>}}

Considering the above functinality. I need the (Mod4) to be at `close proximity to the home row`. I don't want to move my hands each time i want to either of the task. I have come to realize that it is easy to type **window** key with the 👍. If i have problem with using the finger am planning to remap **alt** to **mod4** key.

##### CapsLock Function as **Escape**.

Short presses on the **capsLock** are Escape. This is also my favorite remap i have. I have to admit that am i am learning **Vimcraft** as i making this big shifts. Vim is a Modular editor and to change between the modes (normal, command_line mode, visual mode) we use **Escape key**.

{{<boxmd>}}

##### _Tools Used_

1. **xcape** : used to remap (CapsLock to a Smartkey)
2. **setxkbmap** : Used to change the keymaps using Keycodes and keysm.
3. **xmodmap** to remaps the capslock.
4. **xset** : to reset the repeat rate of keys.
   {{</boxmd>}}

> ###### Changing my keyboard Layout. (**Setxkmap**)

I found the default keyboard layout is `qwerty`. My default is `colemak`. The solution that i found to work for me is to use 'setxkbmap' to change the layout to colemak layout.

{{<boxmd>}}
**setxkbmap us -variant colemak &**  
{{</boxmd>}}

This is how my remaps script looks like. This script is called on startup to remaps keys and set my default keyboard layout.

> ##### xcape

**XCAPE** allows you to use a **modifier key as another key when pressed and released on its own**. Note that is is slightly slower than pressing the original key, because press event does not occur until the key is released. **The default behaviour is to generate the Escape key when Left Control is Pressed and released on its own.**

Remaps Super_L to produce **Escape** on short keypress.
{{<boxmd>}}
**killall xcape 2>/dev/null ;xcape -e 'Control_L=Escape'**
{{</boxmd>}}

> ##### xset

**xset** user preferences utility for x. I use this tool to reduce the keypress delay on my linux box by 50%.

{{<boxmd>}}
**xset r rate 300 50**
{{</boxmd>}}

> ###### xmodmap

Utility for modifying keymaps and pointer button mappings in X.

{{<boxmd>}}
**xmodmap -e 'keycode 135 = Super_R**
{{</boxmd>}}

##### remaps. (Scripts)

A script is just a file with a group of commands that are run by bash. This **remaps** script is currently run during user login. **remaps** is a script that contains a series of **statements** which first loads my **default colemake keyboard layout** and then remaps my **CapsLock** to a smart key.

{{<gist eduuh fd8e5693e17fd62d016aaa4a276095ab>}}

#### Archive Notes.

I used to use this method but i currently using the above remaps. The caps lock was my **superkey** for **i3craft**. but i have shifted to smart key for my productivity.
Run the commands below to remap **capslock** to **control** and **escape**.

{{<gist eduuh 12db78cc2b3ad14db5fe221bc6a84cb3>}}

The effect should apply immediately.

#### Step 3. Autostart

Append code from Step 2 to file `~/.xprofile` to run the command when X starts.

#### Windows

#### Option 1:

{{<boxmd>}}

1. **Download and install [AutoHotKey](https://autohotkey.com/).**
2. **Use the script [CapsLockCtrlEscape.ahk](https://github.com/eduuh/ahk-caps-ctrl-esc).**
   {{</boxmd>}}

This was made possible with a third party software called _AutoHotkey_ described as _the Altimate automation script for windows systems_.

I choose to use these program since i plan to do some automations with it in the future.

I admit i did not write the script for this program myself by i sourced out from [github](https://github.com/eduuh/ahk-caps-ctrl-esc).

This script came with something additional that i loved. I did not lose the **caps lock** fuctionality as in my linux distro. Pressing the **two shift keys together** activates thes caps lock.
