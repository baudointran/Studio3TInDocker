# FROM mongo:4.0.6 as base
FROM ubuntu:bionic 
ARG user
ARG uid
ARG gid

#Add new user with our credentials
ENV USERNAME ${user}
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod  --uid ${uid} $USERNAME && \
        groupmod --gid ${gid} $USERNAME

USER ${user}

WORKDIR /home/${user}

USER root
RUN buildPkgs="curl ca-certificates libswt-gtk-4-java lsb-release libssl1.1" ; \
    apt-get update && apt-get install -y --no-install-recommends $buildPkgs

RUN update-ca-certificates
RUN curl https://download.studio3t.com/studio-3t/linux/2022.6.1/studio-3t-linux-x64.tar.gz --output studio-3t-linux-x64.tar.gz && tar -xvzf studio-3t-linux-x64.tar.gz && yes "" | ./studio-3t-linux-x64.sh && rm studio-3t-linux-x64.*

USER ${user}
CMD /usr/local/studio3t/Studio-3T
