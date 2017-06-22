nodebrew-docker
===============

nodejs for nodebrew for docker

## Usage

install of all major version of last
```bash
$ docker -t nodebrew:full build .

# default use node version is installed last version
$ docker run nodebrew:full nodebrew ls
v0.12.18
io@v1.8.4
io@v2.5.0
io@v3.3.1
v4.8.3
v5.12.0
v6.11.0
v7.10.0
v8.1.2

current: v8.1.2
```

install of stable version.
```bash
$ docker -t nodebrew:full build . --build-arg nv=stable
```

install of any version
```bash
$ docker -t nodebrew:full build . --build-arg nv=any-node-versions unv=use-node-version

# example
$ docker -t nodebrew:full build . --build-arg nv=v8.1.2
```

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2017 Seito Taka


