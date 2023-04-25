FROM eclipse-mosquitto:2

ARG UID
ARG GID
ARG USER

RUN addgroup -S -g ${GID} ${USER}
RUN adduser -S -u ${UID} -D -H -h /var/empty -s /sbin/nologin -G mosquitto -g ${USER} ${USER}

USER ${USER}