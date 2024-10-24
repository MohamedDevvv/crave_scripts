#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/ProjectBlaze/manifest -b 14 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b main https://github.com/MohamedDevvv/Build- .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Mohamed
export BUILD_HOSTNAME=crave
export TZ=Africa/Cairo
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch blaze_gale-ap3a-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
make bacon
