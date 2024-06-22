//
//  LibraryFoundation.h
//  
//
//  Created by yuhan on 2024/6/21.
//

#import <Foundation/Foundation.h>

extern void * Bind(void *handle, const char *name);
extern void * Open(const char *path, int mode);
extern void * OpenLazy(const char *path);
extern void * OpenNow(const char *path);
