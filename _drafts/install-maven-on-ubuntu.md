---
references:
 - https://maven.apache.org/install.html
---

## Install Maven on Ubuntu

Download the latest https://maven.apache.org/download.cgi

Verify the Signature: https://www.apache.org/info/verification.html

@TODO: add the documentation here

Unzip Maven, move to `/opt` and create symlink in `/usr/bin` 

```bash
$ tar xzvf apache-maven-3.9.1-bin.tar.gz && /
$ sudo mv apache-maven-3.9.1 /opt/ && /
$ sudo ln -s /opt/apache-maven-3.9.1/bin/mvn /usr/bin/mvn
```

## Verify the version

```bash
$ mvn --version
```

