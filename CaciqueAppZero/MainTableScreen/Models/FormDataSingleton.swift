//
//  FormData.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 26/06/21.
//

import Foundation

class FormDataSingleton {
    
    static var shared: FormDataSingleton = {
        let instance = FormDataSingleton()
        return instance
    }()
    
    var hasSerif: Bool
    var fontFamily: FontFamily
    
    
    private init(){
        self.hasSerif = false
        fontFamily = .romana
    }
}
