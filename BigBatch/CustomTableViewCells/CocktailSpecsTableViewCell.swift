//
//  CocktailSpecsTableViewCell.swift
//  BigBatch
//
//  Created by James on 12/12/22.
//

import UIKit

protocol CocktailSpecsTableViewCellDelegate {
    func didEditCellAmountTextField(indexPath: Int, changedAmountText: String)
    func didEditCellAbvTextField(indexPath: Int, changedAbvText: String)
}

class CocktailSpecsTableViewCell: UITableViewCell, UITextFieldDelegate {

   
    static let coktailIngredientIdentifier = "Cocktail Specs Cell"

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let changedText = ozTextField.text else { return }
        guard let changedAbvText = abvTextField.text else { return }
        delegate?.didEditCellAmountTextField(indexPath: ozTextField.tag, changedAmountText: changedText)
        delegate?.didEditCellAbvTextField(indexPath: abvTextField.tag, changedAbvText: changedAbvText)
        
    }
    
    var delegate: CocktailSpecsTableViewCellDelegate?
    
    let ozTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.isEnabled = true
        textField.textAlignment = .center
        return textField
        
    }()
    

    let specsIngredientLabel: UILabel = {
        let textField = TypeLabel()
        textField.textColor = .white
        textField.isEnabled = true
        textField.textAlignment = .left
        textField.minimumScaleFactor = 12
        return textField
        
    }()
    

    
    let abvTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
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
        contentView.addSubview(ozTextField)
        contentView.addSubview(specsIngredientLabel)
        contentView.addSubview(abvTextField)
        contentView.addSubview(percentABV)
        ozTextField.inputAccessoryView = toolBar()
        abvTextField.inputAccessoryView = toolBar()
        ozTextField.borderStyle = .roundedRect
        abvTextField.borderStyle = .roundedRect
        contentView.backgroundColor = UIColor.clear
        
        ozTextField.keyboardType = .decimalPad
        abvTextField.keyboardType = .decimalPad
        
        ozTextField.delegate = self
        abvTextField.delegate = self
        ozTextField.translatesAutoresizingMaskIntoConstraints = true
        specsIngredientLabel.translatesAutoresizingMaskIntoConstraints = true
        percentABV.translatesAutoresizingMaskIntoConstraints = true
        abvTextField.translatesAutoresizingMaskIntoConstraints = true
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

        
        
        specsIngredientLabel.frame = CGRect(x: 20+ozTextField.frame.size.width,
                                       y: 5,
                                       width: 150,
                                       height: contentView.frame.size.height-10)
        

        abvTextField.frame = CGRect(x: 30+ozTextField.frame.size.width+specsIngredientLabel.frame.size.width,
                                    y: 5,
                                    width: 40,
                                    height: contentView.frame.size.height-10)
        percentABV.frame = CGRect(x: 40+ozTextField.frame.size.width+specsIngredientLabel.frame.size.width+abvTextField.frame.size.width,
                                  y: 5,
                                  width: 50,
                                  height: contentView.frame.size.height-10)
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ozTextField.resignFirstResponder()
        abvTextField.resignFirstResponder()
    }
}
