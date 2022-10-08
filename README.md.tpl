# SDKMAN archive for GraalVM

last updated: last updated: ###TIMESTAMP###   
author: Lukasz Ochmanski (github@ochmanski.de)  
  
[![Github tag](https://badgen.net/github/tag/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu?icon=github&kill_cache=1)](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/tags/###CI_COMMIT_TAG###)  
&nbsp;
  
**Project details:**  
![GitHub](https://img.shields.io/github/license/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu)
![java17](https://img.shields.io/badge/Java-17-brightgreen) 
![gradle](https://img.shields.io/badge/Gradle-7.5-brightgreen) 
![graalvm](https://img.shields.io/badge/GraalVM-22.2.0-brightgreen) 
![mandrel](https://img.shields.io/badge/Mandrel-22.2.0-brightgreen) 
![distribution](https://img.shields.io/badge/Distribution-Ubuntu-brightgreen) 
![arch](https://img.shields.io/badge/Arch-amd64-brightgreen)  
&nbsp;  
  
&nbsp;


## Supported tags and respective Dockerfile links
* [1.0.3](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/blob/1.0.3/Dockerfile), [latest](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/blob/main/Dockerfile)  
* [1.0.2](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/blob/1.0.2/Dockerfile)  
* [1.0.1](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/blob/1.0.1/Dockerfile)  
* [1.0.0](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu/blob/1.0.0/Dockerfile)  
&nbsp;  
  
&nbsp;

## Before you start

### Gradle configuration

Before you start it is assumed that you installed SDKMAN, Java and Gradle.
```bash
sdk install java 17.0.2-open
sdk install gradle 7.5
```
&nbsp;
&nbsp;

## 1. How to clone:
```bash
git clone git@github.com:ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu.git \
~/Workspace/ochmanskide/sdkman/candidates/java/22.2.r17-grl/linux/ubuntu
```
&nbsp;

## 2. GitHub repository URL
https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu
&nbsp;

&nbsp;
## 3. How to build locally:
```bash
export DOCKER_HUB_HOST=$USER
cd ~/Workspace/ochmanskide/sdkman/candidates/java/22.2.r17-grl/linux/ubuntu
gradle docker
```
to push:
```bash
gradle dockerPush
```
to see all tasks:
```bash
gradle tasks
```
More about Gradle Docker Plugin: https://github.com/palantir/gradle-docker  
&nbsp;

&nbsp;

## 4. DockerHub page:
https://hub.docker.com/repository/docker/ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu
&nbsp;

&nbsp;

## 5. Image coordinates:
```  
docker pull ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu:###CI_COMMIT_TAG###
```

## 6. Docker images:
```
REPOSITORY                                                                         TAG       IMAGE ID       SIZE
ochmanskide/sdkman.candidates.java.22.2.r17-grl.linux.ubuntu.22.2.r17-grl-ubuntu   ###CI_COMMIT_TAG###     2ee14ad56983   567MB
docker.io/library/ubuntu                                                           22.04     216c552ea5ba   77.8MB
```

## 11. Frequently Asked Questions (FAQ)
### 11.1. Is this project OpenSource?
Yes, you can use this project in anyway you like. Feel free to copy, fork or do whatever you like with it.  
If you have questions about licensing, feel free to email me.  

### 11.2. How can I contact the maintainer?
if you have questions, feel free to send me an email: github@ochmanski.de  
I will be happy to help you.

### 11.2. Is this image compatible with AWS CodeBuild pipeline?
- yes, you could use it in the AWS environment, but you just need to install AWS-CLI.  
I already prepared a shell script `./scripts/install/05-install-aws-cli.sh` and `10-import-rds-certificates.sh`.  
Simply run it and you should be able to authenticate with all AWS resources.  
