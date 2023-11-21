---
title: How to install Kdenlive on Ubuntu Linux via PPA
tags:
  - linux
  - install
  - ubuntu
  - kdenlive
references:
  - 
    link: Ubuntu VirtualBox instructions
    href: https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
---

Add the PPA and install. <https://kdenlive.org/en/download/> sent to the instructions <https://launchpad.net/~kdenlive/+archive/ubuntu/kdenlive-stable>.

```bash
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt update
sudo apt install kdenlive
```

## I encountered errors about `mediainfo` and `glaxnimate`

Some instructions <https://github.com/NixOS/nixpkgs/issues/209923>

I was able to fix the errors by installing the missing dependencies

```bash
sudo apt install mediainfo
snap install glaxnimate
```

Then updating a path in the settings

1. Go to Settings -> Configure Kdenlive
2. Choose "Environment" in the left column
3. Click the "Default Apps" tab
4. Enter **/usr/bin/snap** in the "Animation Editing" input

![kdenlive setting animation editing](/assets/images/knowledge-base/linux/kdenlive-animation-editing-setting.png)
