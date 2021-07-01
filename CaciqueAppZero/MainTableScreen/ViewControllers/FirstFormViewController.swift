//
//  FirstFormViewController.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 28/06/21.
//

import Foundation
import UIKit

class FirstFormViewController: UIViewController {
    
    
    @IBOutlet weak var buttonSerifa: UIView!
    
    @IBOutlet weak var buttonNoSerifa: UIView!
    
    @IBOutlet weak var labelSerifa: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextPageButton: UIButton!
    
    weak var parentController: UIPageViewController? = nil
    
    @IBOutlet weak var labelNoSerif: UILabel!
    
    var formData = FormDataSingleton.shared
    
    override func viewDidLoad() {
        
        buttonSerifa.layer.cornerRadius = 22;
        buttonSerifa.layer.masksToBounds = true;
        
        buttonNoSerifa.layer.cornerRadius = 22;
        buttonNoSerifa.layer.masksToBounds = true;
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapEventDetected(gesture:)))
        buttonSerifa.addGestureRecognizer(gesture)
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(tapEventDetected2(gesture:)))
        
        buttonNoSerifa.addGestureRecognizer(gesture2)
       // buttonNoSerifa.addGestureRecognizer(gesture)
        buttonSerifa.backgroundColor = .white
        
        labelSerifa.font = UIFont(name: "Baskerville", size: 48)
        
        buttonSerifa.backgroundColor = .white
        labelSerifa.textColor = .black
        buttonNoSerifa.backgroundColor = .tipoGrafeiRed
        labelNoSerif.textColor = .white
        formData.hasSerif = false
        
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPage = 0
        
        
        
        
        
        
        

    }
    
        @objc func tapEventDetected(gesture:UITapGestureRecognizer){
            

                if gesture.state == .ended{

                    buttonSerifa.backgroundColor = .tipoGrafeiRed
                    labelSerifa.textColor = .white
                    buttonNoSerifa.backgroundColor = .white
                    labelNoSerif.textColor = .black
                    formData.hasSerif = true
                }
        }
        @objc func tapEventDetected2(gesture:UITapGestureRecognizer){
        

            if gesture.state == .ended{

                buttonSerifa.backgroundColor = .white
                labelSerifa.textColor = .black
                buttonNoSerifa.backgroundColor = .tipoGrafeiRed
                labelNoSerif.textColor = .white
                formData.hasSerif = false

                
                
     }
    }
    
}
