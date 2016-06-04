# Android Emulator Docker Container
[![Build Status](https://travis-ci.org/MaKeAppDev/docker-android.svg)](https://travis-ci.org/MaKeAppDev/docker-android) [![Docker Pulls](https://img.shields.io/docker/pulls/makeappdev/android.svg)](https://hub.docker.com/r/makeappdev/android/)

### Installed Packages
- open jdk 9
- Gradle 2.13
- Android SDK: r24.4.1
- Build tools: 23.0.3
- Android API: 23
- Support maven repository
- Google maven repository
- Arm emulator: v23
- Platform tools
- Created emulator image named: "Nexus 5"

## Build image

```bash
docker build -t makeappdev/android .
```
