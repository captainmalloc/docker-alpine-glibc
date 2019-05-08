# Alpine 3.9 with Glibc

This small project is for building a custom Docker image based from Alpine 3.9
with Glibc and *C.UTF-8* locale setup.

This image is based on the work done by
[flolvlad](https://github.com/frol/docker-alpine-glibc "frol/docker-alpine-glibc")
and [sgerrand](https://github.com/sgerrand/alpine-pkg-glibc "sgerrand/alpine-pkg-glibc").

It is supposed to be used as a base for tools such as [Conda](https://github.com/conda "conda").

## Usage

Build a custom image using *docker*

```bash
docker build --tag=captainmalloc/alpine_glibc .
```

or use the one available on [DockerHub](https://hub.docker.com "Docker Hub")

```bash
docker pull captainmalloc/alpine_glibc
```

## Release Notes

### Version 1.0 (2019-05-08)

Alpine 3.9 + Glibc 2.29-r0
