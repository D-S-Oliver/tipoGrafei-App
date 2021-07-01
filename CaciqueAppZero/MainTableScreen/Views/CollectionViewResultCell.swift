//
//  CollectionViewResultCell.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 30/06/21.
//

import Foundation
import UIKit

class CollectionViewResultCell: UICollectionViewCell {
    
    lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        //container.layer.shadowColor = CGColor(gray: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var letterContainerView: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 20
        container.backgroundColor = UIColor(red: 252/255, green: 111/255, blue: 111/255, alpha: 0.52)
        return container
    }()
    
    lazy var letterLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "A"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fontNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Fonte: Nome da Fonte"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var exampleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Exemplo de texto:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var exampleTextView: UITextView = {
        let text = UITextView(frame: .zero)
        text.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus iaculis sagittis nisl, ultricies placerat elit tempus ut. Duis interdum at urna ac rhoncus. In tincidunt ligula eleifend ex pretium, rhoncus interdum sapien rutrum. Morbi eu turpis ex."
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isSelectable = false
        text.layer.shadowColor = .none
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(container)
        container.addSubview(letterContainerView)
        letterContainerView.addSubview(letterLabel)
        container.addSubview(fontNameLabel)
        container.addSubview(exampleLabel)
        container.addSubview(exampleTextView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        let containerConstraints: [NSLayoutConstraint] = [
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ]
        NSLayoutConstraint.activate(containerConstraints)
        
        let letterContainerViewConstraints: [NSLayoutConstraint] = [
            letterContainerView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            letterContainerView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            letterContainerView.heightAnchor.constraint(equalToConstant: 70),
            letterContainerView.widthAnchor.constraint(equalToConstant: 70)
        ]
        NSLayoutConstraint.activate(letterContainerViewConstraints)
        
        let letterLabelConstraints: [NSLayoutConstraint] = [
            letterLabel.centerYAnchor.constraint(equalTo: letterContainerView.centerYAnchor),
            letterLabel.centerXAnchor.constraint(equalTo: letterContainerView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(letterLabelConstraints)
        
        let fontNameLabelConstraints: [NSLayoutConstraint] = [
            fontNameLabel.topAnchor.constraint(equalTo: letterContainerView.bottomAnchor, constant: 16),
            fontNameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(fontNameLabelConstraints)
        
        let exampleLabelConstraints: [NSLayoutConstraint] = [
            exampleLabel.topAnchor.constraint(equalTo: fontNameLabel.bottomAnchor),
            exampleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(exampleLabelConstraints)
        
        let exampleTextViewConstraints: [NSLayoutConstraint] = [
            exampleTextView.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 8),
            exampleTextView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            exampleTextView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            exampleTextView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(exampleTextViewConstraints)
    }
}
