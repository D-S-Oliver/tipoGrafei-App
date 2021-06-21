//
//  ConceitoClass.swift
//  CaciqueAppZero
//
//  Created by Bruno Neves Oliveira on 15/06/21.



import Foundation
import UIKit

public class TypeConcept {
    
    var title: String
    var text: String
    var color: UIColor = .white
    var image: UIImage? = nil
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    init(title: String, text: String, color: UIColor, image: UIImage) {
        self.title = title
        self.text = text
        self.color = color
        self.image = image
    }

}

        
