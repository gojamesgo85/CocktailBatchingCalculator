//
//  BatchButton.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit

class BatchButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
//        layer.borderWidth = 1
        backgroundColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        setTitle("Batch", for: .normal)
        setTitleColor(.systemGray6, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
