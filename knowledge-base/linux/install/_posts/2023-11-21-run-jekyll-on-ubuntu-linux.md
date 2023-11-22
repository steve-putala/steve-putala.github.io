---
title: How to run Jekyll on Ubuntu Linux
tags:
  - linux
  - install
  - ubuntu
  - jekyll
references:
  - 
    link: 
    href: 
---

Install prerequisites <https://jekyllrb.com/docs/installation/ubuntu/>

```bash
sudo apt-get install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler
```

Quickstart instructions to set up a site <https://jekyllrb.com/docs/>

cd into web root directory

```bash
cd root
```

Run jekyll serve to test the site locally

```bash
jekyll serve
```

> If there is an error you may need to install webrick `bundle add webrick`