# Base image Stage 1
FROM docker.io/library/ubuntu:22.04 as stage1

SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get -qq -y install curl unzip zip
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -s https://get.sdkman.io | bash

RUN set -x \
    && echo "sdkman_auto_answer=true" > $HOME/.sdkman/etc/config \
    && echo "sdkman_auto_selfupdate=false" >> $HOME/.sdkman/etc/config \
    && echo "sdkman_insecure_ssl=false" >> $HOME/.sdkman/etc/config

RUN echo "sdk install java 22.2.r17-grl" >> $HOME/.sdkman/bin/sdkman-init.sh
RUN chmod a+x "$HOME/.sdkman/bin/sdkman-init.sh"
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

# Stage 2
FROM docker.io/library/ubuntu:22.04

COPY --from=stage1 root/.sdkman/candidates/java/22.2.r17-grl root/.sdkman/candidates/java/22.2.r17-grl
