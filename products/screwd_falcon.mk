# Copyright (C) 2013 ParanoidAndroid Project
# Copyright (C) 2015 Screw'd AOSP
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

# Check for target product

ifeq (screwd_falcon,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/motorola/falcon/aosp_falcon.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_falcon
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G
PRODUCT_MANUFACTURER := motorola

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=falcon \
    BUILD_FINGERPRINT=google/falcon/falcon:6.0.1/MOB30H/2751534:user/release-keys \
    PRIVATE_BUILD_DESC="falcon-user 6.0.1 MOB30H 2751534 release-keys"

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := falcon_defconfig
TARGET_GCC_VERSION_ARM := 4.9
TARGET_KERNEL_TOOLCHAIN_PREFIX := arm-linux-androideabi-

#Optimize-it!!
export STRICT_ALIASING := true
export KRAIT_TUNINGS := true
export ENABLE_GCCONLY := true
export GRAPHITE_OPTS := true
export CLANG_O3 := true
export ENABLE_SANITIZE := true
export USE_PIPE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="FM (sub77)"
