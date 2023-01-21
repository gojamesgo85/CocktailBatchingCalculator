//
//  BatchButton.swift
//  BigBatch
//
//  Created by James on 11/22/22.
//

import UIKit

class BatchButton: UIButton {

    let colorPalette = ColorPalette()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = colorPalette.green
        setTitle("Batch", for: .normal)
        setTitleColor(.systemGray6, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
