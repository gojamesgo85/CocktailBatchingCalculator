//
//  BatchSizeType.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit

class TypeLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        tintColor = .label
        layer.cornerRadius = 10
        textAlignment = .right
        backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 0.0)
        textColor = .white
        font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        layer.masksToBounds = true
    }
}
