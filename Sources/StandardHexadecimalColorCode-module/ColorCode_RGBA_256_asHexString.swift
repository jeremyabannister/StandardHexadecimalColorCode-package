//
//  ColorCode_RGBA_256_asHexString.swift
//  
//
//  Created by Jeremy Bannister on 4/26/23.
//

///
extension ColorCode_RGBA_256 {
    
    ///
    public var asHexString: String {
        red.asHexString
            + green.asHexString
            + blue.asHexString
            + (alpha == 255 ? "" : alpha.asHexString)
    }
}
