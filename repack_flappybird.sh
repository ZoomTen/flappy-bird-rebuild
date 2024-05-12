#!/bin/bash

set -xe

java -jar ${APKTOOL_DIR}/apktool.jar d com.dotgears.flappybird-1.3-4-minAPI8.apk -o unpacked

pushd AndEngine_JNI
make
popd
mkdir -p unpacked/lib/arm64-v8a
cp AndEngine_JNI/libandengine.so unpacked/lib/arm64-v8a/libandengine.so

patch -d unpacked < change_sdk_version.patch

java -jar ${APKTOOL_DIR}/apktool.jar b unpacked -o flappy.unsigned.apk

${ANDROID_BUILD_TOOLS}/apksigner sign \
    --ks $HOME/android_tools/me.keystore \
    --ks-key-alias testKey \
    --ks-pass pass:android \
    --key-pass pass:android \
    --out flappy.apk \
    flappy.unsigned.apk

rm -rfv unpacked