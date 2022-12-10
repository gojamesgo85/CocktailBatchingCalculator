//
//  CAGradientLayer+ListStyle.swift
//  BigBatch
//
//  Created by James on 12/10/22.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ViewStyles, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ViewStyles) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .batchScreen:
            beginColor = .gradientBatchScreenBegin
            endColor = .gradientBatchScreenEnd
        case .savedBatches:
            beginColor = .gradientSavedBatchesBegin
            endColor = .gradientSavedBatchesEnd
        case .cocktailSpecs:
            beginColor = .gradientCocktailSpecsBegin
            endColor = .gradientCocktailSpecsEnd
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
}
