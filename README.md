# Studio3TInDocker

## Environnement

OS: Lunix 5.15.0-40-generic Ubuntu 22.04 LTS

Docker version 20.10.17
Docker utilisable en tant que non-adminstrateur.

Répertoire .3T existant contenant l'environnement robo-3t

## Build
```
export UID=`id -u`
export GID=`id -g`

docker compose build
```

## Run
```
docker compose up
```
