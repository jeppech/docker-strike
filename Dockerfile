FROM debian:buster-slim

ENV USER noob
ENV HOME /home/${USER}
ENV SERVER_DIR ${HOME}/csgo_server

RUN apt update \
    && apt upgrade \
    # && apt install lib32gcc1 curl net-tools lib32stc++6 locales \
    # && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    # && dpkg-reconfigure --frontend=noninteractive locales \
    && apt install lib32gcc1 curl net-tools lib32stdc++6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && useradd ${USER} \
    && mkdir ${HOME} \
    && chown ${USER}:${USER} ${HOME} \
    && mkdir ${SERVER_DIR}

ADD ./steamcmd.txt $SERVER_DIR/steamcmd.txt
ADD ./update.sh $SERVER_DIR/update.sh

RUN chown -R ${USER}:${USER} ${SERVER_DIR}
RUN chmod +x ${SERVER_DIR}/update.sh

USER ${USER}
RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C ${SERVER_DIR} -xvzf -
RUN ${SERVER_DIR}/update.sh

WORKDIR ${SERVER_DIR}

CMD 