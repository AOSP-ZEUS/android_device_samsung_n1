# manual operations made after the ota zip and before the squished final zip
# This script is included in squisher
# It is the final build step (after OTA package)

# set in squisher
# DEVICE_OUT=$ANDROID_BUILD_TOP/out/target/product/galaxyr
# DEVICE_TOP=$ANDROID_BUILD_TOP/device/samsung/galaxyr
# VENDOR_TOP=$ANDROID_BUILD_TOP/vendor/samsung/galaxyr

# Delete unwanted apps
rm -f $REPACK/ota/system/app/FOTAKill.apk
rm -f $REPACK/ota/system/xbin/irssi

# 
