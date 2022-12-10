//
//  UIColorExtension.swift
//  BigBatch
//
//  Created by James on 12/10/22.
//

import UIKit

extension UIColor {
    static var gradientBatchScreenBegin: UIColor {
        UIColor(named: "gradientBatchScreenBegin") ?? .systemFill
    }
    
    static var gradientBatchScreenEnd: UIColor {
        UIColor(named: "gradientBatchScreenEnd") ?? .quaternarySystemFill
    }
    
    static var gradientSavedBatchesBegin: UIColor {
        UIColor(named: "gradientSavedBatchesBegin") ?? UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    }
    
    static var gradientSavedBatchesEnd: UIColor {
        UIColor(named: "gradientSavedBatchesEnd") ?? UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    }
    
    static var gradientCocktailSpecsBegin: UIColor {
        UIColor(named: "gradientCocktailSpecsBegin") ?? .systemFill
    }
    
    static var gradientCocktailSpecsEnd: UIColor {
        UIColor(named: "gradientCocktailSpecsEnd") ?? .systemCyan
    }
}
