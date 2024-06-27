//
//  MobileDevice.h
//  
//
//  Created by yuhan on 2024/6/27.
//

#import <Foundation/Foundation.h>

typedef struct {} AMDevice;
typedef struct {} AMDeviceNotification;
typedef struct {} AMDeviceServiceConnection;

typedef struct {
    AMDevice *device;
    uint32_t code; // 1: connected 2: disconnected
} AMDeviceNotificationCallbackInfo;

typedef void AMDeviceNotificationCallback(AMDeviceNotificationCallbackInfo *info, void *arguments);

extern int (*AMDeviceNotificationSubscribe)(AMDeviceNotificationCallback *, int, int, int, AMDeviceNotification **);
extern int (*AMDeviceNotificationSubscribeWithOptions)(AMDeviceNotificationCallback *, int, int, int, AMDeviceNotification **, CFDictionaryRef);
extern int (*AMDeviceNotificationUnsubscribe)(AMDeviceNotification *);
extern CFStringRef (*AMDeviceCopyDeviceIdentifier)(AMDevice *);
extern CFTypeRef (*AMDeviceCopyValue)(AMDevice *, CFStringRef, CFStringRef);
extern int (*AMDeviceGetInterfaceType)(AMDevice *);
extern int (*AMDeviceConnect)(AMDevice *);
extern int (*AMDeviceDisconnect)(AMDevice *);
extern int (*AMDeviceIsPaired)(AMDevice *);
extern int (*AMDeviceStartSession)(AMDevice *);
extern int (*AMDeviceStopSession)(AMDevice *);
extern int (*AMDeviceSecureStartService)(AMDevice *, CFStringRef, CFDictionaryRef, AMDeviceServiceConnection **);
extern int (*AMDServiceConnectionGetSocket)(AMDeviceServiceConnection *);
extern ssize_t (*AMDServiceConnectionSend)(AMDeviceServiceConnection *, const void *, size_t);
extern ssize_t (*AMDServiceConnectionReceive)(AMDeviceServiceConnection *, void *, size_t);
extern void (*AMDServiceConnectionInvalidate)(AMDeviceServiceConnection *);

extern void openMobileDevice(void);
extern void openMobileDeviceAt(const char *path);
