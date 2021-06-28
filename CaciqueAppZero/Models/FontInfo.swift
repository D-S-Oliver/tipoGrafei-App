//
//  FontInfo.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 23/06/21.
//

import Foundation

struct FontInfo {
    
    var name: String
    var family: FontFamily
    var hasSerif: Bool
    
    public init(name: String, family: FontFamily, hasSerif: Bool) {
        self.name = name
        self.family = family
        self.hasSerif = hasSerif
    }
}
