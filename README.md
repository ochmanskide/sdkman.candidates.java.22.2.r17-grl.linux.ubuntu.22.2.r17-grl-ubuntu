# Ubuntu-based image with SDKMAN archive

last updated: last updated: Sat Oct  8 11:33:30 CEST 2022   
author: Lukasz Ochmanski (github@ochmanski.de)  
  
[![Github tag](https://badgen.net/github/tag/ochmanskide/sdkman.candidates.java.22.2.r17-grl?icon=github&kill_cache=1)](https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl/tags/0.0.3)  
&nbsp;
  
**Project details:**  
![GitHub](https://img.shields.io/github/license/ochmanskide/sdkman.candidates.java.22.2.r17-grl)
![java17](https://img.shields.io/badge/Java-17-brightgreen) 
![gradle](https://img.shields.io/badge/Gradle-7.5-brightgreen) 
![graalvm](https://img.shields.io/badge/GraalVM-22.2.0-brightgreen) 
![mandrel](https://img.shields.io/badge/Mandrel-22.2.0-brightgreen) 
![distribution](https://img.shields.io/badge/Distribution-Ubuntu-brightgreen) 
![arch](https://img.shields.io/badge/Arch-amd64-brightgreen)  
&nbsp;  
  
## Quick reference

## About
Mandrel focuses on GraalVM's native-image component in order to provide an easy way for Quarkus users to generate native images for their applications.  
Developers using Quarkus should be able to go all the way from Java source code to lean, native, platform-dependent applications running on Linux.  
This capability is vital for deploying to containers in a cloud-native application development model. 

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
git clone git@github.com:ochmanskide/sdkman.candidates.java.22.2.r17-grl.git \
~/Workspace/ochmanskide/sdkman/candidates/java/22.2.r17-grl
```
&nbsp;

## 2. GitHub repository URL
https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl
&nbsp;

&nbsp;
## 3. How to build locally:
```bash
export DOCKER_HUB_HOST=$USER
cd ~/Workspace/ochmanskide/sdkman/candidates/java/22.2.r17-grl
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
https://hub.docker.com/repository/docker/ochmanskide/sdkman.candidates.java.22.2.r17-grl
&nbsp;

&nbsp;

## 5. Image coordinates:
```  
docker pull ochmanskide/sdkman.candidates.java.22.2.r17-grl:0.0.3
```

## 6. Docker images:
```
REPOSITORY                                                                                        TAG                    SIZE
ochmanskide/sdkman.candidates.java.22.2.r17-grl   0.0.3                  1.18GB
ochmanskide/sdkman.candidates.java.22.2.r17-grl   latest                 1.18GB
```

## 7. Layers:
```
### Mandrel Image
### Debian Slim
### Debian based Mandrel Official Image
### base/images/debian/debian-11-bullseye/mandrel/22-2/java-17/22.2.r17-grl
### sdkman.candidates.java.22.2.r17-grl
### ochmanskide/sdkman.candidates.java.22.2.r17-grl

debian-11-bullseye/22.2.r17-grl   00-slim            80MB   (80MB)
debian-11-bullseye/22.2.r17-grl   01-clean           80MB   (0MB)
debian-11-bullseye/22.2.r17-grl   02-graalvm         465MB  (385MB)
debian-11-bullseye/22.2.r17-grl   03-gradle          594MB  (129MB)
debian-11-bullseye/22.2.r17-grl   04-aws-cli         753MB  (159MB)
debian-11-bullseye/22.2.r17-grl   05-docker-cli      805MB  (52MB)
debian-11-bullseye/22.2.r17-grl   06-dockerd         870MB  (65MB)
debian-11-bullseye/22.2.r17-grl   07-containerd      904MB  (34MB)
debian-11-bullseye/22.2.r17-grl   08-build-essential
debian-11-bullseye/22.2.r17-grl   09-libz-dev
debian-11-bullseye/22.2.r17-grl   10-zlib1g-dev      1.11GB (196MB)
debian-11-bullseye/22.2.r17-grl   11-git             1.18GB (70MB)
```

## 8. based on image:
https://hub.docker.com/_/debian

```  
FROM debian:stable-20220711-slim
```

##### 8.1. References
https://github.com/vegardit/docker-graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven  

https://hub.docker.com/r/vegardit/graalvm-maven/tags  

https://github.com/graalvm/mandrel/releases/tag/mandrel-22.2.0.0-Final  

##### 8.2. Mandrel

**Mandrel 22.2.0.0-Final** is a downstream distribution of the **GraalVM** community edition 22.2.0.  
Mandrel's main goal is to provide a native-image release specifically to support Quarkus.  
The aim is to align the native-image capabilities from GraalVM with OpenJDK and Red Hat Enterprise Linux libraries to improve maintainability for native Quarkus applications.  

**How Does Mandrel Differ From Graal**  
Mandrel releases are built from a code base derived from the upstream GraalVM code base, with only minor changes but some significant exclusions.  
They support the same native image capability as GraalVM with no significant changes to functionality.  
They do not include support for Polyglot programming via the Truffle interpreter and compiler framework.  
In consequence, it is not possible to extend Mandrel by downloading languages from the Truffle language catalogue.  

Mandrel is also built slightly differently to GraalVM, using the standard OpenJDK project release of jdk11u.  
This means it does not profit from a few small enhancements that Oracle have added to the version of OpenJDK used to build their own GraalVM downloads.  
Most of these enhancements are to the JVMCI module that allows the Graal compiler to be run inside OpenJDK.  
The others are small cosmetic changes to behaviour.  
These enhancements may in some cases cause minor differences in the progress of native image generation.  
They should not cause the resulting images themselves to execute in a noticeably different manner.  

Mandrel's `native-image` depends on the following packages:  

```
freetype-devel
gcc
glibc-devel
libstdc++-static
zlib-devel
```
On Fedora/CentOS/RHEL they can be installed with:  

```bash
dnf install glibc-devel zlib-devel gcc freetype-devel libstdc++-static
```
> Note: The package might be called `glibc-static` or `libstdc++-devel` instead of `libstdc++-static` depending on your system.  
> If the system is missing `stdc++`, `gcc-c++` package is needed too.

On Ubuntu-like systems with:  
```bash
apt install g++ zlib1g-dev libfreetype6-dev
```

## 9. image details:
```bash
$ docker run -it --entrypoint /bin/bash ochmanskide/sdkman.candidates.java.22.2.r17-grl:0.0.3

# echo $0
/bin/bash

# pwd
/home/gradle

# whoami
root

# cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
NAME="Debian GNU/Linux"
VERSION_ID="11"
VERSION="11 (bullseye)"
VERSION_CODENAME=bullseye
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

# printenv
GRAALVM_HOME=/opt/graalvm
HOSTNAME=85716d0ea82c
JAVA_HOME=/opt/graalvm
GRADLE_HOME=/opt/gradle
PWD=/home/gradle
IMAGE_SOURCE=https://github.com/ochmanskide/sdkman.candidates.java.22.2.r17-grl
HOME=/root
GRADLE_VERSION=7.5
GRADLE_USER_HOME=/home/gradle/.gradle
TERM=xterm
SHLVL=1
DOCKER_HUB_URL=https://hub.docker.com/repository/docker/
PATH=/opt/graalvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DOCKER_HUB_HOST=ochmanskide
DOWNLOADS=/downloads
DEBIAN_FRONTEND=noninteractive
JAVA_VERSION=17.0.4
_=/usr/bin/printenv

# curl --version
bash: curl: command not found

# java -version
openjdk 17.0.4 2022-07-19
OpenJDK Runtime Environment Temurin-17.0.4+8 (build 17.0.4+8)
OpenJDK 64-Bit Server VM Temurin-17.0.4+8 (build 17.0.4+8, mixed mode, sharing)
root@40d34d5c68df:/home/gradle#

# git version
git version 2.30.2

# docker --version
Docker version 20.10.11, build dea9396

# gradle -version

Welcome to Gradle 7.5!

Here are the highlights of this release:
 - Support for Java 18
 - Support for building with Groovy 4
 - Much more responsive continuous builds
 - Improved diagnostics for dependency resolution

For more details see https://docs.gradle.org/7.5/release-notes.html


------------------------------------------------------------
Gradle 7.5
------------------------------------------------------------

Build time:   2022-07-14 12:48:15 UTC
Revision:     c7db7b958189ad2b0c1472b6fe663e6d654a5103

Kotlin:       1.6.21
Groovy:       3.0.10
Ant:          Apache Ant(TM) version 1.10.11 compiled on July 10 2021
JVM:          17.0.4 (Eclipse Adoptium 17.0.4+8)
OS:           Linux 5.10.25-linuxkit amd64


# aws --version
aws-cli/2.7.18 Python/3.9.11 Linux/5.10.104-linuxkit exe/x86_64.debian.11 prompt/off

# cat /home/gradle/.gradle/gradle.properties
org.gradle.daemon=true
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.console=plain

# ls -la /home/gradle
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .
drwxr-xr-x 1 root root 4096 Apr 13 14:57 ..
-rwxr-xr-x 1 root root  220 Apr 14 08:44 .bash_logout
-rwxr-xr-x 1 root root 3771 Apr 14 08:44 .bashrc
drwxr-xr-x 1 root root 4096 Apr 19 10:21 .gradle
-rwxr-xr-x 1 root root  807 Apr 14 08:44 .profile
```

## 10. Quick start
```bash
docker run -it --entrypoint /bin/bash ochmanskide/sdkman.candidates.java.22.2.r17-grl
java -version && echo
gradle -version && echo
docker --version && echo
aws --version && echo
alias la='ls -la' && echo
la /usr/local/bin/containerd && echo
/usr/local/bin/dockerd-entrypoint.sh 2> /dev/null && echo
/home/aws/ecr/login.sh && echo
docker images && echo
```

### 10.1. Run Quarkus with Gradle
clone the project:
```bash
docker run -it --entrypoint /bin/bash ochmanskide/sdkman.candidates.java.22.2.r17-grl
git clone https://github.com/ochmanskide/quarkus.code-with-quarkus.git /home/quarkus/code-with-quarkus
cd /home/quarkus/code-with-quarkus
```
build native image:
```bash
gradle build -x test -Dquarkus.package.type=native
```
when the build completes, you may run the image, which is located somewhere in /build/libs/ directory.
```bash
/home/quarkus/quarkus-jpa-example/build/libs/quarkus-jpa-example-1.0.0-SNAPSHOT-runner
```

### 10.2. Run Quarkus with Maven
```bash
docker run -it --entrypoint /bin/bash ochmanskide/sdkman.candidates.java.22.2.r17-grl
git clone https://github.com/ochmanskide/quarkus.code-with-quarkus.git /home/quarkus/code-with-quarkus
cd /home/quarkus/code-with-quarkus/
./mvnw package -Pnative
./target/code-with-quarkus-1.0.0-SNAPSHOT-runner
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
