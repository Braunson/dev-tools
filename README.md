# Webdev tools, containerized

A Docker container with common tools for web development.

## Why

I built this so a friend of mine and me could work on a project with exactly the same toolset.
Also, I was too lazy to document the installation process of each piece of software. Providing
a Dockerfile that can be built with a single command and works consistently well on any Linux
distro is a nice plus.

## Build

```bash
docker built -t dev-tools .
ln -s cli /usr/local/bin/dev-tools
```

## Use

```bash
dev-tools gulp
dev-tools npm install
dev-tools sass --watch sass:css
dev-tools composer install
dev-tools phpunit
# ...
```

## Included software

- node / npm
- gulp
- bower
- sass
- composer
- phpunit

Missing something? Open an issue or make a pull request so we can add it!

