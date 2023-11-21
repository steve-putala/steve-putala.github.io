---
title: How to run Ubuntu in VirtualBox
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

> I encountered the error "Can't enumerate USB Devices" and fixed it by adding my user to the **vboxusers** group. You may need to restart your computer for the group change to take effect.
>
> ![VirtualBox Error Message: Can't enumerate USB Devices](/assets/images/knowledge-base/linux/virtualbox-usb-error.png)
>
> ```bash
> sudo usermod -a -G vboxusers steve
> ```

## Create Virtual Machine

Follow the instructions <https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#2-create-a-new-virtual-machine>


