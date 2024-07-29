//
//  ColorCode_RGBA_256_asHexString_tests.swift
//  
//
//  Created by Jeremy Bannister on 4/26/23.
//

///
final class ColorCode_RGBA_256_tests: XCTestCase {
    
    ///
    func test_asHexString() throws {
        
        ///
        func test(_ r: UInt8, _ g: UInt8, _ b: UInt8, _ a: UInt8, _ expected: String) throws {
            try ColorCode_RGBA_256(red: r, green: g, blue: b, alpha: a)
                .asHexString
                .assertEqual(to: expected)
        }
        
        ///
        try test(0, 0, 0, 255, "000000")
        try test(10, 0, 0, 255, "0A0000")
        try test(100, 0, 0, 255, "640000")
        try test(100, 10, 0, 255, "640A00")
        try test(100, 10, 188, 255, "640ABC")
        
        ///
        try test(0, 0, 0, 200, "000000C8")
        try test(10, 0, 0, 200, "0A0000C8")
        try test(100, 0, 0, 200, "640000C8")
        try test(100, 10, 0, 200, "640A00C8")
        try test(100, 10, 188, 200, "640ABCC8")
    }
}
