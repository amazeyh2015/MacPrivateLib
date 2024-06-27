import XCTest
@testable import MacPrivateLib

final class MacPrivateLibTests: XCTestCase {
    func testCoreSymbolication() throws {
        openCoreSymbolication()
        
        XCTAssertNotNil(CSIsNull)
        XCTAssertNotNil(CSRetain)
        XCTAssertNotNil(CSRelease)
        
        XCTAssertNotNil(CSArchitectureGetArchitectureForName)
        
        XCTAssertNotNil(CSSymbolicatorCreateWithSignature)
        XCTAssertNotNil(CSSymbolicatorCreateWithPathAndArchitecture)
        XCTAssertNotNil(CSSymbolicatorGetSymbolOwner)
        XCTAssertNotNil(CSSymbolicatorCreateSignature)
        
        XCTAssertNotNil(CSSymbolOwnerGetName)
        XCTAssertNotNil(CSSymbolOwnerGetCFUUIDBytes)
        XCTAssertNotNil(CSSymbolOwnerGetBaseAddress)
        XCTAssertNotNil(CSSymbolOwnerGetSymbolWithAddress)
        XCTAssertNotNil(CSSymbolOwnerGetSourceInfoWithAddress)
        XCTAssertNotNil(CSSymbolOwnerForEachStackFrameAtAddress)
        
        XCTAssertNotNil(CSSymbolGetName)
        XCTAssertNotNil(CSSymbolGetMangledName)
        XCTAssertNotNil(CSSymbolGetRange)
        XCTAssertNotNil(CSSymbolGetRegion)
        
        XCTAssertNotNil(CSRegionGetName)
        
        XCTAssertNotNil(CSSourceInfoGetFilename)
        XCTAssertNotNil(CSSourceInfoGetPath)
        XCTAssertNotNil(CSSourceInfoGetLineNumber)
        XCTAssertNotNil(CSSourceInfoGetColumn)
    }
    
    func testMobileDevice() throws {
        openMobileDevice()
        
        XCTAssertNotNil(AMDeviceNotificationSubscribe)
        XCTAssertNotNil(AMDeviceNotificationSubscribeWithOptions)
        XCTAssertNotNil(AMDeviceNotificationUnsubscribe)
        XCTAssertNotNil(AMDeviceCopyDeviceIdentifier)
        XCTAssertNotNil(AMDeviceCopyValue)
        XCTAssertNotNil(AMDeviceGetInterfaceType)
        XCTAssertNotNil(AMDeviceConnect)
        XCTAssertNotNil(AMDeviceDisconnect)
        XCTAssertNotNil(AMDeviceIsPaired)
        XCTAssertNotNil(AMDeviceStartSession)
        XCTAssertNotNil(AMDeviceStopSession)
        XCTAssertNotNil(AMDeviceSecureStartService)
        XCTAssertNotNil(AMDServiceConnectionGetSocket)
        XCTAssertNotNil(AMDServiceConnectionSend)
        XCTAssertNotNil(AMDServiceConnectionReceive)
        XCTAssertNotNil(AMDServiceConnectionInvalidate)
    }
}
