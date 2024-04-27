# iperf3-ubuntu

Automating an amd64 iperf3 Docker image using Ubuntu as the base image.

## Motivation

I noticed there weren't options for an up to date iperf3 Docker image on Docker Hub. I decided to create one using Ubuntu as the base image, and automate it so it would be continuously updated.

## Build

```bash
docker build -t iperf3-ubuntu:latest .
```

## Run Server

```bash
docker run --rm --name=iperf3-server -p 5201:5201 iperf3-ubuntu:latest -s
```
