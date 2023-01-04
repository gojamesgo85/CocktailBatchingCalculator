//
//  TotalBatchTableViewCell.swift
//  BigBatch
//
//  Created by James on 12/15/22.
//

import UIKit

protocol BatchTableViewCellDelegate {
    func didEditBathcCellTextField(indexPath: Int, changedField: String)
}
protocol SegmentedControlChangedDelegate {
    func didChangeSegmentedControl(selectedIndex: Int, indexPath: Int)
}

class TotalBatchTableViewCell: UITableViewCell, UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let changedField = textField.text else { return }
        
        textFieldDelegate?.didEditBathcCellTextField(indexPath: textField.tag, changedField: changedField)
    }
    
    
   static let batchCellIdentifier = "Total Batch Cell"
    
    var segmentedControlDelegate: SegmentedControlChangedDelegate?
    var textFieldDelegate: BatchTableViewCellDelegate?
    
    let totalBatchIngredientNameLabel: UILabel = {
        let ingredientLable = UILabel()
        ingredientLable.textColor = .white
        ingredientLable.backgroundColor = .clear
        ingredientLable.font = .systemFont(ofSize: 16, weight: .semibold)
        ingredientLable.text = "Ingredient"
        ingredientLable.textAlignment = .center
        ingredientLable.minimumScaleFactor = 12
        return ingredientLable
    }()

  
    let segmentedControl: UISegmentedControl = {
        let items = ["1L", "750ml"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.3, green: 0.8, blue: 0.6, alpha: 1.0)
        segmentedControl.backgroundColor = .systemFill
    
        segmentedControl.selectedSegmentIndex = 0
  
        return segmentedControl
    }()
    

    
    let bottleNumberTextField: UITextField = {
        let bottleNumberTextField = UITextField()
        bottleNumberTextField.tintColor = .blue
        bottleNumberTextField.isEnabled = true
        bottleNumberTextField.textAlignment = .center
        bottleNumberTextField.keyboardType = .decimalPad
        
        return bottleNumberTextField
        
    }()
    
    let remainingMlsTextField: UITextField = {
        let remainingMlsTextField = UITextField()
        remainingMlsTextField.tintColor = .blue
        remainingMlsTextField.isEnabled = true
        remainingMlsTextField.textAlignment = .center
        remainingMlsTextField.keyboardType = .decimalPad
        return remainingMlsTextField
        
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.clear
        contentView.addSubview(totalBatchIngredientNameLabel)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(bottleNumberTextField)
        contentView.addSubview(remainingMlsTextField)
        totalBatchIngredientNameLabel.adjustsFontSizeToFitWidth = true
        bottleNumberTextField.borderStyle = .roundedRect
        remainingMlsTextField.borderStyle = .roundedRect
        
        bottleNumberTextField.inputAccessoryView = toolBar()
        remainingMlsTextField.inputAccessoryView = toolBar()
        
        bottleNumberTextField.delegate = self
        
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func segmentedControlChanged() {
        segmentedControlDelegate?.didChangeSegmentedControl(selectedIndex: segmentedControl.selectedSegmentIndex, indexPath: segmentedControl.tag)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        totalBatchIngredientNameLabel.frame = CGRect(x: 10,
                                                     y: 5,
                                                     width: 120,
                                                     height: contentView.frame.size.height-10)
        segmentedControl.frame = CGRect(x: 20+Int(totalBatchIngredientNameLabel.frame.size.width),
                                        y: 5,
                                        width: 100,
                                        height: Int(contentView.frame.size.height)-10)
        bottleNumberTextField.frame = CGRect(x: 30+totalBatchIngredientNameLabel.frame.size.width+segmentedControl.frame.size.width,
                                             y: 5,
                                             width: 50,
                                             height: contentView.frame.size.height-10)
        remainingMlsTextField.frame = CGRect(x: 40+totalBatchIngredientNameLabel.frame.size.width+segmentedControl.frame.size.width+bottleNumberTextField.frame.size.width,
                                             y: 5,
                                             width: 50,
                                             height: contentView.frame.size.height-10)
    }
}
