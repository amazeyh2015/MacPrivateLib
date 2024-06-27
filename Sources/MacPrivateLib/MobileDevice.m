//
//  MobileDevice.m
//  
//
//  Created by yuhan on 2024/6/27.
//

#import "MobileDevice.h"
#import "LibraryFoundation.h"

int (*AMDeviceNotificationSubscribe)(AMDeviceNotificationCallback *, int, int, int, AMDeviceNotification **);
int (*AMDeviceNotificationSubscribeWithOptions)(AMDeviceNotificationCallback *, int, int, int, AMDeviceNotification **, CFDictionaryRef);
int (*AMDeviceNotificationUnsubscribe)(AMDeviceNotification *);
CFStringRef (*AMDeviceCopyDeviceIdentifier)(AMDevice *);
CFTypeRef (*AMDeviceCopyValue)(AMDevice *, CFStringRef, CFStringRef);
int (*AMDeviceGetInterfaceType)(AMDevice *);
int (*AMDeviceConnect)(AMDevice *);
int (*AMDeviceDisconnect)(AMDevice *);
int (*AMDeviceIsPaired)(AMDevice *);
int (*AMDeviceStartSession)(AMDevice *);
int (*AMDeviceStopSession)(AMDevice *);
int (*AMDeviceSecureStartService)(AMDevice *, CFStringRef, CFDictionaryRef, AMDeviceServiceConnection **);
int (*AMDServiceConnectionGetSocket)(AMDeviceServiceConnection *);
ssize_t (*AMDServiceConnectionSend)(AMDeviceServiceConnection *, const void *, size_t);
ssize_t (*AMDServiceConnectionReceive)(AMDeviceServiceConnection *, void *, size_t);
void (*AMDServiceConnectionInvalidate)(AMDeviceServiceConnection *);

void openMobileDevice(void) {
    const char *path = "/System/Library/PrivateFrameworks/MobileDevice.framework/MobileDevice";
    openMobileDeviceAt(path);
}

void openMobileDeviceAt(const char *path) {
    void *handle = OpenLazy(path);
    
    AMDeviceNotificationSubscribe = Bind(handle, "AMDeviceNotificationSubscribe");
    AMDeviceNotificationSubscribeWithOptions = Bind(handle, "AMDeviceNotificationSubscribeWithOptions");
    AMDeviceNotificationUnsubscribe = Bind(handle, "AMDeviceNotificationUnsubscribe");
    AMDeviceCopyDeviceIdentifier = Bind(handle, "AMDeviceCopyDeviceIdentifier");
    AMDeviceCopyValue = Bind(handle, "AMDeviceCopyValue");
    AMDeviceGetInterfaceType = Bind(handle, "AMDeviceGetInterfaceType");
    AMDeviceConnect = Bind(handle, "AMDeviceConnect");
    AMDeviceDisconnect = Bind(handle, "AMDeviceDisconnect");
    AMDeviceIsPaired = Bind(handle, "AMDeviceIsPaired");
    AMDeviceStartSession = Bind(handle, "AMDeviceStartSession");
    AMDeviceStopSession = Bind(handle, "AMDeviceStopSession");
    AMDeviceSecureStartService = Bind(handle, "AMDeviceSecureStartService");
    AMDServiceConnectionGetSocket = Bind(handle, "AMDServiceConnectionGetSocket");
    AMDServiceConnectionSend = Bind(handle, "AMDServiceConnectionSend");
    AMDServiceConnectionReceive = Bind(handle, "AMDServiceConnectionReceive");
    AMDServiceConnectionInvalidate = Bind(handle, "AMDServiceConnectionInvalidate");
}
