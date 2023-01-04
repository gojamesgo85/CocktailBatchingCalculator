//
//  CocktailSpecsTableViewCell.swift
//  BigBatch
//
//  Created by James on 12/12/22.
//

import UIKit

class CocktailSpecsTableViewCell: UITableViewCell {

    static let identifier = "CocktailSpecsCell"
    
    let ozTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .blue
        textField.isEnabled = true
        textField.textAlignment = .center
        return textField
        
    }()
    
    let ozOfLable: UILabel = {
        let ozOfLable = UILabel()
        ozOfLable.textColor = .white
        ozOfLable.backgroundColor = .clear
        ozOfLable.text = "oz."
        ozOfLable.font = .systemFont(ofSize: 16, weight: .semibold)
        ozOfLable.textAlignment = .center
        return ozOfLable
    }()
    
    let specsIngredientTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .blue
        textField.isEnabled = true
        textField.textAlignment = .center
        
        return textField
        
    }()
    
    let atLable: UILabel = {
        let atLable = UILabel()
        atLable.textColor = .white
        atLable.backgroundColor = .clear
        atLable.font = .systemFont(ofSize: 16, weight: .semibold)
        atLable.text = "at"
        atLable.textAlignment = .center
        return atLable
    }()
    
    let abvTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .blue
        textField.isEnabled = true
        textField.textAlignment = .center
        return textField
        
    }()
    
    let percentABV: UILabel = {
        let percentABVLable = UILabel()
        percentABVLable.textColor = .white
        percentABVLable.backgroundColor = .clear
        percentABVLable.font = .systemFont(ofSize: 16, weight: .semibold)
        percentABVLable.text = "%ABV"
        percentABVLable.textAlignment = .center
        return percentABVLable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(red: 0.5, green: 0.3, blue: 0.8, alpha: 0.1)
        contentView.addSubview(ozTextField)
        contentView.addSubview(ozOfLable)
        contentView.addSubview(specsIngredientTextField)
        contentView.addSubview(atLable)
        contentView.addSubview(abvTextField)
        contentView.addSubview(percentABV)
        
        ozTextField.borderStyle = .roundedRect
        specsIngredientTextField.borderStyle = .roundedRect
        abvTextField.borderStyle = .roundedRect
        
        contentView.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        ozTextField.frame = CGRect(x: 10,
                                  y: 5,
                                  width: 50,
                                  height: contentView.frame.size.height-10)
        
        ozOfLable.frame = CGRect(x: 20+Int(ozTextField.frame.size.width),
                                 y: 5,
                                 width: 30,
                                 height: Int(contentView.frame.size.height)-10)
        
        
        specsIngredientTextField.frame = CGRect(x: 30+ozTextField.frame.size.width+ozOfLable.frame.size.width,
                                       y: 5,
                                       width: 100,
                                       height: contentView.frame.size.height-10)
        
        atLable.frame = CGRect(x: 40+ozTextField.frame.size.width+ozOfLable.frame.size.width+specsIngredientTextField.frame.size.width,
                               y: 5,
                               width: 20,
                               height: contentView.frame.size.height-10)
        
        
        
        abvTextField.frame = CGRect(x: 50+ozTextField.frame.size.width+ozOfLable.frame.size.width+specsIngredientTextField.frame.size.width+atLable.frame.size.width,
                                    y: 5,
                                    width: 40,
                                    height: contentView.frame.size.height-10)
        percentABV.frame = CGRect(x: 60+ozTextField.frame.size.width+ozOfLable.frame.size.width+specsIngredientTextField.frame.size.width+atLable.frame.size.width+abvTextField.frame.size.width,
                                  y: 5,
                                  width: 50,
                                  height: contentView.frame.size.height-10)
    }
    
}
