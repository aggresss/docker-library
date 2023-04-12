# docker-library

[![](https://img.shields.io/docker/pulls/aggresss/elementary.svg)](https://hub.docker.com/r/aggresss/elementary/)
[![](https://img.shields.io/docker/stars/aggresss/elementary.svg)](https://hub.docker.com/r/aggresss/elementary/)

---

## Recommand Launch Command:

### Linux

```bash
docker volume create root
DOCKER_HOST=$(docker network inspect --format='{{range .IPAM.Config}}{{.Gateway}}{{end}}' bridge)
xhost +local:docker
docker run --rm -it \
    --add-host=host.docker.internal:${DOCKER_HOST} \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v root:/root \
    -e DISPLAY \
    elementary:bionic
```

### MacOS

```bash
docker volume create root
xhost +localhost
docker run --rm -it \
    -v root:/root \
    -e DISPLAY=host.docker.internal:0 \
    elementary:bionic
```

> XQuartz on MacOS is recommended.

> - [x] XQuartz Preferences -> Security -> Allow connections from network clients

### Windows

```bash
docker volume create root
docker run --rm -it \
    -v root:/root \
    -e DISPLAY=host.docker.internal:0 \
    elementary:bionic
```

> Xming on Windows is recommended.

---

## Distribution Declare

| Distribution | Codename | Kernel | libc | gcc | binutils |
|:------------:|:------:|:----:|:-----------:|:------:|:----:|
| Ubuntu 14.04 | Trusty | 4.4  | EGLIBC 2.19 | 4.8.0  | 2.24 |
| Ubuntu 16.04 | Xenial | 4.4  | GLIBC 2.23  | 5.4.0  | 2.26 |
| Ubuntu 18.04 | Bionic | 5.0  | GLIBC 2.27  | 7.5.0  | 2.30 |
| Ubuntu 20.04 | Focal  | 5.4  | GLIBC 2.31  | 9.3.0  | 2.34 |
| Ubuntu 22.04 | Jammy  | 5.17 | GLIBC 2.35  | 11.2.0 | 2.38 |


| Distribution | Codename | Kernel | libc | gcc | binutils |
|:---------:|:--------:|:----:|:----------:|:-----:|:----:|
| Debian 7  | Wheezy   | -    | GLIBC -    | -     | -    |
| Debian 8  | Jessie   | 3.16 | GLIBC 2.19 | 4.9.2 | 2.25 |
| Debian 9  | Stretch  | 4.9  | GLIBC 2.24 | 6.3.0 | 2.28 |
| Debian 10 | Buster   | -    | GLIBC -    | -     | -    |
| Debian 11 | Bullseye | -    | GLIBC -    | -     | -    |

