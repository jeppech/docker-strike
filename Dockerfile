FROM debian:buster-slim

ENV USER noob
ENV HOME /home/$USER
ENV INSTALL_DIR $HOME/csgo_server

RUN apt update \
    && apt upgrade \
    # && apt install lib32gcc1 curl net-tools lib32stc++6 locales \
    # && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    # && dpkg-reconfigure --frontend=noninteractive locales \
    && apt install lib32gcc1 curl net-tools lib32stc++6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd $USER \
    && mkdir $HOME \
    && chown $USER:$USER $HOME \
    && mkdir $SERVER

ADD ./steamcmd.txt $SERVER/steamcmd.txt
ADD ./update.sh $SERVER/update.sh

RUN chown -R $USER:$USER $SERVER
USER $USER
