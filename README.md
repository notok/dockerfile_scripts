# dockerfile_scripts

## Usage

0. Prepare; Install docker and docker-compose.
1. Configure proxy and other required env vars; Copy and edit sample files.
   - `proxy.compose.env`: For building images(loaded in `recreate.sh`)
     - This file should be located at parent directory of service directory.
   - `proxy.env`: For running container(loaded in `docker-compose.yml`)
     - This file should be located at parent directory of service directory.
   - `<service name>/conf.env`: container/service specific environment variables(loaded in `docker-compose.yml`)
2. Build and run; `cd` to service directory(contains `docker-compose.yml`) and run following command.
   - To create and start containers, and then attach to 'main' container with bash or sh.
     - `<path to>/recreate.sh`
   - To create and start containers, and then watch container log.
     - `<path to>/recreate.sh logs`

> See each script or dockerfile for more details.

## Some commands to clean up

### show disk usage by docker

```
docker system df
```

### remove unused data

This will remove
- all stopped containers
- all networks not used by at least one container
- all dangling images
- all build cache

```
docker system prune
```

### remove dangling images.

```
docker image prune
```

### remove unused images (images that are not associated to container).

```
docker image prune -a
```

### remove stopped containers

```
docker rm $(docker ps -a -q -f status=exited)
```

(filtering to select only stopped ones to avoid warning messages.)

### remove all containers

```
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
```
