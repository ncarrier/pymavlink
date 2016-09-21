LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_HOST_MODULE := mavgen

mavgen_files := \
	$(call all-files-under,.,.py) \
	$(call all-files-under,.,.xsd) \
	$(call all-files-under,.,.h) \
	$(call all-files-under,message_definitions,.xml)

# Install files in host staging directory
LOCAL_COPY_FILES := \
	$(foreach __f,$(mavgen_files), \
		$(__f):$(HOST_OUT_STAGING)/usr/lib/mavgen/$(__f) \
	)

# Needed to force a build order of LOCAL_COPY_FILES
LOCAL_EXPORT_PREREQUISITES := \
	$(foreach __f,$(mavgen_files), \
		$(HOST_OUT_STAGING)/usr/lib/mavgen/$(__f) \
	)

include $(BUILD_CUSTOM)

