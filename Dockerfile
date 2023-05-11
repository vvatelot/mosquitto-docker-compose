FROM eclipse-mosquitto:2

ARG UID
ARG GID
ARG USER

RUN if [ ${USER} != "root" ]; then \
        apk add shadow && \
        groupadd -f -g ${GID} ${USER} && \
        useradd -m -g ${USER} -u ${UID} ${USER}; \
    fi

RUN chown -R ${USER}:${USER} /mosquitto

USER ${USER}