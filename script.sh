#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# remove device tree
rm -rf device/xiaomi/ziyi
rm -rf device/xiaomi/sm8450-common
rm -rf kernel/xiaomi/sm8450
rm -rf kernel/xiaomi/sm8450-devicetrees
rm -rf kernel/xiaomi/sm8450-modules
rm -rf vendor/xiaomi/ziyi
rm -rf vendor/xiaomi/zsm8450-common
rm -rf hardware/xiaomi

# Initialize ROM manifest
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs

# cloning device local_manifests 
git clone https://github.com/pedropereira22/local_manifests .repo/local_manifests

# Sync the repo with force to ensure a clean sync
/opt/crave/resync.sh

# Set up th build environment
. build/envsetup.sh

# Choose the target device
riseup ziyi userdebug

# Build the ROM (use mka bacon for a full build)
# signed build
gk -f
rise sb
