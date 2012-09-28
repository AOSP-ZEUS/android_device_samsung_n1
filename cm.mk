#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := SGR

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/glide/full_glide.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := glide
PRODUCT_NAME := cm_glide
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SGH-I927

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I927 TARGET_DEVICE=SGH-I927 BUILD_FINGERPRINT=samsung/SGH-I927/SGH-I927:4.0.4/IMM76D/UCLG9/Dman3285-test-keys PRIVATE_BUILD_DESC="SGH-I927-eng 4.0.4 IMM76D UCLG9 Dman3285-test-keys"
