//
//  ColorCode_RGBA_256+RandomlyGeneratable.swift
//  
//
//  Created by Jeremy Bannister on 4/26/23.
//

///
extension ColorCode_RGBA_256: RandomlyGeneratable {
    
    ///
    public static func generateRandom() -> Self {
        .init(
            red: .generateRandom(),
            green: .generateRandom(),
            blue: .generateRandom(),
            alpha: .generateRandom()
        )
    }
}
