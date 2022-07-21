---
layout: post
title:  "Run NGC container in Windows 11"
date:   2022-07-21 15:37:15 +0200
categories: conatiner ia ngc 
---
I'm a big server Linux fan and have used laptop macOS for over 10 years now for its unix like shell. Windows has now the famous Windows Subsystem for Linux, time to give it a shot! Furthermore, I want also escape Docker Desktop fees... Let's try something fancy.

First step is to activate WSL on your Win11 box. So, to do that you need to enable 2 features like below:

![win11-wsl](/gfx/activate-wsl.png)

Followed in command prompt: ``wsl --install --distribution Ubuntu-20.04``

To run containers, we need to install podman. It's a free open source docker engine alternative. If you hope to use docker-ce in wsl you wrong, it needs Docker Desktop that is not free if you're working for large enterprise.

Within WSL shell:

```
# source /etc/os-release
# sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
# wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | apt-key add -
# apt-get update -qq -y
# apt-get -qq --yes install podman
# podman version
```
