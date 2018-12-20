# docker-bionic-vm [![Build Status][travis.svg]][travis] [![Docker Build][docker.svg]][docker]

A lightweight Ubuntu 18.04 Bionic VM in Docker, primarily used for integration testing of Ansible roles.

## Usage

The image and container can be built and started like so:

```
$ docker build -t naftulikay/bionic-vm:latest ./
$ docker run -d --name bionic -v /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged \
      naftulikay/bionic-vm:latest
$ docker exec -it bionic wait-for-boot
```

View [`docker-compose.yml`](./docker-compose.yml) for a working reference on how to build and run the image/container.

## License

Licensed at your discretion under either:

 - [MIT License](./LICENSE-MIT)
 - [Apache License, Version 2.0](./LICENSE-APACHE)

 [docker]: https://hub.docker.com/r/naftulikay/bionic-vm/
 [docker.svg]: https://img.shields.io/docker/automated/naftulikay/bionic-vm.svg?maxAge=2592001
 [travis]: https://travis-ci.org/naftulikay/docker-bionic-vm
 [travis.svg]: https://travis-ci.org/naftulikay/docker-bionic-vm.svg?branch=master
