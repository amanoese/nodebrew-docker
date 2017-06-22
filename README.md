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
```

install of any version
```bash
$ docker -t nodebrew:full build . --build-arg nv=anyversions unv=useversion
```

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2017 Seito Taka


