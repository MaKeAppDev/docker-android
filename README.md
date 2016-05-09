# Android Docker Container
This docker is to build Android Gradle project with Java 8. It is available on Docker Hub https://registry.hub.docker.com/u/makeappdev/android/

### Installed Packages
- oracle java 8
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

## Push build version to repository

```bash
docker push makeappdev/android
```

## License

Apache License v2

```
Copyright (C) 2016 MaKeAppDev, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
```
