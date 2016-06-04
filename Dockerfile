FROM java:9
MAINTAINER makeappdev <support@makeappdev.com>

# Basic setup
RUN apt-get update -y && apt-get upgrade -y && apt-get -y install git build-essential zip lib32z1 wget curl
RUN apt-get install software-properties-common -y
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --no-install-recommends expect libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5

# Install Gradle
ENV GRADLE_VERSION 2.13
RUN curl -L -O "http://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip" \
    && unzip -q -o "gradle-$GRADLE_VERSION-all.zip" \
    && mv "gradle-$GRADLE_VERSION" "/usr/local/gradle-$GRADLE_VERSION" \
    && rm gradle-$GRADLE_VERSION-all.zip

# Install Android SDK
RUN cd /usr/local && wget --output-document=android-sdk.tgz http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar -xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root.root android-sdk-linux

# Setup environment
ENV GRADLE_HOME "/usr/local/gradle-$GRADLE_VERSION"
ENV PATH $PATH:$GRADLE_HOME/bin
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN echo y | android update sdk --filter platform-tools,build-tools-23.0.3,sys-img-armeabi-v7a-android-23,android-23,extra-android-support,addon-google_apis_x86-google-23,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services --no-ui --all

RUN which adb android gradle

# Create emulator
RUN echo "no" | android create avd \
                --force \
                --device "Nexus 5" \
                --name test \
                --target android-23 \
                --abi armeabi-v7a \
                --skin WVGA800 \
                --sdcard 512M
ENV HOME /root
ADD wait-for-emulator /usr/local/bin/
ADD start-emulator /usr/local/bin/

# Cleaning
RUN apt-get clean
