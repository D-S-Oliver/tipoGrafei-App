//
//  FontsDatabase.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 26/06/21.
//

import Foundation

class FontsDatabase {
    
    var database: [FontInfo]
    
    
    public init() {
        database = []
        database.append(FontInfo(name: "New York Large", family: .romana, hasSerif: true))
        database.append(FontInfo(name: "Arial", family: .grotesca, hasSerif: false))
    }
}
