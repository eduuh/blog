---
title: "Mappingcapstoctrlandescape"
date: 2020-03-19T07:41:06-07:00
draft: true
---
# Smart Caps Lock: Remap to Control AND Escape (Linux, Mac, Windows)


- Send <kbd>Escape</kbd> if you tap <kbd>Caps Lock</kbd> alone.
- Send <kbd>Control</kbd> if you press <kbd>Caps Lock</kbd> with another key.
- send <kbd>caps lock</kbd> if you press <kbd>both shift keys together</kbd>

For vim , emacs and normal day typing

## GNU/Linux

### Step 1. Install XCAPE

Install [XCAPE](https://github.com/alols/xcape) (`xcape`). (Linux utility to configure modifier keys to act as other keys when pressed and released on their own.)

Ubuntu:

```bash
sudo apt-get install xcape
```

### Step 2. Run the command

```bash
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
```
The effect should apply immediately.

### Step 3. Autostart

Append code from Step 2 to file `~/.xprofile` to run the command when X starts.

## macOS

1. Download and install [Karabiner-Elements](https://pqrs.org/osx/karabiner/), a powerful and stable keyboard customizer.
2. Open Karabiner-Elements, select **Complex Modifications** tab, and click **Add rule** at the bottom.
3. Find **Post escape if caps is pressed alone, left_ctrl otherwise** and click on **enable**.

The effect should apply immediately.

## Windows

### Option 1:

1. Download and install [AutoHotKey](https://autohotkey.com/).
2. Use the script [CapsLockCtrlEscape.ahk](https://github.com/eduuh/ahk-caps-ctrl-esc).

This was made possible with a third party software called *AutoHotkey* described as `the Altimate automation script for 
windows systems`. 

I choose to use these program since i plan to do some automations with it in the future.

I admit i did not write the script for this program myself by i sourced out from [github](https://github.com/eduuh/ahk-caps-ctrl-esc).

This script came with something additional that i loved. I did not lose the **caps lock** fuctionality as in my linux distro. Pressing the `two
shift keys together` activates thes caps lock.




