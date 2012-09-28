#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).

## Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

# proprietary side of the device
#$(call inherit-product-if-exists, vendor/samsung/glide/device-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := glide
PRODUCT_DEVICE := glide
PRODUCT_MODEL := SGH-I927

ifeq ($(TARGET_KERNEL_SOURCE),)
	LOCAL_KERNEL := kernel/samsung/i927
else
	LOCAL_KERNEL := $(TARGET_KERNEL_SOURCE)
endif

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    HoloSpiralWallpaper \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    libOmxVidEnc \
    sec_touchscreen.kcm \
    dexpreopt \
    com.android.future.usb.accessory \
    glideSettings \
    SamsungServiceMode \
    Torch \
    FM \
    Galaxy4 \
    NoiseField \
    PhaseBeam \
    Camera \
    librs_jni \
    libV8 \

# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

# HAL
PRODUCT_PACKAGES += \
    sensors.n1 \
    sensors.tegra \
    lights.n1 \
    lights.tegra \
    gps.n1 \
    gralloc.tegra \
    overlay.tegra

# BT cmdline tools
PRODUCT_PACKAGES += \
    bccmd \
    sdptool \
    hciattach \
    hciconfig \
    hcitool \
    avinfo \

#PRODUCT_PACKAGES += RomUpdater DroidSSHd

# Set true if you want .odex files
DISABLE_DEXPREOPT := false

# INIT-scripts
PRODUCT_COPY_FILES += \
    device/samsung/glide/lpm.rc:root/lpm.rc \
    device/samsung/glide/init.n1.rc:root/init.n1.rc \
    device/samsung/glide/init.n1.usb.rc:root/init.n1.usb.rc \
    device/samsung/glide/ueventd.n1.rc:root/ueventd.n1.rc \
    device/samsung/glide/scripts/lpm_boot_check.sh:system/bin/lpm_boot_check.sh

# debug purpose...
ifeq ($(TARGET_PROVIDES_INIT_RC),true)
    PRODUCT_COPY_FILES += device/samsung/glide/configs/init.rc:root/init.rc
endif

# Prebuilt modules
#     device/samsung/glide/prebuilt/Si4709_driver.ko:root/lib/modules/Si4709_driver.ko

PRODUCT_COPY_FILES += \
    device/samsung/glide/prebuilt/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/glide/prebuilt/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/glide/prebuilt/modules.dep:root/lib/modules/modules.dep

PRODUCT_COPY_FILES += \
    device/samsung/glide/keypad/T9DB:system/T9DB

# Vold and Storage
PRODUCT_COPY_FILES += \
    device/samsung/glide/configs/vold.fstab:system/etc/vold.fstab

# Wifi, BT
PRODUCT_COPY_FILES += \
    device/samsung/glide/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/glide/configs/gps.conf:system/etc/gps.conf \
    device/samsung/glide/configs/sirfgps.conf:system/etc/sirfgps.conf

# Media
PRODUCT_COPY_FILES += \
    device/samsung/glide/configs/media_profiles.xml:system/etc/media_profiles.xml \

# Shell and busybox
PRODUCT_COPY_FILES += \
    device/samsung/glide/configs/profile:system/etc/profile \
    device/samsung/glide/configs/busybox.fstab:system/etc/fstab \

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/glide/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/glide/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/samsung/glide/usr/keylayout/STMPE_keypad.kl:system/usr/keylayout/STMPE_keypad.kl \
    device/samsung/glide/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/glide/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/glide/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/glide/usr/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/glide/usr/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    device/samsung/glide/usr/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    device/samsung/glide/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/samsung/glide/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/samsung/glide/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/samsung/glide/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/samsung/glide/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/samsung/glide/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/samsung/glide/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl \
    device/samsung/glide/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/samsung/glide/usr/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/glide/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/glide/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/glide/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/glide/usr/keychars/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    device/samsung/glide/usr/keychars/sec_key.kcm:system/usr/keychars/sec_key.kcm \
    device/samsung/glide/usr/keychars/STMPE_keypad.kcm:system/usr/keychars/STMPE_keypad.kcm \
    device/samsung/glide/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/samsung/glide/usr/keychars/sec_touchkey.kcm:system/usr/keychars/sec_touchkey.kcm

# IDC files
PRODUCT_COPY_FILES += \
    device/samsung/glide/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc \
    device/samsung/glide/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/samsung/glide/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# Overlay to set device specific parameters
DEVICE_PACKAGE_OVERLAYS := device/samsung/glide/overlay

# The OpenGL ES API level that is basely supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=30 \
    ro.board.platform=tegra \
    ro.sf.lcd_density=240 \
    ro.telephony.sends_barcount=1 \
    ro.com.android.dataroaming=false \
    dalvik.vm.heapsize=64m \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 \
    persist.sys.vold.switchexternal=1

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=yyyy-MM-dd \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=64m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    hwui.render_dirty_regions=false \
    ro.compcache.default=0 \
    media.stagefright.enable-player=false \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=false \
    ro.tether.denied=false \
    ro.flash.resolution=1080

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_LOCALES += hdpi

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available

$(call inherit-product-if-exists, vendor/samsung/glide/glide-vendor-blobs.mk)
