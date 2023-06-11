BUNDLE_NAME = SpeedyAnimsPreferences

$(BUNDLE_NAME)_FILES = $(wildcard Controllers/*.m Cells/*.m)
$(BUNDLE_NAME)_INSTALL_PATH = /Library/PreferenceBundles
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc -DTHEOS_LEAN_AND_MEAN
$(BUNDLE_NAME)_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
