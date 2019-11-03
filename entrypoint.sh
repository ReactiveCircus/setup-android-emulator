#!/bin/sh -l

API_LEVEL=$1

# Install emulator and platform tools for $API_LEVEL
$ANDROID_HOME/tools/bin/sdkmanager "system-images;android-${API_LEVEL};${IMG_TYPE};${SYS_IMG}" "platforms;android-${API_LEVEL}" "emulator"

# Create a new instance of AVD and start the emulator headless mode
$ANDROID_HOME/tools/bin/avdmanager create avd --force --name "api-${API_LEVEL}" --abi "${IMG_TYPE}/${SYS_IMG}" --package "system-images;android-${API_LEVEL};${IMG_TYPE};${SYS_IMG}" --device "Nexus 6P"
$ANDROID_HOME/emulator/emulator -avd "api-${API_LEVEL}" -gpu swiftshader -no-window -no-snapshot -noaudio -no-boot-anim &
$ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done; input keyevent 82'
$ANDROID_HOME/platform-tools/adb shell settings put global window_animation_scale 0.0
$ANDROID_HOME/platform-tools/adb shell settings put global transition_animation_scale 0.0
$ANDROID_HOME/platform-tools/adb shell settings put global animator_duration_scale 0.0

