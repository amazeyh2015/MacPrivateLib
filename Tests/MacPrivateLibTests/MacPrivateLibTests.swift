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
    }
}
