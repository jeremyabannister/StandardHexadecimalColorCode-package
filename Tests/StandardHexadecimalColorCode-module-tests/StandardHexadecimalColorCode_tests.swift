struct StandardHexadecimalColorCode_tests {
    typealias Subject = StandardHexadecimalColorCode
    
    @Test
    func conformances() {
        func imagine(subject: Subject) {
            let _: any Hashable = subject
            let _: any Sendable = subject
        }
    }
    
    @Test
    func init_rgba() {
        func randomizedTest() {
            let rgba: ColorCode_RGBA_256 = .generateRandom()
            
            try! Subject(
                rgba: rgba
            )
                .assert(\.rgbaColorCode, equals: rgba)
        }
        
        for _ in (0 ... 1_000) {
            randomizedTest()
        }
    }
}

extension StandardHexadecimalColorCode_tests {
    @Test
    func description() {
        try! Subject("A07F2B")
            .description
            .assertEqual(to: "#A07F2B")
    }
}

extension StandardHexadecimalColorCode_tests {
    @Test
    func asHexString() {
        func testSingleSetOfValues(values red: UInt8, _ green: UInt8, _ blue: UInt8, _ alpha: UInt8, expected: String) throws {
            try Subject(rgba: .init(red: red, green: green, blue: blue, alpha: alpha))
                .asHexString
                .assertEqual(to: expected)
        }
        func test(_ red: UInt8, _ green: UInt8, _ blue: UInt8, _ expected: String) throws {
            func test(alpha: UInt8, _ expectedAlphaComponent: String) throws {
                try testSingleSetOfValues(
                    values: red, green, blue, alpha,
                    expected: expected + expectedAlphaComponent
                )
            }
            
            try test(alpha: 0, "00")
            try test(alpha: 1, "01")
            try test(alpha: 254, "FE")
            try test(alpha: 255, "")
        }
        func testSingleNumber(_ number: UInt8, _ expected: String) throws {
            try test(number, 0, 0, "\(expected)0000")
            try test(0, number, 0, "00\(expected)00")
            try test(0, 0, number, "0000\(expected)")
        }
        
        try! test(0, 0, 0, "000000")
        try! testSingleNumber(1, "01")
        try! testSingleNumber(2, "02")
        try! testSingleNumber(9, "09")
        try! testSingleNumber(10, "0A")
        try! testSingleNumber(11, "0B")
        try! testSingleNumber(15, "0F")
        try! testSingleNumber(16, "10")
        try! testSingleNumber(17, "11")
        try! testSingleNumber(16, "10")
        try! testSingleNumber(31, "1F")
        try! testSingleNumber(32, "20")
        try! testSingleNumber(160, "A0")
        try! testSingleNumber(161, "A1")
        try! testSingleNumber(170, "AA")
        try! testSingleNumber(176, "B0")
        try! testSingleNumber(187, "BB")
        try! testSingleNumber(254, "FE")
        try! testSingleNumber(255, "FF")
        try! test(125, 208, 215, "7DD0D7")
    }
    
    func failable_init_String() throws {
        func randomizedTest() throws {
            let rgba = ColorCode_RGBA_256.generateRandom()
            
            try! Subject(rgba.asHexString)
                .assertEqual(to: .init(rgba: rgba))
        }
        
        for _ in (0 ... 1_000) {
            try randomizedTest()
        }
    }
}

extension StandardHexadecimalColorCode: SupportsArbitraryAssertions { }
