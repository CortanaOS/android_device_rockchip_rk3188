$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
include device/rockchip/rk3188/BoardConfig.mk
$(call inherit-product, device/rockchip/rk3188/device.mk)
PRODUCT_BRAND := rockchip
PRODUCT_DEVICE := rk3188
PRODUCT_NAME := rk3188
PRODUCT_MANUFACTURER := Newsmy
PRODUCT_MODEL := CarPad-II-P

# Get the long list of APNs
PRODUCT_COPY_FILES += device/rockchip/rk3188/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += device/rockchip/rk3188/phone/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.version = 1.0.9 \
	ro.product.ota.host = 220.168.57.230:8888

