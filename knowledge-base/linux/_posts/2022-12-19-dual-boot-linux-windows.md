---
title: My old instructions to dual boot windows
tags:
  - linux mint
  - install
---

Notes that I made for myself years ago to dual boot Linux Mint and Windows

**Warning:** These are old notes that I am not maintaining or updating
{: .message .warning}

Installing Windows and Linux Mint took some time the first time, these are my dual boot notes.

If you'd like to see better notes add a comment below.

## Dual Boot

* Install windows from USB
    * I was getting blue screen, was caused by the nvidia display, look for older drivers to fix the issue
* Manage the partitions in winows to make room for Linux

## Unetbootin

* $ sudo apt-get install unetbootin extlinux
* Run unetbootin from the start menu
* Choose the image I want as downloaded from linux mint

## Install Mint

* ~~I used the usb writer in Mint to create the boot usb~~
* Use unetbootin (I had to add the package, then apt-get install)
* Download the iso from linuxmint.com
* ~~Follow the instructions on the mint website~~
* Install and “do something else” to set up the partitions
* Create the partitions
* Click free space and click new partition table

<table class="center">
    <thead>
        <tr>
            <th>Name</th>
            <th>Size</th>
            <th>Type</th>
            <th>Location</th>
            <th>Use As</th>
            <th>Mount Point</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>root</td>
            <td>30,000B</td>
            <td>Primary</td>
            <td>Beginning</td>
            <td>EXT4</td>
            <td>/</td>
        </tr>
        <tr>
            <td>Home</td>
            <td>Remainder - swap</td>
            <td>Logical</td>
            <td>Beginning</td>
            <td>EXT4</td>
            <td>/home</td>
        </tr>
        <tr>
            <td>Swap</td>
            <td>2 x RAM</td>
            <td>Logical</td>
            <td>Beginning</td>
            <td>Swap area</td>
            <td>N/a</td>
        </tr>
    </tbody>
</table>

* The following are some old notes
    * ~~Need to add a 35M (37M makes 25M) EFI partition as the first partition, if I don't make it the installer will complain to me~~
    * ~~http://forums.linuxmint.com/viewtopic.php?t=122276~~
* ~~I had some problems with EUFI and had to disable some options in the bios, change the boot format of the hard drive and re-install mint. Not sure which of the changes got the install to work Adding the EFI Partition allowed me to use the default bios settings~~
* ~~The size of the efi boot partition: primary 37M~~
