//
//  CoreSymbolication.h
//  
//
//  Created by yuhan on 2024/6/21.
//

#import <Foundation/Foundation.h>

typedef struct {
    uint64_t csCppData;
    uint64_t csCppObj;
} CSTypeRef;

typedef struct {
    uint64_t location;
    uint64_t length;
} CSRange;

typedef struct {
    int cpu_type;
    int cpu_subtype;
} CSArchitecture;

typedef CSTypeRef CSSymbolicatorRef;
typedef CSTypeRef CSSymbolOwnerRef;
typedef CSTypeRef CSRegionRef;
typedef CSTypeRef CSSymbolRef;
typedef CSTypeRef CSSourceInfoRef;

extern Boolean (*CSIsNull)(CSTypeRef cs);
extern CSTypeRef (*CSRetain)(CSTypeRef cs);
extern void (*CSRelease)(CSTypeRef cs);

extern CSArchitecture (*CSArchitectureGetArchitectureForName)(const char *name);

extern CSSymbolicatorRef (*CSSymbolicatorCreateWithSignature)(CFDataRef signature);
extern CSSymbolicatorRef (*CSSymbolicatorCreateWithPathAndArchitecture)(const char *path, CSArchitecture architecture);
extern CSSymbolOwnerRef (*CSSymbolicatorGetSymbolOwner)(CSSymbolicatorRef symbolicator);
extern CFDataRef (*CSSymbolicatorCreateSignature)(CSSymbolicatorRef symbolicator);

extern const char * (*CSSymbolOwnerGetName)(CSSymbolOwnerRef owner);
extern const void * (*CSSymbolOwnerGetCFUUIDBytes)(CSSymbolOwnerRef owner);
extern uint64_t (*CSSymbolOwnerGetBaseAddress)(CSSymbolOwnerRef owner);
extern CSSymbolRef (*CSSymbolOwnerGetSymbolWithAddress)(CSSymbolOwnerRef owner, uint64_t address);
extern CSSourceInfoRef (*CSSymbolOwnerGetSourceInfoWithAddress)(CSSymbolOwnerRef owner, uint64_t address);
extern void (*CSSymbolOwnerForEachStackFrameAtAddress)(CSSymbolOwnerRef owner, uint64_t address, id iterator);

extern const char * (*CSSymbolGetName)(CSSymbolRef symbol);
extern const char * (*CSSymbolGetMangledName)(CSSymbolRef symbol);
extern CSRange (*CSSymbolGetRange)(CSSymbolRef symbol);
extern CSRegionRef (*CSSymbolGetRegion)(CSSymbolRef symbol);

extern const char * (*CSRegionGetName)(CSRegionRef region);

extern const char * (*CSSourceInfoGetFilename)(CSSourceInfoRef sourceInfo);
extern const char * (*CSSourceInfoGetPath)(CSSourceInfoRef sourceInfo);
extern uint32_t (*CSSourceInfoGetLineNumber)(CSSourceInfoRef sourceInfo);
extern uint32_t (*CSSourceInfoGetColumn)(CSSourceInfoRef sourceInfo);

extern void openCoreSymbolication(void);
extern void openCoreSymbolicationAt(const char *path);
