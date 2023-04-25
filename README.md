# Simple Mosquitto broker

![Mosquitto Logo](https://mosquitto.org/images/mosquitto-text-side-28.png 'Mosquitto')

This is a simple [Mosquitto](https://mosquitto.org) broker to quickly initialize projects requiring an MQTT broker.

## Prerequisite

- [Docker](https://www.docker.com/)
- [Docker Compose V2](https://docs.docker.com/compose/)

## How to use

To start the container, just :

```bash
UID=$UID GID=$GID USER=$USER docker compose up -d --build
```

The Mosquitto broker is now available on localhost. You can test it easily (require Mosquitto client):

| In one shell:

```bash
mosquitto_sub -h localhost -t "sensor/temperature"
```

| In a second shell:

```bash
mosquitto_pub -h localhost -t sensor/temperature -m 23
```

## Configuration

The config file is in the file [mosquito.conf](./config/mosquitto.conf)

By default we activated the log and data persistance (logs are in the `log` folder, and data are stored in a docker volume).

## Authentication

### Enable authentication

In the config file, set the value `allow_anonymous` to `false`, then uncomment the last line (`password_file`) and finaly restart the container.

> The default user is `admin/password`.

### Change user password / create a new user

```bash
docker compose exec -u $USER mosquitto mosquitto_passwd -b /mosquitto/config/password.txt user password
docker compose restart
```

### Delete user

```bash
docker compose exec -u $USER mosquitto mosquitto_passwd -D /mosquitto/config/password.txt user
docker compose restart
```
