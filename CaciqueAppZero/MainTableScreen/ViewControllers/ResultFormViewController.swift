//
//  ResultFormViewController.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 28/06/21.
//

import Foundation
import UIKit

class ResultFormViewController: UIViewController {
    
    var database: [FontInfo] = FontsDatabase().database
    var formData: FormDataSingleton = .shared
    
    override func viewDidLoad() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        var filteredDatabase = filterDatabase(hasSerif: formData.hasSerif, family: formData.fontFamily)
        print(filteredDatabase)
    }
    
    func filterDatabase(hasSerif: Bool, family: FontFamily) -> [FontInfo] {
        
        var filteredDatabase: [FontInfo] = []
        for font in database {
            
            if font.hasSerif == hasSerif && font.family == family {
                filteredDatabase.append(font)
            }
        }
        return filteredDatabase
    }

}
