//
//  LibraryFoundation.m
//  
//
//  Created by yuhan on 2024/6/21.
//

#import "LibraryFoundation.h"
#import <dlfcn.h>

void * Bind(void *handle, const char *name) {
    void *symbol = dlsym(handle, name);
    NSCAssert(symbol != NULL, @"%s", dlerror());
    return symbol;
}

void * Open(const char *path, int mode) {
    void *handle = dlopen(path, mode);
    NSCAssert(handle != NULL, @"%s", dlerror());
    return handle;
}

void * OpenLazy(const char *path) {
    return Open(path, RTLD_LAZY);
}

void * OpenNow(const char *path) {
    return Open(path, RTLD_NOW);
}
