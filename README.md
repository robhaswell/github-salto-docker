github-salto-docker
===================

Dockerfile for github-salto.

Usage
-----

The first time this container is run you must generate an auth token.
This is done interactively, so `-ti` must be passed to the `docker run` command.
The token must be stored in a persistent volume.
On the container path for this volume is `/github-salto/data`.

```sh
$ docker run -ti -v /opt/github-salto:/github-salto/data robhaswell/github-salto bin/cm graph auth
Github username: ***
Github password: ***
```

To generate a dependency graph use `bin/cm graph create <username> <repository>`.
The output can be piped to `dot` to output a PDF file.

```sh
$ docker run -v /opt/github-salto:/github-salto/data \
    robhaswell/github-salto bin/cm graph auth myusername myrepository \
    | docker run -i robhaswell/dot -T pdf > graph.pdf
```

See https://github.com/njam/github-salto for more information.
