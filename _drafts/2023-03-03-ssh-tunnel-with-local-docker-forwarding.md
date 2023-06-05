---
references:
    - https://stackoverflow.com/questions/22944631/how-to-get-the-ip-address-of-the-docker-host-from-inside-a-docker-container
---

Use this command to forward database requests locally through the ssh tunnel, just set 127.0.0.1 as the host and 3307 as the port in the config

ssh -NgL 3307:127.0.0.1:3306 steve@3rdmil.tempurl.host

You can also in Docker get the IP for the host machine and forward requests to the host IP:3307 to a remote database that requires ssh tunnel, very cool.

It looks like I can use `host.docker.internal` according to this:

https://stackoverflow.com/questions/22944631/how-to-get-the-ip-address-of-the-docker-host-from-inside-a-docker-container
