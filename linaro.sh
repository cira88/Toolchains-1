#!/bin/sh

mkdir ~/android/kernel/toolchains/tmp

D=`mktemp -d ~/android/kernel/toolchains/tmp/TCXXXXXX`

[ -z "$D" ] && exit 1

cd "$D"

wget --no-check-certificate https://android-build.linaro.org/jenkins/view/Toolchain/job/linaro-android_toolchain-4.6-bzr/lastSuccessfulBuild/artifact/build/out/android-toolchain-eabi-4.6-daily-linux-x86.tar.bz2

wget --no-check-certificate https://android-build.linaro.org/jenkins/view/Toolchain/job/linaro-android_toolchain-4.7-bzr/lastSuccessfulBuild/artifact/build/out/android-toolchain-eabi-4.7-daily-linux-x86.tar.bz2

wget --no-check-certificate https://android-build.linaro.org/jenkins/view/Toolchain/job/linaro-android_toolchain-trunk/lastSuccessfulBuild/artifact/build/out/android-toolchain-eabi-trunk-daily-linux-x86.tar.bz2

wget --no-check-certificate http://releases.linaro.org/12.11/components/android/toolchain/4.7/android-toolchain-eabi-linaro-4.7-2012.11-1-2012-11-16_21-55-58-linux-x86.tar.bz2

wget --no-check-certificate https://android-build.linaro.org/jenkins/view/Toolchain/job/linaro-android_toolchain-4.8-bzr/lastSuccessfulBuild/artifact/build/out/android-toolchain-eabi-4.8-daily-linux-x86.tar.bz2

cd ~/android/kernel/toolchains
rm -rf android-toolchain-eabi

tar xf "$D"/android-toolchain-eabi-4.6-daily-linux-x86.tar.bz2

rm -rf android-toolchain-4.6

mv android-toolchain-eabi android-toolchain-4.6

rm -rf android-toolchain-eabi android-toolchain-4.7

tar xf "$D"/android-toolchain-eabi-4.7-daily-linux-x86.tar.bz2

mv android-toolchain-eabi android-toolchain-4.7

rm -rf android-toolchain-eabi android-toolchain-trunk

tar xf "$D"/android-toolchain-eabi-trunk-daily-linux-x86.tar.bz2

mv android-toolchain-eabi android-toolchain-trunk

tar xf "$D"/android-toolchain-eabi-4.8-daily-linux-x86.tar.bz2

mv android-toolchain-eabi android-toolchain-4.8

rm -rf "$D"
