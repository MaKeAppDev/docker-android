FROM java:9
MAINTAINER makeappdev <support@makeappdev.com>

# Basic setup
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install git build-essential zip lib32z1 wget
RUN apt-get install software-properties-common -y
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --no-install-recommends expect libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5

# Install Android SDK
RUN cd /usr/local && wget --output-document=android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar -xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root.root android-sdk-linux

# Setup environment
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN echo y | android update sdk --filter platform-tools,build-tools-23.0.3,sys-img-armeabi-v7a-android-23,android-23,extra-android-support --no-ui --all

RUN which adb
RUN which android

# Create emulator
RUN echo "no" | android create avd \
                --force \
                --device "Nexus 5" \
                --name test \
                --target android-23 \
                --abi armeabi-v7a \
                --skin WVGA800 \
                --sdcard 512M

# Cleaning
RUN apt-get clean
