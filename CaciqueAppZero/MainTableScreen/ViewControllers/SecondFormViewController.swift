//
//  SecondFormViewController.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 28/06/21.
//

import Foundation
import UIKit

class SecondFormViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var nextPageButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var esteticaPretendida: UILabel!
    
    @IBOutlet weak var descriptionOne: UILabel!
    
    @IBOutlet weak var descriptionTwo: UILabel!
    
   
    
    
    var families: [String] = ["Cursiva", "Romana", "Gótica", "Egípcia", "Grotesca", "Fantasia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPage = 1
        
        esteticaPretendida.font = UIFont.boldSystemFont(ofSize: 25.0)
        descriptionOne.font = descriptionOne.font.withSize(20)
        descriptionTwo.font = descriptionTwo.font.withSize(20)
        
        

    }
}


extension SecondFormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return families.count
    }
}

extension SecondFormViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = families[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let familyString: String = families[row]
        let singleton = FormDataSingleton.shared
        
        switch familyString {
        case "Cursiva":
            singleton.fontFamily = .cursiva
        case "Romana":
            singleton.fontFamily = .romana
        case "Gótica":
            singleton.fontFamily = .gotica
        case "Egípcia":
            singleton.fontFamily = .egipsia
        case "Grotesca":
            singleton.fontFamily = .grotesca
        case "Fantasia":
            singleton.fontFamily = .fantasia
        default:
            singleton.fontFamily = .cursiva
        }
    }
    
}


