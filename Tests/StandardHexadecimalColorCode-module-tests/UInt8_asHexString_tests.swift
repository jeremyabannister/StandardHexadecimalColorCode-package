//
//  UInt8_asHexString_tests.swift
//  
//
//  Created by Jeremy Bannister on 4/26/23.
//

///
final class UInt8_tests: XCTestCase {
    
    ///
    func test_asHexString() throws {
        
        ///
        func test(_ int: UInt8, _ expected: String) throws {
            try int
                .asHexString
                .assertEqual(to: expected)
        }
        
        ///
        try test(0, "00")
        try test(1, "01")
        try test(2, "02")
        try test(3, "03")
        try test(4, "04")
        try test(5, "05")
        try test(6, "06")
        try test(7, "07")
        try test(8, "08")
        try test(9, "09")
        
        ///
        try test(10, "0A")
        try test(11, "0B")
        try test(12, "0C")
        try test(13, "0D")
        try test(14, "0E")
        try test(15, "0F")
        try test(16, "10")
        try test(17, "11")
        try test(18, "12")
        try test(19, "13")
        
        ///
        try test(100, "64")
        try test(101, "65")
        try test(102, "66")
        try test(103, "67")
        try test(104, "68")
        try test(105, "69")
        try test(106, "6A")
        try test(107, "6B")
        try test(108, "6C")
        try test(109, "6D")
        
        ///
        try test(246, "F6")
        try test(247, "F7")
        try test(248, "F8")
        try test(249, "F9")
        try test(250, "FA")
        try test(251, "FB")
        try test(252, "FC")
        try test(253, "FD")
        try test(254, "FE")
        try test(255, "FF")
    }
}
