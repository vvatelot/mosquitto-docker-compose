FROM eclipse-mosquitto:2

ARG UID
ARG GID
ARG USER=unicorn

RUN apk add shadow && \
    groupadd -f -g ${GID} ${USER} && \
    useradd -m -g ${USER} -u ${UID} ${USER} && \
    chown -R ${USER}:${USER} /mosquitto

USER ${USER}
