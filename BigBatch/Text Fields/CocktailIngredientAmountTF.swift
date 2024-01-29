//
//  OzMlPerIngredientTF.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit

class CocktailIngredientAmountTF: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        textColor = .black
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .headline)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12

        backgroundColor = .white
        autocorrectionType = .no
        keyboardType = .decimalPad
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
