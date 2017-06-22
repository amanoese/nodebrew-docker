nodebrew-docker
===============

nodejs for nodebrew for docker

## Usage

install of all major version of last
```bash
$ docker -t nodebrew:full build .
```

install of stable version
```bash
$ docker -t nodebrew:full build . --build-arg nv=stable
#default use node version is installed last version
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


