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
        database.append(FontInfo(name: "Baskerville", family: .romana, hasSerif: true))
        database.append(FontInfo(name: "Arial", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Helvetica", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Helvetica", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "American Typewriter", family: .grotesca, hasSerif: true))
        database.append(FontInfo(name: "Baskerville", family: .grotesca, hasSerif: true))
        database.append(FontInfo(name: "Bodoni Ornaments", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Bradley Hand", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Chalkboard SE", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Chalkduster", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Charter", family: .romana, hasSerif: true))
        database.append(FontInfo(name: "Courier", family: .egipsia, hasSerif: true))
        database.append(FontInfo(name: "Courier New", family: .egipsia, hasSerif: true))
        database.append(FontInfo(name: "Didot", family: .grotesca, hasSerif: true))
        database.append(FontInfo(name: "DIN Alternate", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "DIN Condensed", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Euphemia UCAS", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Futura", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Galvji", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Georgia", family: .grotesca, hasSerif: true))
        database.append(FontInfo(name: "Gill Sans", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Grantha Sangam MN", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Helvetica", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Helvetica Neue", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Hiragino Maru Gothic ProN", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Hiragino Sans", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Kailasa", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Kefa", family: .egipsia, hasSerif: false))
        database.append(FontInfo(name: "Marker Felt", family: .fantasia, hasSerif: false))
        database.append(FontInfo(name: "Menlo", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Snell Roundhand", family: .cursiva, hasSerif: false))
        database.append(FontInfo(name: "Times New Roman", family: .grotesca, hasSerif: false))
        database.append(FontInfo(name: "Zapfino", family: .cursiva, hasSerif: true))
    }
}
