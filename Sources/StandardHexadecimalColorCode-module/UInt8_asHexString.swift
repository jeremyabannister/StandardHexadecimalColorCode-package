//
//  UInt8_asHexString.swift
//  
//
//  Created by Jeremy Bannister on 4/26/23.
//

///
extension UInt8 {
    
    ///
    public var asHexString: String {
        String(format: "%02X", self)
    }
}
