---
title: How to run Ubuntu in VirtualBox
published: false
tags:
  - linux
  - install
  - ubuntu
  - virtualbox
references:
  - 
    link: Ubuntu VirtualBox instructions
    href: https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
---

## Install VirtualBox and download Ubuntu

Install VirtualBox from my [instructions to install VirtualBox on Ubuntu Linux]({% link knowledge-base/linux/software/install-virtualbox-on-ubuntu-linux.md %})

Download the latest .iso from <https://ubuntu.com/download/desktop>

## Start VirtualBox

Add user to the **vboxusers** group. You may need to restart your computer for the group to take effect.

```bash
sudo usermod -a -G vboxusers youruser
```
