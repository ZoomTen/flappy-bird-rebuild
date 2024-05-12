Script to repack Flappy Bird so that it may install in Android 14 + arm64, newer Samsung Galaxy devices.

1. Get apktool and `export APKTOOL_DIR` to where you saved it (as `apktool.jar`)
2. Get the Android Build Tools, `export ANDROID_BUILD_TOOLS` to its location
3. Get the Android NDK, `export ANDROID_NDK` to its location
4. Get the original Flappy Bird APK, save it as `com.dotgears.flappybird-1.3-4-minAPI8.apk`.
5. Run `./repack_flappybird.sh`, repacked file is `./flappy.apk`.