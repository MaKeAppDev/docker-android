# Android Docker Container
This docker is to build Android Gradle project with Java 8. It is available on Docker Hub https://registry.hub.docker.com/u/makeappdev/android/ .  
Originally written by Jacek Marchwicki <jacek.marchwicki@gmail.com> available on  https://registry.hub.docker.com/u/jacekmarchwicki/android/

### Installed Packages
- oracle java 8
- Android SDK: r24.3.4
- Build tools: 23.0.2
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

## Push build version to repository

```bash
docker push makeappdev/android
```

### Sample Usage
```bash
docker run --tty --interactive --volume=$(pwd):/opt/workspace --workdir=/opt/workspace --rm makeappdev/android /bin/sh -c "./gradlew build"
```
