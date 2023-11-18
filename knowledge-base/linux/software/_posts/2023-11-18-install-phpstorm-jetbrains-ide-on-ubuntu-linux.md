---
title: How to install PhpStorm by JetBrains IDE on Ubuntu Linux
tags:
  - linux
  - install
  - ubuntu
  - ide
  - code editor
references:
  - 
    link: JetBrains toolbox install instructions
    href: https://www.jetbrains.com/help/phpstorm/installation-guide.html#toolbox
---

Install the JetBrains Toolbox App to get all the IDEs easily from <https://www.jetbrains.com/help/phpstorm/installation-guide.html#toolbox>

## Install steps

1. Download tar.gz <https://www.jetbrains.com/toolbox-app/>
2. Extract to /opt (adjust filename)<br>
  `sudo tar -xzf jetbrains-toolbox-1.17.7391.tar.gz -C /opt`
3. Move to the binary's directory (adjust path)<br>
  `cd /opt/jetbrains-toolbox-2.1.0.18144`
4. Execute the **jetbrains-toolbox** binary (adjust path)<br>
  `./jetbrains-toolbox`

# Fix **"dlopen(): error loading libfuse.so.2"** and **"AppImages require FUSE to run"** error

```bash
steve:/opt/jetbrains-toolbox-2.1.0.18144 $ ./jetbrains-toolbox 
dlopen(): error loading libfuse.so.2

AppImages require FUSE to run. 
You might still be able to extract the contents of this AppImage 
if you run it with the --appimage-extract option. 
See https://github.com/AppImage/AppImageKit/wiki/FUSE 
for more information

```

Install `libfuse2` to add the missing dependency.

```bash
sudo apt install libfuse2
```

### Using the `--appimage-extract` option **did not** fix the issue.

When I tried it there was output, but the problem persisted.

```bash
sudo ./jetbrains-toolbox --appimage-extract
```
