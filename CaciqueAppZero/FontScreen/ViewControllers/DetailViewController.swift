//
//  DetailViewController.swift
//  CaciqueAppZero
//
//  Created by Bruno Neves Oliveira on 15/06/21.
//


import Foundation
import UIKit

class DetailViewController: UIViewController{
    var conceito: TypeConcept?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tituloTipos: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = conceito?.color ?? .white
        
        nameLabel.text = conceito?.text
        self.navigationController?.title = conceito?.title
        tituloTipos.text = conceito?.title
        tituloTipos.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        detailImage.image = conceito?.image
        
        //UIImage(named: "lexico")
//        let htmlString = concept?.text ?? "teste"
//        let data = htmlString.data(using: .utf8)!
//
//        let attributedString = try? NSAttributedString(
//            data: data,
//            options: [.documentType: NSAttributedString.DocumentType.html],
//            documentAttributes: nil)
//
//        nameLabel.attributedText = attributedString
        
    }
}
