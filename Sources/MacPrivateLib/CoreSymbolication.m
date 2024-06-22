//
//  CoreSymbolication.m
//  
//
//  Created by yuhan on 2024/6/21.
//

#import "CoreSymbolication.h"
#import "LibraryFoundation.h"

Boolean (*CSIsNull)(CSTypeRef cs);
CSTypeRef (*CSRetain)(CSTypeRef cs);
void (*CSRelease)(CSTypeRef cs);

CSArchitecture (*CSArchitectureGetArchitectureForName)(const char *name);

CSSymbolicatorRef (*CSSymbolicatorCreateWithSignature)(CFDataRef signature);
CSSymbolicatorRef (*CSSymbolicatorCreateWithPathAndArchitecture)(const char *path, CSArchitecture architecture);
CSSymbolOwnerRef (*CSSymbolicatorGetSymbolOwner)(CSSymbolicatorRef symbolicator);
CFDataRef (*CSSymbolicatorCreateSignature)(CSSymbolicatorRef symbolicator);

const char * (*CSSymbolOwnerGetName)(CSSymbolOwnerRef owner);
const void * (*CSSymbolOwnerGetCFUUIDBytes)(CSSymbolOwnerRef owner);
uint64_t (*CSSymbolOwnerGetBaseAddress)(CSSymbolOwnerRef owner);
CSSymbolRef (*CSSymbolOwnerGetSymbolWithAddress)(CSSymbolOwnerRef owner, uint64_t address);
CSSourceInfoRef (*CSSymbolOwnerGetSourceInfoWithAddress)(CSSymbolOwnerRef owner, uint64_t address);
void (*CSSymbolOwnerForEachStackFrameAtAddress)(CSSymbolOwnerRef owner, uint64_t address, id iterator);

const char * (*CSSymbolGetName)(CSSymbolRef symbol);
const char * (*CSSymbolGetMangledName)(CSSymbolRef symbol);
CSRange (*CSSymbolGetRange)(CSSymbolRef symbol);
CSRegionRef (*CSSymbolGetRegion)(CSSymbolRef symbol);

const char * (*CSRegionGetName)(CSRegionRef region);

const char * (*CSSourceInfoGetFilename)(CSSourceInfoRef sourceInfo);
const char * (*CSSourceInfoGetPath)(CSSourceInfoRef sourceInfo);
uint32_t (*CSSourceInfoGetLineNumber)(CSSourceInfoRef sourceInfo);

void openCoreSymbolication(void) {
    const char *path = "/System/Library/PrivateFrameworks/CoreSymbolication.framework/Versions/A/CoreSymbolication";
    openCoreSymbolicationAt(path);
}

void openCoreSymbolicationAt(const char *path) {
    void *handle = OpenLazy(path);
    
    CSIsNull = Bind(handle, "CSIsNull");
    CSRetain = Bind(handle, "CSRetain");
    CSRelease = Bind(handle, "CSRelease");
    
    CSArchitectureGetArchitectureForName = Bind(handle, "CSArchitectureGetArchitectureForName");
    
    CSSymbolicatorCreateWithSignature = Bind(handle, "CSSymbolicatorCreateWithSignature");
    CSSymbolicatorCreateWithPathAndArchitecture = Bind(handle, "CSSymbolicatorCreateWithPathAndArchitecture");
    CSSymbolicatorGetSymbolOwner = Bind(handle, "CSSymbolicatorGetSymbolOwner");
    CSSymbolicatorCreateSignature = Bind(handle, "CSSymbolicatorCreateSignature");
    
    CSSymbolOwnerGetName = Bind(handle, "CSSymbolOwnerGetName");
    CSSymbolOwnerGetCFUUIDBytes = Bind(handle, "CSSymbolOwnerGetCFUUIDBytes");
    CSSymbolOwnerGetBaseAddress = Bind(handle, "CSSymbolOwnerGetBaseAddress");
    CSSymbolOwnerGetSymbolWithAddress = Bind(handle, "CSSymbolOwnerGetSymbolWithAddress");
    CSSymbolOwnerGetSourceInfoWithAddress = Bind(handle, "CSSymbolOwnerGetSourceInfoWithAddress");
    CSSymbolOwnerForEachStackFrameAtAddress = Bind(handle, "CSSymbolOwnerForEachStackFrameAtAddress");
    
    CSSymbolGetName = Bind(handle, "CSSymbolGetName");
    CSSymbolGetMangledName = Bind(handle, "CSSymbolGetMangledName");
    CSSymbolGetRange = Bind(handle, "CSSymbolGetRange");
    CSSymbolGetRegion = Bind(handle, "CSSymbolGetRegion");
    
    CSRegionGetName = Bind(handle, "CSRegionGetName");
    
    CSSourceInfoGetFilename = Bind(handle, "CSSourceInfoGetFilename");
    CSSourceInfoGetPath = Bind(handle, "CSSourceInfoGetPath");
    CSSourceInfoGetLineNumber = Bind(handle, "CSSourceInfoGetLineNumber");
}
