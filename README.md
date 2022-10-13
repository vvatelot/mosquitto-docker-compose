# Simple Mosquitto broker

![Mosquitto Logo](https://mosquitto.org/images/mosquitto-text-side-28.png 'Mosquitto')

This is a simple [Mosquitto](https://mosquitto.org) broker to quickly initialize projects requiring an MQTT broker.

## Prerequisite

- [Docker](https://www.docker.com/)
- [Docker compose](https://docs.docker.com/compose/) +v1.27.0 (better to have v2)

## How to use

To start the container, just :

```bash
UID=$UID GID=$GID docker-compose up -d
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

By default we activated the log and data persistance (logs are in the `log` folder, and data are stored in a docker voume).

## Authentication

### Enable authentication

In the config file, just uncomment the `Authentication` part and then restart the container.
The default user is `admin/password`.

**You always have to restart if you want the modification to be taken in account:**

```bash
docker-compose restart
```

### Change user password / create a new user

```bash
docker-compose exec mosquitto mosquitto_passwd -b /mosquitto/config/password.txt user password
```

### Delete user

```bash
docker-compose exec mosquitto mosquitto_passwd -D /mosquitto/config/password.txt user
```
