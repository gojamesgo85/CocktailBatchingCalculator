//
//  DilutionTableViewCell.swift
//  BigBatch
//
//  Created by James on 12/12/22.
//

import UIKit
protocol CocktailSpecsTableViewDilutionCellDelegate {
    func didEditDilutionCellTextField(indexPath: Int, changedText: String)
}

class DilutionTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let dilutionIdentifier = "DilutionCell"
    
    func didEditDilutionCellTextField(indexPath: Int, changedText: String) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let changedText = textField.text else { return }
        delegate?.didEditDilutionCellTextField(indexPath: percentTextField.tag, changedText: changedText)
    }
    
    
    var delegate: CocktailSpecsTableViewDilutionCellDelegate?
    
    let percentTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = .white
        textField.isEnabled = true
        textField.textAlignment = .center
        return textField
        
    }()
    
    let percentLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.backgroundColor = .clear
        lable.font = .systemFont(ofSize: 16, weight: .semibold)
        lable.minimumScaleFactor = 12
        lable.textAlignment = .left
        return lable
    }()
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(percentTextField)
        contentView.addSubview(percentLable)
        percentTextField.borderStyle = .roundedRect
        percentTextField.inputAccessoryView = toolBar()
        percentTextField.delegate = self
        
        percentTextField.keyboardType = .decimalPad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        percentTextField.frame = CGRect(x: 10,
                                        y: 5,
                                        width: 50,
                                        height: contentView.frame.size.height-10)
        
        percentLable.frame = CGRect(x: 15+Int(percentTextField.frame.size.width),
                                    y: 5,
                                    width: 280,
                                    height: Int(contentView.frame.size.height)-10)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        percentTextField.resignFirstResponder()
        
    }
}
