# About this repo
This repo contains the scripts required to build
[python-cassandra-driver](https://hub.docker.com/r/intezer/python-cassandra-driver/) image.

# Supported tags
Tag has two formats:
1. *{python-image-tag}*-*{driver-version}*
2. *{python-image-tag}* where the driver version is the latest

The latest tag will always be the latest python image and the latest driver version.

For example:
* intezer/python-cassandra-driver:3.6.3-3.9.0 _(python:3.6.3, driver:3.9.0)_
* intezer/python-cassandra-driver:3.6.3-3.8.1 _(python:3.6.3, driver:3.8.1)_
* intezer/python-cassandra-driver:3.6.3 _(python:3.6.3, driver:3.9)_
* intezer/python-cassandra-driver:3.5 _(python:3.5, driver:3.9.0)_
* intezer/python-cassandra-driver:3 _(python:3, driver:3.9.0)_
* intezer/python-cassandra-driver _(python:latest, driver:3.9.0)_

The source Dockerfile can be found [here](https://github.com/intezer/python-cassandra-driver/blob/master/Dockerfile).

The full python tags list can be found [here](https://github.com/intezer/python-cassandra-driver/blob/master/python-versions.txt).

The full driver tags list can be found [here](https://github.com/intezer/python-cassandra-driver/blob/master/driver-versions.txt).

# Migrating to the image
The image aim to be a drop-in replacement for the [python](https://hub.docker.com/_/python/) image so every every
python tag has an equivalent same tag. If you are using the latest version, all you need to do is the change the `FROM` statement.

# Notes
1. The image is installing `libev` to enable `libev` event loop. For further information please refer to the appropriate
[section](http://datastax.github.io/python-driver/installation.html#libev-support) in the driver's documentation.
2. Issues can be filed in the [github repository](https://github.com/intezer/python-cassandra-driver).
