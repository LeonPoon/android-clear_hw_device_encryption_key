#include <android/log.h>
#include "../../vendor/qcom/opensource/cryptfs_hw/cryptfs_hw.h"
#define  LOG_TAG    "mymod"
int main() {
	__android_log_print(ANDROID_LOG_INFO, LOG_TAG, "clear_hw_device_encryption_key");
	int ret = clear_hw_device_encryption_key();
	__android_log_print(ANDROID_LOG_INFO, LOG_TAG, "got: %d", ret);
	return 0;
}
