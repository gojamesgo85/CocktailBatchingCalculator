//
//  ColorPalette.swift
//  BigBatch
//
//  Created by James on 1/20/23.
//

import UIKit

struct ColorPalette {
    
    let red = UIColor(red: 219/255, green:7/255, blue: 61/255, alpha: 1.0)
    let green = UIColor(red: 76.5/255, green: 204/255, blue: 153/255, alpha: 1.0)
    let teal = UIColor(red: 142/255, green: 199/255, blue: 210/255, alpha: 1.0)
    let orange = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0)
    let yellow = UIColor(red: 247/255, green: 219/255, blue: 61/255, alpha: 1.0)
    let blue = UIColor(red: 13/255, green: 105/255, blue: 134/255, alpha: 1.0)
    let brown = UIColor(red: 193.57/255, green: 85.71/255, blue: 19.22/255, alpha: 1.0)
    
    let lightOrange = UIColor(red: 255/255, green: 172/255, blue: 79/255, alpha: 1.0)
    let lightBlue = UIColor(red: 78/255, green: 188/255, blue: 252/255, alpha: 1.0)
    let forestGreen = UIColor(red: 63/255, green: 124/255, blue: 69/255, alpha: 1.0)
    let purpleish = UIColor(red: 160/255, green: 54/255, blue: 72/255, alpha: 1.0)
    
    
    func getTableViewColors() -> [UIColor] {
        return [blue,red,orange,lightOrange,forestGreen,blue,red,orange,lightOrange,forestGreen,blue,red,orange,lightOrange,forestGreen,blue]
    }
    
    func getSavedTableViewColors() -> [UIColor] {
        return [teal, blue, red, orange, lightOrange, forestGreen] 
    }
    
}
