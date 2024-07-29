//
//  StandardHexadecimalColorCode.swift
//  
//
//  Created by Jeremy Bannister on 4/25/23.
//

///
public struct StandardHexadecimalColorCode: Hashable {
            
    ///
    public var rgbaColorCode: ColorCode_RGBA_256
    
    ///
    public init(rgba: ColorCode_RGBA_256) {
        
        ///
        self.rgbaColorCode = rgba
    }
}

///
extension StandardHexadecimalColorCode: ExpressibleByStringLiteral {
    
    ///
    public init(stringLiteral: String) {
        
        ///
        if let hexCode = Self(stringLiteral) {
            self = hexCode
        } else {
            self = .black
        }
    }
}

///
extension StandardHexadecimalColorCode: Codable {
    
    ///
    public func encode(to encoder: Encoder) throws {
        
        ///
        try self
            .asHexString
            .encode(to: encoder)
    }
    
    ///
    public init(from decoder: Decoder) throws {
        
        ///
        let string = try String(from: decoder)
        
        ///
        guard let hexCode = StandardHexadecimalColorCode(string) else {
            throw DecodingError
                .dataCorrupted(
                    DecodingError.Context(
                        codingPath: [],
                        debugDescription: "Could not generate hexCode from string: \(string)"
                    )
                )
        }
        
        ///
        self = hexCode
    }
}

///
extension StandardHexadecimalColorCode: CustomStringConvertible {
    
    ///
    public var description: String {
        "#\(self.asHexString)"
    }
}

///
extension StandardHexadecimalColorCode {
    
    ///
    public var asHexString: String {
        rgbaColorCode
            .asHexString
    }
    
    ///
    public init?(_ hexString: String) {
        
        ///
        let trimmedString = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: trimmedString).scanHexInt64(&int)
        
        ///
        let r, g, b, a: UInt64
        switch trimmedString.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255)
        case 6: // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return nil
        }
        
        ///
        func clamped(_ value: UInt64) -> UInt8 {
            UInt8(min(value, UInt64(UInt8.max)))
        }
        
        ///
        self.init(
            rgba: .init(
                red: clamped(r),
                green: clamped(g),
                blue: clamped(b),
                alpha: clamped(a)
            )
        )
    }
}

///
extension StandardHexadecimalColorCode {
    
    ///
    public static var white: Self {
        .init(rgba: .white)
    }
    
    ///
    public static var black: Self {
        .init(rgba: .black)
    }
}

///
extension StandardHexadecimalColorCode {
    
    ///
    public var red: UInt8 {
        rgbaColorCode.red
    }
    
    ///
    public var green: UInt8 {
        rgbaColorCode.green
    }
    
    ///
    public var blue: UInt8 {
        rgbaColorCode.blue
    }
    
    ///
    public var alpha: UInt8 {
        rgbaColorCode.alpha
    }
}
