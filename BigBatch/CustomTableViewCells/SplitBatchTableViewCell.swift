//
//  SplitBatchTableViewCell.swift
//  BigBatch
//
//  Created by James on 12/20/22.
//

import UIKit

class SplitBatchTableViewCell: UITableViewCell {

    
    let ingredientNameField: UILabel = {
        let ingredientLabel = TypeLabel()
        ingredientLabel.textAlignment = .center
        ingredientLabel.backgroundColor = .clear
        ingredientLabel.textColor = .white
        return ingredientLabel
        
    }()
    
    let amountLabel: UILabel = {
        let amountField = TypeLabel()
        amountField.textAlignment = .center
        amountField.backgroundColor = .clear
        amountField.textColor = .white
        return amountField

    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ingredientNameField)
        contentView.addSubview(amountLabel)
        ingredientNameField.layer.borderWidth = 0
        ingredientNameField.minimumScaleFactor = 12
        amountLabel.layer.borderWidth = 0
        ingredientNameField.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            ingredientNameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            ingredientNameField.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor),
            ingredientNameField.heightAnchor.constraint(equalToConstant: 50),
            ingredientNameField.centerYAnchor.constraint(equalTo: centerYAnchor),
          
            
            
            amountLabel.leadingAnchor.constraint(equalTo: ingredientNameField.trailingAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            amountLabel.heightAnchor.constraint(equalToConstant: 50),
            amountLabel.widthAnchor.constraint(equalToConstant: 125),
            amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
