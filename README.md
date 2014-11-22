# Front end tools, containerized

A Docker container with tools for front-end web development.

## Why

I built this so a friend of mine and me could work on a project with exactly the same toolset.
Also, I was too lazy to document the installation process of each piece of software. Providing
a Dockerfile that can be built with a single command and works consistently well on any Linux
distro is a nice plus.

## Build

```bash
docker built -t front-end .
```

## Use

```bash
./cli gulp
./cli npm install
./cli sass --watch sass:css
# ...
```

## Included software

- node / npm
- gulp
- bower
- sass

Missing something? Open an issue or make a pull request so we can add it!

